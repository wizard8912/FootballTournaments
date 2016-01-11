package pl.pniedziela.web.service;

import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Service;

import pl.pniedziela.web.dao.TournamentDao;
import pl.pniedziela.web.domain.Tournament;

@Service
public class TournamentService {

	@Autowired
	TournamentDao tournamentDao;

	public void createTournamentFromTemplate(String username, int leagueId) {
		tournamentDao.createTournamentFromTemplate(username, leagueId);
	}

	public List<Tournament> getAllTournamentsForUser(String username) {
		return tournamentDao.getAllTournamentsForUser(username);
	}

	public void deleteTournament(int tournamentId) {
		tournamentDao.deleteTournament(tournamentId);
	}

	public void createTournamentAndAddTeams(int leagueId, int[] listOfTeams, String username) {
		tournamentDao.createTournamentAndAddTeams(leagueId, listOfTeams, username);
	}

	public Tournament getTournamentById(int tournamentId) {
		return tournamentDao.getTournamentById(tournamentId);
	}

	public JSONArray getHomeTeams(String tournamentId) {
		return tournamentDao.getHomeTeams(tournamentId);
	}

	public JSONArray getAwayTeams(String tournamentId, String homeTeamId) {
		return tournamentDao.getAwayTeams(tournamentId, homeTeamId);
	}

	public boolean saveMatch(MapSqlParameterSource params) {
		return tournamentDao.saveMatch(params);
	}

	public JSONArray getTable(String tournamentId) {
		return tournamentDao.getTable(tournamentId);
	}

	public JSONArray getMatches(String tournamentId) {
		return tournamentDao.getMatches(tournamentId);
	}

	public void removeMatch(String matchId) {
		tournamentDao.removeMatch(matchId);
	}

	public void editMatch(String matchId, String homeGoals, String awayGoals) {
		tournamentDao.editMatch(matchId, homeGoals, awayGoals);
	}
}
