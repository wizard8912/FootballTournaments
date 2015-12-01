package pl.pniedziela.web.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import pl.pniedziela.web.dao.ToolsDao;
import pl.pniedziela.web.service.AdminService;

@Controller
public class AdminLogsController {

	@Autowired
	AdminService adminService;

	@Autowired
	ToolsDao tools;

	@Autowired
	SessionLocaleResolver res;

	@RequestMapping("admin/logs")
	public String getUsersLogs(Model model, HttpServletRequest request) {
		String lang = res.resolveLocale(request).toLanguageTag();
		model.addAttribute("actions", tools.getActions(lang).toString().replaceAll("\"", "'"));
		return "usersLogs";
	}

	@RequestMapping("admin/logs/json")
	public @ResponseBody String getLogsInJSON(HttpServletRequest request) {

		String lang = res.resolveLocale(request).toLanguageTag();
		StringBuilder sb = new StringBuilder();
		sb.append("{\"status\": \"success\",\"records\": ");
		sb.append(adminService.getUsersHistory(lang).toString().replaceAll("'", ""));
		sb.append("}");
		return sb.toString();
	}

}
