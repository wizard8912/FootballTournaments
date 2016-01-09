package pl.pniedziela.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
}
