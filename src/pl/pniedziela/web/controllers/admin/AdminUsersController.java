package pl.pniedziela.web.controllers.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import pl.pniedziela.web.dao.ToolsDao;
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
	@Autowired
	ApplicationContext context;

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

	@RequestMapping(value = "admin/users/delete", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String logs(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/plain;charset=UTF-8");
		String p_userId = request.getParameter("selected[]");
		Integer userId = p_userId != null ? Integer.parseInt(p_userId) : null;
		if (userId != null) {
			Integer role = userService.getUserRoleIdByUserId(userId);
			String userAdmin = request.getRemoteUser();
			String ipaddress = request.getRemoteAddr();

			if (role <= 2) {
				String lang = res.resolveLocale(request).toLanguageTag();
				System.out.println(lang);
				String err = (lang.equals("pl") ? "Nie mozesz usunac konta administratora!"
						: "You cannot delete admin account!");
				userService.log(userAdmin, "admin.users.tryDeleteAdminAccount", ipaddress);
				return "{status: 'error', message: '" + err + "'}";
			}
			adminService.deleteUser(userId, userAdmin, ipaddress);
		}
		return getUsersInJSON();
	}

	@RequestMapping(value = "admin/users/edit", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getUserToEdit(HttpServletRequest request) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("userId", request.getParameter("recid"));
		params.addValue("username", request.getParameter("username"));
		params.addValue("firstname", request.getParameter("firstname"));
		params.addValue("lastname", request.getParameter("lastname"));
		params.addValue("city", request.getParameter("city"));
		params.addValue("country", request.getParameter("country[text]"));
		params.addValue("birthdate", request.getParameter("birthdate"));
		params.addValue("email", request.getParameter("email"));

		String userAdmin = request.getRemoteUser();
		String ipaddress = request.getRemoteAddr();

		userService.log(userAdmin, "admin.edituseraccount", ipaddress);
		userService.log((String) params.getValue("username"), "user.editaccountbyadmin", ipaddress);

		adminService.changeUserByAdmin(params);
		return context.getMessage("admin.user.correctEdited", null, res.resolveLocale(request));
	}

	@RequestMapping(value = "admin/users/add", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getUserToSave(HttpServletRequest request) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", request.getParameter("username"));
		params.addValue("password", request.getParameter("password"));
		params.addValue("firstname", request.getParameter("firstname"));
		params.addValue("lastname", request.getParameter("lastname"));
		params.addValue("city", request.getParameter("city"));
		params.addValue("country", request.getParameter("country[text]"));
		params.addValue("birthdate", request.getParameter("birthdate"));
		params.addValue("email", request.getParameter("email"));
		params.addValue("forgotPassQ", request.getParameter("forgotPassQ"));
		params.addValue("forgotPassA", request.getParameter("forgotPassA"));

		String userAdmin = request.getRemoteUser();
		String ipaddress = request.getRemoteAddr();

		userService.log(userAdmin, "admin.adduseraccount", ipaddress);
		userService.log((String) params.getValue("username"), "user.addaccountbyadmin", ipaddress);

		adminService.createUserByAdmin(params);
		return context.getMessage("admin.user.correctAdded", null, res.resolveLocale(request));
	}

	@RequestMapping(value = "admin/users/role", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getUserToSetRole(HttpServletRequest request) {

		String userAdmin = request.getRemoteUser();
		String ipaddress = request.getRemoteAddr();

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", Integer.parseInt(request.getParameter("recid")));
		params.addValue("username", request.getParameter("username"));
		params.addValue("role", request.getParameter("role[text]"));
		params.addValue("admin", userAdmin);

		adminService.changeUserRole(params);
		userService.log(userAdmin, "admin.setUserRole", ipaddress);
		userService.log((String) params.getValue("username"), "user.changerole", ipaddress);

		return context.getMessage("admin.user.roleChanged", null, res.resolveLocale(request));
	}
}
