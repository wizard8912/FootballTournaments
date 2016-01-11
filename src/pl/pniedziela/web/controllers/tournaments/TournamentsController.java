package pl.pniedziela.web.controllers.tournaments;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.pniedziela.web.dao.ToolsDao;
import pl.pniedziela.web.domain.League;
import pl.pniedziela.web.domain.Team;
import pl.pniedziela.web.service.LeagueService;
import pl.pniedziela.web.service.TeamService;
import pl.pniedziela.web.service.TournamentService;
import pl.pniedziela.web.service.UserService;

@Controller
@RequestMapping("/tournaments")
public class TournamentController {

	@Autowired
	TeamService teamService;
	@Autowired
	LeagueService leagueService;
	@Autowired
	TournamentService tournamentService;
	@Autowired
	UserService userService;
	@Autowired
	ToolsDao tools;

	@RequestMapping("/new")
	public String getNewTournamentPage() {

		return "newTournament";
	}

	@RequestMapping("/fromTemplate")
	public String getListOfTournamentsSchemasPage(Model model, HttpServletRequest request) {

		String username = request.getRemoteUser();
		model.addAttribute("listOfLeagues", leagueService.getCompletedLeagues(username));
		return "createTournamentFromTemplate";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createTournamentFromTemplate(@RequestParam int leagueId, HttpServletRequest request, Model model) {

		String username = request.getRemoteUser();
		String ipaddress = request.getRemoteAddr();
		tournamentService.createTournamentFromTemplate(username, leagueId);
		userService.log(username, "tournaments.createTournament", ipaddress);
		model.addAttribute("alert", "tournament.tournamentCreated");
		model.addAttribute("listOfTournaments", tournamentService.getAllTournamentsForUser(username));
		return "myTournaments";
	}

	@RequestMapping(value = "/myTournaments", method = RequestMethod.GET)
	public String getMyTournamentsPage(Model model, HttpServletRequest request) {

		String username = request.getRemoteUser();
		model.addAttribute("listOfTournaments", tournamentService.getAllTournamentsForUser(username));
		return "myTournaments";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteTournament(@RequestParam int tournamentId, Model model, HttpServletRequest request) {
		String username = request.getRemoteUser();
		String ipaddress = request.getRemoteAddr();

		tournamentService.deleteTournament(tournamentId);
		userService.log(username, "tournaments.deleteTournament", ipaddress);
		model.addAttribute("alert", "tournament.tournamentDeleted");
		model.addAttribute("listOfTournaments", tournamentService.getAllTournamentsForUser(username));
		return "myTournaments";
	}

	@RequestMapping(value = "/ownTournament", method = RequestMethod.GET)
	public String getCreateTournamentPage(Model model) {

		League league = new League();
		model.addAttribute("league", league);
		model.addAttribute("countryList", tools.getCountries());

		return "createOwnTournament";
	}

	@RequestMapping(value = "/createOwn", method = RequestMethod.POST)
	public String createOwnTournament(League league, Model model, BindingResult result, HttpServletRequest request) {

		String username = request.getRemoteUser();
		String ipaddress = request.getRemoteAddr();

		int leagueId = leagueService.addLeague(league, username);
		userService.log(username, "tournament.definedTournamentSchema", ipaddress);
		model.addAttribute("alert", "tournament.definedTournamentSchema");
		List<Team> allTeams = teamService.getAllTeamsForUser(username);
		model.addAttribute("teams", allTeams);
		model.addAttribute("numberOfTeams", league.getNumberOfTeams());
		model.addAttribute("leagueId", leagueId);
		return "chooseTeamsToTournament";
	}

	@RequestMapping(value = "/chooseTeams", method = RequestMethod.POST)
	public String chooseTeamsAndCreate(@RequestParam int leagueIdF2, Model model, HttpServletRequest request) {
		String username = request.getRemoteUser();
		League league = leagueService.findLeagueById(leagueIdF2);
		List<Team> allTeams = teamService.getAllTeamsForUser(username);
		model.addAttribute("teams", allTeams);
		model.addAttribute("numberOfTeams", league.getNumberOfTeams());
		model.addAttribute("leagueId", leagueIdF2);
		return "chooseTeamsToTournament";
	}

	@RequestMapping(value = "addTeamsToTournament", method = RequestMethod.POST)
	public String addTeamsToTournament(int[] listOfTeams, @RequestParam int leagueId, Model model,
			HttpServletRequest request) {
		String username = request.getRemoteUser();

		tournamentService.createTournamentAndAddTeams(leagueId, listOfTeams, username);
		model.addAttribute("alert", "tournament.tournamentCreated");
		model.addAttribute("listOfTournaments", tournamentService.getAllTournamentsForUser(username));
		return "myTournaments";
	}
}
