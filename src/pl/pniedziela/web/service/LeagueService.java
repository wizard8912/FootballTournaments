package pl.pniedziela.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
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

	public void addLeague(League league, String username) {
		leagueDao.addLeague(league, username);

	}
}
