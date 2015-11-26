package pl.pniedziela.web.controllers;

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

		if (result.hasErrors()) {
			model.addAttribute("countryList", toolsDao.getCountries());
			return "myAccount";
		}

		return "";
	}
}
