package pl.pniedziela.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.pniedziela.web.dao.LeagueDao;
import pl.pniedziela.web.domain.League;

@Service
public class LeagueService {

	@Autowired
	LeagueDao leagueDao;

	public List<League> getAllLeagues(String username) {
		return leagueDao.getAllLeagues(username);
	}

	public int addLeague(League league, String username) {
		return leagueDao.addLeague(league, username);

	}

	public Map<Integer, String> getLeaguesForCombo(String username) {

		return leagueDao.getLeaguesForCombo(username);

	}

	public League findLeagueById(int leagueId, String username) {
		return leagueDao.findLeagueById(leagueId, username);
	}

	public List<String> getLeaguesForAutoComplete(String username) {
		return leagueDao.getLeaguesForAutoComplete(username);
	}

	public List<League> getCompletedLeagues(String username) {
		return leagueDao.getCompletedLeagues(username);
	}

	public League findLeagueById(int leagueId) {
		return leagueDao.findLeagueById(leagueId);
	}
}
