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
						league.setNumberOfGroups(rs.getInt("groupsNumber"));
						league.setNumberOfTeams(rs.getInt("teamsNumber"));
						league.setSystem(rs.getString("system"));
						league.setDoubleGroupMatches(rs.getInt("doubleGroupMatches"));
						league.setDoubleCupMatches(rs.getInt("doubleCupMatches"));
						league.setDoubleFinalMatches(rs.getInt("doubleFinalMatches"));

						return league;
					}
				});

		return leagues;
	}

	public void addLeague(League league, String username) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("fullname", league.getFullname());
		params.addValue("shortname", league.getShortname());
		params.addValue("level", league.getLevel());
		params.addValue("logo", league.getLogo());
		if (league.getOnlyForMe() == 1) {
			params.addValue("onlyForMe", username);
		} else {
			params.addValue("onlyForMe", null);
		}
		params.addValue("countryId", league.getCountry());
		params.addValue("numgroups", league.getNumberOfGroups());
		params.addValue("numTeams", league.getNumberOfTeams());
		params.addValue("doubleGroupMatches", league.getDoubleGroupMatches());
		params.addValue("doubleCupMatches", league.getDoubleCupMatches());
		params.addValue("doubleFinalMatches", league.getDoubleFinalMatches());
		params.addValue("system", league.getSystem());

		jdbc.update(
				"CALL `football_tournaments`.`sp_addLeague`(:fullname, :shortname, :level, :logo, :onlyForMe, :countryId, :numgroups, :numTeams, :doubleGroupMatches, :doubleCupMatches, :doubleFinalMatches, :system);",
				params);
	}
}
