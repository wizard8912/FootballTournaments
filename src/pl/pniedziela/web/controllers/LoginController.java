package pl.pniedziela.web.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.pniedziela.web.dao.ToolsDao;
import pl.pniedziela.web.domain.User;
import pl.pniedziela.web.listener.AuthenticationHandler;
import pl.pniedziela.web.service.BanService;
import pl.pniedziela.web.service.UserService;

@Controller
public class LoginController {

	@Autowired
	ToolsDao toolsDao;
	@Autowired
	UserService userService;
	@Autowired
	BanService banService;
	@Autowired
	AuthenticationHandler authenticationHandler;

	@RequestMapping("/")
	public String getHomePage() {

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
		model.addAttribute("error", session.getAttribute("error"));
		session.removeAttribute("error");
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
			result.rejectValue("username", "DuplicateKey.user.username");
			fail = true;
		} else if (user.getEmail() != "" && userService.findByEmail(user.getEmail()) != null) {
			result.rejectValue("email", "DuplicateKey.user.email");
			fail = true;
		}
		if (fail) {
			model.addAttribute("countryList", toolsDao.getCountries());
			return "register";
		}

		userService.saveUser(user);
		return getHomePageWithAlert("Zarejestrowano, mo¿esz siê zalogowaæ!", model);
	}

	@RequestMapping(value = "/forgotPass", method = RequestMethod.GET)
	public String getForgotPassPage() {

		return "forgotPass";
	}

	@RequestMapping(value = "/forgotPass", method = RequestMethod.POST)
	public String restPassGetUser(@RequestParam String username, @RequestParam String email, Model model) {

		User user;
		if (username.trim() == "" && email.trim() == "") {
			model.addAttribute("error", "Podaj nazwê u¿ytkownika, lub email!");
			return "forgotPass";
		} else if ((user = userService.findByLogin(username)) == null
				&& (user = userService.findByEmail(email)) == null) {

			model.addAttribute("error", "Podany u¿ytkownik nie istnieje!");
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
			@RequestParam String newPass, Model model) {

		boolean answer = userService.checkForgotPassA(username, forgotPassA);

		if (answer) {
			userService.log(username, "Przypomnienie has³a",
					"Prawid³owa odpowiedŸ na pytanie pomocnicze! Zmiana has³a.");
			User user = userService.findByLogin(username);
			user.setPassword(newPass);
			if (userService.changeUserPass(user))
				return getHomePageWithAlert("Has³o zmienione!", model);
			else {
				model.addAttribute("error", "Wyst¹pi³ b³¹d. Has³o nie zosta³o zmienione.");
				model.addAttribute("username", username);
				model.addAttribute("forgotPassQ", userService.findByLogin(username).getForgotPassQ());
				return "passAnswer";
			}
		} else {
			userService.log(username, "Przypomnienie has³a", "Nieprawid³owa odpowiedŸ na pytanie pomocnicze!");
			model.addAttribute("error", "Nieprawid³owa odpowiedŸ na pytanie pomocnicze!");
			model.addAttribute("username", username);
			model.addAttribute("forgotPassQ", userService.findByLogin(username).getForgotPassQ());
			return "passAnswer";
		}
	}
}
