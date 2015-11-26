package pl.pniedziela.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

import pl.pniedziela.web.domain.UserStats;

@Repository
public class UserStatsDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setJdbc(DriverManagerDataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
	}

	public UserStats getStatsForUser(String username) {
		List<UserStats> userStatsList = jdbc.query("CALL `football_tournaments`.`sp_getUserStats`(:username);",
				new MapSqlParameterSource("username", username), new RowMapper<UserStats>() {

					@Override
					public UserStats mapRow(ResultSet rs, int rowNum) throws SQLException {

						UserStats userStats = new UserStats();
						userStats.setUsername(rs.getString("username"));
						userStats.setRegisterDate(rs.getDate("registerDate"));
						userStats.setLastSuccessLogin(rs.getDate("lastSuccessLogin"));
						userStats.setLastFailedLogin(rs.getDate("lastFailedLogin"));
						userStats.setLoginCount(rs.getInt("loginCount"));

						return userStats;
					}
				});

		if (userStatsList.isEmpty())
			return null;
		else
			return userStatsList.get(0);
	}

}
