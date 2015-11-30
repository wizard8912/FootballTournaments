package pl.pniedziela.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pl.pniedziela.web.dao.ToolsDao;
import pl.pniedziela.web.service.AdminService;

@Controller
public class AdminUsersController {

	@Autowired
	AdminService adminService;

	@Autowired
	ToolsDao tools;

	@RequestMapping("admin/users")
	public String getUsersLogs(Model model) {
		model.addAttribute("usersRoles", tools.getUsersRoles().toString().replaceAll("\"", "'"));
		model.addAttribute("countriesNames",
				tools.getCountriesNames().toString().replaceAll("'", "").replaceAll("\"", "'"));
		return "adminUsers";
	}

	@RequestMapping("admin/users/json")
	public @ResponseBody String getLogsInJSON() {

		StringBuilder sb = new StringBuilder();
		sb.append("{\"status\": \"success\",\"records\": ");
		sb.append(adminService.getAllUsers().toString().replaceAll("'", ""));
		sb.append("}");
		return sb.toString();
	}
}
