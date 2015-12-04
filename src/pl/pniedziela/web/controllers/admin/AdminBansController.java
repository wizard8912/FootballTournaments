package pl.pniedziela.web.controllers.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import pl.pniedziela.web.service.AdminService;
import pl.pniedziela.web.service.UserService;

@Controller
public class AdminBansController {

	@Autowired
	AdminService adminService;
	@Autowired
	UserService userService;
	@Autowired
	ApplicationContext context;
	@Autowired
	SessionLocaleResolver res;

	@RequestMapping(value = "/admin/bans", method = RequestMethod.GET)
	public String getBansPage(Model model) {

		model.addAttribute("usersList", (adminService.getUsernamesList().toString()));
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

	@RequestMapping(value = "admin/bans/delete", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String deleteBan(HttpServletRequest request) {

		String userAdmin = request.getRemoteUser();
		String ipaddress = request.getRemoteAddr();

		String banId = request.getParameter("selected[]");
		if (banId != null) {
			adminService.deleteBan(banId);
			userService.log(userAdmin, "admin.banRemove", ipaddress + " BanId: " + banId);
		}
		return getBansInJSON(request);
	}

	@RequestMapping(value = "admin/bans/add", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getUserToSave(HttpServletRequest request) {

		String userAdmin = request.getRemoteUser();
		String ipaddress = request.getRemoteAddr();

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", request.getParameter("username[text]"));
		params.addValue("todate", request.getParameter("todate") + " " + request.getParameter("totime"));
		params.addValue("reason", request.getParameter("reason"));
		params.addValue("admin", userAdmin);

		adminService.addBanForUser(params);
		userService.log(userAdmin, "admin.addBanForUser", ipaddress);
		userService.log((String) params.getValue("username"), "user.getBanFromAdmin", ipaddress);

		return context.getMessage("admin.bans.correctAdded", null, res.resolveLocale(request));
	}
}
