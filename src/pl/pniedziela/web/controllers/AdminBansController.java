package pl.pniedziela.web.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import pl.pniedziela.web.service.AdminService;

@Controller
public class AdminBansController {

	@Autowired
	AdminService adminService;

	@RequestMapping(value = "/admin/bans", method = RequestMethod.GET)
	public String getBansPage() {

		return "adminBans";
	}

	@RequestMapping("admin/bans/json")
	public @ResponseBody String getBansInJSON(HttpServletRequest request) {

		StringBuilder sb = new StringBuilder();
		sb.append("{\"status\": \"success\",\"records\": ");
		sb.append(adminService.getAllBans().toString().replaceAll("'", ""));
		sb.append("}");
		return sb.toString();
	}
}
