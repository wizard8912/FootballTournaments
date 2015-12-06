package pl.pniedziela.web.controllers.appbase;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

		Team team = new Team();
		List<Team> allTeams = teamService.getAllTeamsForUser(username);
		model.addAttribute("teams", allTeams);
		model.addAttribute("team", team);
		model.addAttribute("countryList", toolsDao.getCountries());
		model.addAttribute("leagueList", leagueService.getLeaguesForCombo(username));
		return "teams";
	}

	@RequestMapping(value = "/teams/{leagueId}", method = RequestMethod.GET)
	public String getTeamsForLeague(@PathVariable int leagueId, Model model, HttpServletRequest request) {
		String username = request.getRemoteUser();

		Team team = new Team();
		List<Team> allTeams = teamService.getAllTeamsForLeague(username, leagueId);
		model.addAttribute("teams", allTeams);
		model.addAttribute("team", team);
		model.addAttribute("countryList", toolsDao.getCountries());
		model.addAttribute("leagueList", leagueService.getLeaguesForCombo(username));
		League league = leagueService.findLeagueById(leagueId, username);
		model.addAttribute("league", league);
		return "teams";
	}

	@RequestMapping(value = "/teams/add", method = RequestMethod.POST)
	public String addTeam(Team team, BindingResult result, Model model, HttpServletRequest request) {
		System.out.println(team);
		String username = request.getRemoteUser();
		String ipaddress = request.getRemoteAddr();

		teamService.addTeam(team, username);
		userService.log(username, "team.addTeam", ipaddress);
		model.addAttribute("alert", "team.addteamCorrectly");
		return getTeams(model, request);
	}
}
