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

import pl.pniedziela.web.domain.League;

@Repository
public class LeagueDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DriverManagerDataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
	}

	public List<League> getAllLeagues(String username) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);
		List<League> leagues = jdbc.query("CALL `football_tournaments`.`sp_getLeaguesForUser`(:username);", params,
				new RowMapper<League>() {

					@Override
					public League mapRow(ResultSet rs, int rowNum) throws SQLException {

						League league = new League();
						league.setId(rs.getInt("id"));
						league.setFullname(rs.getString("fullname"));
						league.setShortname(rs.getString("shortname"));
						league.setLevel(rs.getInt("level"));
						league.setCountry(rs.getInt("country"));
						league.setLogo(rs.getString("logo"));
						league.setCountryName(rs.getString("countryName"));
						if (rs.getString("privateForUser") != null
								&& Integer.parseInt(rs.getString("privateForUser")) > 0) {
							league.setOnlyForMe(1);
						}

						return league;
					}
				});

		return leagues;
	}

	public void addLeague(MapSqlParameterSource params) {
		jdbc.update(
				"CALL `football_tournaments`.`sp_addLeague`(:fullname, :shortname, :level, :logo, :onlyForMe, :countryName);",
				params);
	}
}
