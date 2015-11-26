package pl.pniedziela.web.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DataBinder;
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
	public String getAccountPage(Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userService.findByLogin(auth.getName());
		model.addAttribute("user", user);
		model.addAttribute("countryList", toolsDao.getCountries());
		return "myAccount";
	}

	@RequestMapping(value = "/myAccount", method = RequestMethod.POST)
	public String changeAccount(@Valid User user, BindingResult result, Model model) {
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
			userService.log(user.getUsername(), "log.changeAccount", "account.successChange");
			model.addAttribute("alert", "account.successChange");
			return "myAccount";
		} else {
			userService.log(user.getUsername(), "log.changeAccount", "account.unsuccessChange");
			model.addAttribute("alert", "account.unsuccessChange");
			return "myAccount";
		}
	}

	@RequestMapping(value = "/myAccount/changePassword", method = RequestMethod.GET)
	public String changePassword() {

		return "changePassword";
	}

	@RequestMapping(value = "/myAccount/changePassword", method = RequestMethod.POST)
	public String changePassword(@RequestParam String actPass, @RequestParam String newPass, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userService.findByLogin(auth.getName());
		if (userService.checkPass(user, actPass)) {
			user.setPassword(newPass);
			if (userService.changeUserPass(user)) {
				model.addAttribute("alert", "account.successPassChange");
				model.addAttribute("user", user);
				model.addAttribute("countryList", toolsDao.getCountries());
				userService.log(user.getUsername(), "log.changePassword", "account.successPassChange");
				return "myAccount";
			} else {
				model.addAttribute("alert", "account.unsuccessPassChange");
				userService.log(user.getUsername(), "log.changePassword", "account.unsuccessPassChange");
				return "changePassword";
			}
		} else {
			model.addAttribute("alert", "account.wrongPass");
			userService.log(user.getUsername(), "log.changePassword", "account.wrongPass");
			return "changePassword";
		}
	}
}
