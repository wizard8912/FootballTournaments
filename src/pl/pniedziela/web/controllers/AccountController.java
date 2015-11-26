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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
			for (String field : fieldsToValid) {
				if (result.hasFieldErrors(field)) {
					return "myAccount";
				}
			}
		}

		if (userService.changeUser(user)) {
			userService.log(user.getUsername(), "Zmiana danych", "Edycja konta u¿ytkownika");
			model.addAttribute("alert", "Poprawnie zmieniono dane!");
			return "myAccount";
		} else {
			model.addAttribute("alert", "Wyst¹pi³ b³¹d. Dane nie zosta³y zmienione");
			return "myAccount";
		}
	}
}
