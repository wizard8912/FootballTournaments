package pl.pniedziela.web.controllers.tournaments;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.pniedziela.web.service.LeagueService;

@Controller
@RequestMapping("/tournaments")
public class TournamentController {

	@Autowired
	LeagueService leagueService;

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
}
