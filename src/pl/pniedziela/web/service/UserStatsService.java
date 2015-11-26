package pl.pniedziela.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.pniedziela.web.dao.UserStatsDao;
import pl.pniedziela.web.domain.UserStats;

@Service
public class UserStatsService {

	@Autowired
	UserStatsDao userStatsDao;

	public UserStats getUserStats(String username) {

		return userStatsDao.getStatsForUser(username);
	}
}
