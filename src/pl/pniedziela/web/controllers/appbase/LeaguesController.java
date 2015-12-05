package pl.pniedziela.web.controllers.appbase;

import java.util.List;

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

		return "leagues";

	}

	@RequestMapping(value = "leagues/add", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getLeagues(HttpServletRequest request, Model model) {

		String username = request.getRemoteUser();
		String ipaddress = request.getRemoteAddr();

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("fullname", request.getParameter("league.fullname"));
		params.addValue("shortname", request.getParameter("league.shortname"));
		params.addValue("level", request.getParameter("league.level"));
		params.addValue("logo", request.getParameter("league.logo"));
		if (Integer.parseInt(request.getParameter("league.onlyForMe")) == 1) {
			params.addValue("onlyForMe", username);
		} else {
			params.addValue("onlyForMe", null);
		}

		params.addValue("countryName", request.getParameter("league.countryName[0][text]"));

		leagueService.addLeague(params);

		userService.log(username, "leagues.leagueAdded", ipaddress);
		return context.getMessage("leagues.leagueAdded", null, res.resolveLocale(request));
	}
}
