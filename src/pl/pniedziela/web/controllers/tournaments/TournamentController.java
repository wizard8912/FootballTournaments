package pl.pniedziela.web.controllers.tournaments;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pl.pniedziela.web.domain.Tournament;
import pl.pniedziela.web.service.TournamentService;

@Controller
@RequestMapping("/tournament")
public class TournamentController {

	@Autowired
	TournamentService tournamentService;

	@RequestMapping("/{tournamentId}")
	public String chooseTournamentSchema(@PathVariable int tournamentId, Model model) {
		Tournament tournament = tournamentService.getTournamentById(tournamentId);
		model.addAttribute("tournament", tournament);
		int system = Integer.parseInt(tournament.getLeague().getSystem());
		if (system == 1)
			return getGroupTournament(model);
		else if (system == 2)
			return getCupTournament(model);
		else if (system == 3)
			return getGroupCupTournament(model);
		else
			return "";
	}

	@RequestMapping("/getHomeTeams")
	public @ResponseBody String getHomeTeamsJSON(@RequestParam String tournamentId) {

		return tournamentService.getHomeTeams(tournamentId).toString();
	}

	@RequestMapping("/getAwayTeams")
	public @ResponseBody String getAwayTeamsJSON(@RequestParam String tournamentId, @RequestParam String homeTeamId) {

		return tournamentService.getAwayTeams(tournamentId, homeTeamId).toString();
	}

	@RequestMapping("/saveMatch")
	public @ResponseBody String saveMatch(@RequestParam String tournamentId, @RequestParam String homeTeamId,
			@RequestParam String awayTeamId, @RequestParam String homeTeamGoals, @RequestParam String awayTeamGoals) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("tournamentId", tournamentId);
		params.addValue("homeTeamId", homeTeamId);
		params.addValue("awayTeamId", awayTeamId);
		params.addValue("homeTeamGoals", homeTeamGoals);
		params.addValue("awayTeamGoals", awayTeamGoals);
		tournamentService.saveMatch(params);
		return "true";
	}

	@RequestMapping("/getTable")
	public @ResponseBody String getTable(@RequestParam String tournamentId) {

		return tournamentService.getTable(tournamentId).toString();
	}

	@RequestMapping("/getMatches")
	public @ResponseBody String getMatches(@RequestParam String tournamentId) {

		return tournamentService.getMatches(tournamentId).toString();
	}

	@RequestMapping("/removeMatch")
	public @ResponseBody String removeMatch(@RequestParam String matchId) {

		tournamentService.removeMatch(matchId);
		return "true";
	}

	@RequestMapping("/editMatch")
	public @ResponseBody String editMatch(@RequestParam String matchId, @RequestParam String homeGoals,
			@RequestParam String awayGoals) {

		tournamentService.editMatch(matchId, homeGoals, awayGoals);
		return "true";
	}

	private String getGroupTournament(Model model) {
		return "groupTournament";
	}

	private String getCupTournament(Model model) {
		return "cupTournament";
	}

	private String getGroupCupTournament(Model model) {
		return "groupCupTournament";
	}
}
