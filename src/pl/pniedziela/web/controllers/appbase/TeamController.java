package pl.pniedziela.web.controllers.appbase;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.pniedziela.web.dao.ToolsDao;
import pl.pniedziela.web.domain.League;
import pl.pniedziela.web.domain.Team;
import pl.pniedziela.web.service.LeagueService;
import pl.pniedziela.web.service.TeamService;
import pl.pniedziela.web.service.UserService;

@Controller
public class TeamController {

	@Autowired
	TeamService teamService;
	@Autowired
	ToolsDao toolsDao;
	@Autowired
	LeagueService leagueService;
	@Autowired
	UserService userService;

	@RequestMapping(value = "/teams", method = RequestMethod.GET)
	public String getTeams(Model model, HttpServletRequest request) {

		String username = request.getRemoteUser();

		List<Team> allTeams = teamService.getAllTeamsForUser(username);
		model.addAttribute("teams", allTeams);
		model = configureModelForTeamAdd(model, username);
		return "teams";
	}

	@RequestMapping(value = "/teams/{leagueId}", method = RequestMethod.GET)
	public String getTeamsForLeague(@PathVariable int leagueId, Model model, HttpServletRequest request) {
		String username = request.getRemoteUser();

		List<Team> allTeams = teamService.getAllTeamsForLeague(username, leagueId);
		model.addAttribute("teams", allTeams);
		model = configureModelForTeamAdd(model, username);
		League league = leagueService.findLeagueById(leagueId, username);
		model.addAttribute("league", league);
		return "teams";
	}

	@RequestMapping(value = "/teams/add", method = RequestMethod.POST)
	public String addTeam(Team team, BindingResult result, Model model, HttpServletRequest request) {

		team.setLeagueName(team.getLeagueName().substring(0, team.getLeagueName().indexOf('(') - 1));
		String username = request.getRemoteUser();
		String ipaddress = request.getRemoteAddr();

		teamService.addTeam(team, username);
		userService.log(username, "team.addTeam", ipaddress);
		model.addAttribute("alert", "team.addteamCorrectly");
		return getTeams(model, request);
	}

	private Model configureModelForTeamAdd(Model model, String username) {
		Team team = new Team();
		model.addAttribute("team", team);
		model.addAttribute("countryList", toolsDao.getCountries());
		List<String> leagues = leagueService.getLeaguesForAutoComplete(username);
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		for (String string : leagues) {
			sb.append("\'");
			sb.append(string);
			sb.append("\',");
		}
		sb.append("]");
		model.addAttribute("leagueList", sb.toString());
		return model;
	}
}
