package pl.pniedziela.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.pniedziela.web.service.UserStatsService;

@Controller
public class AccountStatsController {

	@Autowired
	UserStatsService userStatsService;

	@RequestMapping("/myAccount/info")
	public String getStats(Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		model.addAttribute("userStats", userStatsService.getUserStats(username));

		return "userStats";
	}
}
