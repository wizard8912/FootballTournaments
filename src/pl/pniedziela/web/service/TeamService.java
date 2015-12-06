package pl.pniedziela.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.pniedziela.web.dao.TeamDao;
import pl.pniedziela.web.domain.Team;

@Service
public class TeamService {

	@Autowired
	TeamDao teamDao;

	public List<Team> getAllTeamsForUser(String username) {

		return teamDao.getAllTeamsForUser(username);
	}

	public void addTeam(Team team, String username) {
		teamDao.addTeam(team, username);
	}

	public List<Team> getAllTeamsForLeague(String username, int leagueId) {
		return teamDao.getAllTeamsForLeague(username, leagueId);
	}

}
