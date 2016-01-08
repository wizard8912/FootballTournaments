package pl.pniedziela.web.controllers.tournaments;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.pniedziela.web.service.LeagueService;
import pl.pniedziela.web.service.TournamentService;
import pl.pniedziela.web.service.UserService;

@Controller
@RequestMapping("/tournaments")
public class TournamentController {

	@Autowired
	LeagueService leagueService;
	@Autowired
	TournamentService tournamentService;
	@Autowired
	UserService userService;

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
}
