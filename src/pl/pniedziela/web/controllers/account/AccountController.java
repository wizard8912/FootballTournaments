package pl.pniedziela.web.controllers.account;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.pniedziela.web.dao.ToolsDao;
import pl.pniedziela.web.domain.User;
import pl.pniedziela.web.service.UserService;

@Controller
public class AccountController {

	@Autowired
	private ToolsDao toolsDao;
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/myAccount", method = RequestMethod.GET)
	public String getAccountPage(HttpServletRequest request, Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userService.findByLogin(auth.getName());
		model.addAttribute("user", user);
		model.addAttribute("countryList", toolsDao.getCountries());

		return "myAccount";
	}

	@RequestMapping(value = "/myAccount", method = RequestMethod.POST)
	public String changeAccount(@Valid User user, BindingResult result, Model model, HttpServletRequest request) {
		String ipaddress = request.getRemoteAddr();
		List<String> fieldsToValid = new ArrayList<String>();
		fieldsToValid.add("email");
		fieldsToValid.add("firstname");
		fieldsToValid.add("lastname");
		fieldsToValid.add("country");
		fieldsToValid.add("city");
		fieldsToValid.add("birthdate");

		model.addAttribute("countryList", toolsDao.getCountries());

		if (result.hasErrors()) {
			List<String> errors = new ArrayList<>();
			for (Object object : result.getAllErrors()) {
				if (fieldsToValid.contains(((FieldError) object).getField())) {
					errors.add(((FieldError) object).getDefaultMessage());
				}
			}

			if (errors.size() > 0) {
				model.addAttribute("errors", errors);
				return "myAccount";
			}
		}

		if (userService.changeUser(user)) {
			userService.log(user.getUsername(), "account.successChange", ipaddress);
			model.addAttribute("alert", "account.successChange");
			return "myAccount";
		} else {
			userService.log(user.getUsername(), "account.unsuccessChange", ipaddress);
			model.addAttribute("alert", "account.unsuccessChange");
			return "myAccount";
		}
	}

	@RequestMapping(value = "/myAccount/changePassword", method = RequestMethod.GET)
	public String changePassword() {

		return "changePassword";
	}

	@RequestMapping(value = "/myAccount/changePassword", method = RequestMethod.POST)
	public String changePassword(@RequestParam String actPass, @RequestParam String newPass, Model model,
			HttpServletRequest request) {
		String ipaddress = request.getRemoteAddr();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userService.findByLogin(auth.getName());
		if (userService.checkPass(user, actPass)) {
			user.setPassword(newPass);
			if (userService.changeUserPass(user)) {
				model.addAttribute("alert", "account.successPassChange");
				model.addAttribute("user", user);
				model.addAttribute("countryList", toolsDao.getCountries());
				userService.log(user.getUsername(), "account.successPassChange", ipaddress);
				return "myAccount";
			} else {
				model.addAttribute("error", "account.unsuccessPassChange");
				userService.log(user.getUsername(), "account.unsuccessPassChange", ipaddress);
				return "changePassword";
			}
		} else {
			model.addAttribute("error", "account.wrongPass");
			userService.log(user.getUsername(), "account.wrongPass", ipaddress);
			return "changePassword";
		}
	}

	@RequestMapping(value = "/myAccount/deleteAccount", method = RequestMethod.GET)
	public String deleteAccount() {

		return "deleteAccount";
	}

	@RequestMapping(value = "/myAccount/deleteAccount", method = RequestMethod.POST)
	public String deleteAccount(@RequestParam String password, Model model, HttpServletRequest request)
			throws ServletException {

		String ipaddress = request.getRemoteAddr();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userService.findByLogin(auth.getName());
		if (!userService.checkPass(user, password)) {
			model.addAttribute("error", "deleteAccount.wrongPassword");
			userService.log(user.getUsername(), "deleteAccount.wrongPassword", ipaddress);
			return "deleteAccount";
		} else {
			try {
				if (!userService.deleteAccount(user)) {
					throw new Exception("deleteAccount.unexpectedException");
				}
				userService.log(user.getUsername(), "deleteAccount.correctDeleted", ipaddress);
				model.addAttribute("alert", "deleteAccount.correctDeleted");
			} catch (Exception e) {
				userService.log(user.getUsername(), "e.getMessage()", ipaddress);
				model.addAttribute("alert", e.getMessage());
			}

			return "redirect:/j_spring_security_logout";
		}
	}
}
