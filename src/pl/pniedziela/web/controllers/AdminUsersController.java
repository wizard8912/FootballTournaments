package pl.pniedziela.web.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import pl.pniedziela.web.dao.ToolsDao;
import pl.pniedziela.web.domain.User;
import pl.pniedziela.web.service.AdminService;
import pl.pniedziela.web.service.UserService;

@Controller
public class AdminUsersController {

	@Autowired
	AdminService adminService;

	@Autowired
	UserService userService;

	@Autowired
	ToolsDao tools;

	@Autowired
	SessionLocaleResolver res;

	@RequestMapping("admin/users")
	public String getUsersLogs(Model model) {
		model.addAttribute("usersRoles", tools.getUsersRoles().toString().replaceAll("\"", "'"));
		model.addAttribute("countriesNames",
				tools.getCountriesNames().toString().replaceAll("'", "").replaceAll("\"", "'"));
		return "adminUsers";
	}

	@RequestMapping("admin/users/json")
	public @ResponseBody String getUsersInJSON() {

		StringBuilder sb = new StringBuilder();
		sb.append("{\"status\": \"success\",\"records\": ");
		sb.append(adminService.getAllUsers().toString().replaceAll("'", ""));
		sb.append("}");
		return sb.toString();
	}

	@RequestMapping(value = "admin/users/delete", method = RequestMethod.POST)
	public @ResponseBody String logs(HttpServletRequest request) {
		String p_userId = request.getParameter("selected[]");
		Integer userId = p_userId != null ? Integer.parseInt(p_userId) : null;
		if (userId != null) {
			Integer role = userService.getUserRoleIdByUserId(userId);
			String userAdmin = request.getRemoteUser();
			String ipaddress = request.getRemoteAddr();

			if (role <= 2) {
				String lang = res.resolveLocale(request).toLanguageTag();
				System.out.println(lang);
				String err = (lang.equals("pl") ? "Nie mo¿esz usun¹æ konta administratora!"
						: "You cannot delete admin account!");
				userService.log(userAdmin, "admin.users.tryDeleteAdminAccount", ipaddress);
				return "{status: 'error', message: '" + err + "'}";
			}
			adminService.deleteUser(userId, userAdmin, ipaddress);
		}
		return getUsersInJSON();
	}
}
