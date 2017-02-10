package pl.pniedziela.web.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.pniedziela.web.dao.ToolsDao;
import pl.pniedziela.web.domain.Ban;
import pl.pniedziela.web.domain.MailMail;
import pl.pniedziela.web.domain.User;
import pl.pniedziela.web.listener.AuthenticationHandler;
import pl.pniedziela.web.service.BanService;
import pl.pniedziela.web.service.UserService;

@Controller
@EnableScheduling
public class LoginController {

	@Autowired
	ToolsDao toolsDao;
	@Autowired
	UserService userService;
	@Autowired
	BanService banService;
	@Autowired
	AuthenticationHandler authenticationHandler;
	@Autowired
	MailMail mm;

	@RequestMapping("/")
	public String getHomePage(HttpServletRequest request) {
		System.out.println("wysy³anie maila");
		//mm.sendMail("from@no-spam.com", "przemek.niedziela@gmail.com", "Testing123",
		//		"Testing only \n\n Hello Spring Email Sender");
		String username = request.getRemoteUser();
		String ipaddress = request.getRemoteAddr();

		userService.log("empty", "site.mainPage", ipaddress);
		return "home";
	}

	private String getHomePageWithAlert(String alert, Model model) {

		model.addAttribute("alert", alert);
		return "home";
	}

	@RequestMapping("/login")
	public String getLoginPage(HttpSession session, Model model) {
		authenticationHandler.setUserService(userService);
		authenticationHandler.setBanService(banService);
		if (session.getAttribute("error") == "banned") {
			String username = (String) session.getAttribute("username");
			Ban ban = banService.getBan(username);
			model.addAttribute("ban", ban);
		}

		model.addAttribute("error", session.getAttribute("error"));
		session.removeAttribute("error");
		session.removeAttribute("username");
		return "login";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegisterPage(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("countryList", toolsDao.getCountries());
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerUser(@Valid User user, BindingResult result, Model model) {

		boolean fail = false;
		if (result.hasErrors()) {
			fail = true;
		} else if (user.getUsername() != "" && userService.findByLogin(user.getUsername()) != null) {
			result.rejectValue("username", "register.duplicateUser");
			fail = true;
		} else if (user.getEmail() != "" && userService.findByEmail(user.getEmail()) != null) {
			result.rejectValue("email", "register.duplicateEmail");
			fail = true;
		}
		if (fail) {
			model.addAttribute("countryList", toolsDao.getCountries());
			return "register";
		}

		userService.saveUser(user);
		return getHomePageWithAlert("register.correctRegister", model);
	}

	@RequestMapping(value = "/forgotPass", method = RequestMethod.GET)
	public String getForgotPassPage() {

		return "forgotPass";
	}

	@RequestMapping(value = "/forgotPass", method = RequestMethod.POST)
	public String restPassGetUser(@RequestParam String username, @RequestParam String email, Model model) {

		User user;
		if (username.trim() == "" && email.trim() == "") {
			model.addAttribute("error", "forgotPass.alertEmptyValues");
			return "forgotPass";
		} else if ((user = userService.findByLogin(username)) == null
				&& (user = userService.findByEmail(email)) == null) {

			model.addAttribute("error", "forgotPass.userNotExist");
			return "forgotPass";
		} else {
			return checkForgotPassAnsGet(user, model);
		}
	}

	public String checkForgotPassAnsGet(User user, Model model) {
		model.addAttribute("username", user.getUsername());
		model.addAttribute("forgotPassQ", user.getForgotPassQ());
		return "passAnswer";
	}

	@RequestMapping(value = "/checkFpAnswer", method = RequestMethod.POST)
	public String checkForgotPassAns(@RequestParam String username, @RequestParam String forgotPassA,
			@RequestParam String newPass, Model model, HttpServletRequest request) {

		boolean answer = userService.checkForgotPassA(username, forgotPassA);
		String ipaddress = request.getRemoteAddr();
		if (answer) {
			userService.log(username, "forgotPass.passChanged", ipaddress);
			User user = userService.findByLogin(username);
			user.setPassword(newPass);
			if (userService.changeUserPass(user))
				return getHomePageWithAlert("forgotPass.passChanged", model);
			else {
				model.addAttribute("error", "forgotPass.unexpectedError");
				model.addAttribute("username", username);
				model.addAttribute("forgotPassQ", userService.findByLogin(username).getForgotPassQ());
				return "passAnswer";
			}
		} else {
			userService.log(username, "forgotPass.wrongAnswer", ipaddress);
			model.addAttribute("error", "forgotPass.wrongAnswer");
			model.addAttribute("username", username);
			model.addAttribute("forgotPassQ", userService.findByLogin(username).getForgotPassQ());
			return "passAnswer";
		}
	}
}
