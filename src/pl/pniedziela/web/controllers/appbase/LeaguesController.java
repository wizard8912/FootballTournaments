package pl.pniedziela.web.controllers.appbase;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import pl.pniedziela.web.dao.ToolsDao;
import pl.pniedziela.web.domain.League;
import pl.pniedziela.web.service.LeagueService;
import pl.pniedziela.web.service.UserService;

@Controller
public class LeaguesController {

	@Autowired
	LeagueService leagueService;

	@Autowired
	ToolsDao tools;
	@Autowired
	UserService userService;
	@Autowired
	SessionLocaleResolver res;
	@Autowired
	ApplicationContext context;

	@RequestMapping(value = "/leagues", method = RequestMethod.GET)
	public String getLeagues(Model model, HttpServletRequest request) {

		String username = request.getRemoteUser();

		List<League> leagues = leagueService.getAllLeagues(username);
		model.addAttribute("leagues", leagues);
		model.addAttribute("countriesNames",
				tools.getCountriesNames().toString().replaceAll("'", "").replaceAll("\"", "'"));
		League league = new League();
		model.addAttribute("league", league);
		model.addAttribute("countryList", tools.getCountries());

		return "leagues";

	}

	@RequestMapping(value = "/leagues/add", method = RequestMethod.POST)
	public String getLeagues(League league, BindingResult result, Model model, HttpServletRequest request) {

		String username = request.getRemoteUser();
		String ipaddress = request.getRemoteAddr();

		System.out.println(league);
		leagueService.addLeague(league, username);
		userService.log(username, "leagues.leagueAdded", ipaddress);
		model.addAttribute("alert", "leagues.leagueAdded");
		return getLeagues(model, request);
	}
}
