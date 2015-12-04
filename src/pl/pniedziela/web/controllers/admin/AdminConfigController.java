package pl.pniedziela.web.controllers.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.pniedziela.web.domain.AppConfigBan;
import pl.pniedziela.web.service.AppConfigService;
import pl.pniedziela.web.service.UserService;

@Controller
public class AdminConfigController {

	@Autowired
	AppConfigService appConfigService;

	@Autowired
	UserService userService;

	@RequestMapping(value = "/admin/configure", method = RequestMethod.GET)
	public String getConfigureApp(Model model) {

		AppConfigBan appConfigBan = appConfigService.getAppConfigBan();

		model.addAttribute("checkTimeD", getDays(appConfigBan.getCheckLast()));
		model.addAttribute("checkTimeH", getHours(appConfigBan.getCheckLast()));
		model.addAttribute("checkTimeM", getMinutes(appConfigBan.getCheckLast()));

		model.addAttribute("banForTimeD", getDays(appConfigBan.getBanTime()));
		model.addAttribute("banForTimeH", getHours(appConfigBan.getBanTime()));
		model.addAttribute("banForTimeM", getMinutes(appConfigBan.getBanTime()));

		model.addAttribute("failedAttemps", appConfigBan.getFailedLoginAttemps());

		return "appConfig";
	}

	@RequestMapping(value = "/admin/configure", method = RequestMethod.POST)
	public String setConfigureApp(Model model, @RequestParam int checkTimeD, @RequestParam int checkTimeH,
			@RequestParam int checkTimeM, @RequestParam int banForTimeD, @RequestParam int banForTimeH,
			@RequestParam int banForTimeM, @RequestParam int failedAttemps, HttpServletRequest request) {

		long banCheckTime = getSeconds(checkTimeD, checkTimeH, checkTimeM);
		long banForTime = getSeconds(banForTimeD, banForTimeH, banForTimeM);

		String username = request.getRemoteUser();

		appConfigService.setAppConfigBan(failedAttemps, banForTime, banCheckTime);
		appConfigService.saveAppConfigBan(username);

		String ipaddress = request.getRemoteAddr();

		userService.log(username, "admin.changeBanConfirm", ipaddress);
		model.addAttribute("alert", "appConfig.banconfig.correctSave");
		return getConfigureApp(model);
	}

	private long getSeconds(int days, int hours, int minutes) {

		return minutes * 60 + hours * 60 * 60 + days * 24 * 60 * 60;
	}

	private int getDays(long seconds) {

		return (int) (seconds / 60 / 60 / 24);
	}

	private int getHours(long seconds) {

		return (int) ((seconds % (60 * 60 * 24)) / 60 / 60);
	}

	private int getMinutes(long seconds) {

		return (int) ((seconds % (60 * 60)) / 60);
	}

}
