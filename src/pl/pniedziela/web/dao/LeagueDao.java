package pl.pniedziela.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

import pl.pniedziela.web.domain.League;
import pl.pniedziela.web.domain.User;

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
							league.setOnlyForMe(true);
						}
						league.setNumberOfGroups(rs.getInt("groupsNumber"));
						league.setNumberOfTeams(rs.getInt("teamsNumber"));
						league.setSystem(rs.getString("system"));
						league.setDoubleGroupMatches(rs.getInt("doubleGroupMatches") > 0 ? true : false);
						league.setDoubleCupMatches(rs.getInt("doubleCupMatches") > 0 ? true : false);
						league.setDoubleFinalMatches(rs.getInt("doubleFinalMatches") > 0 ? true : false);

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
		if (league.getOnlyForMe()) {
			params.addValue("onlyForMe", username);
		} else {
			params.addValue("onlyForMe", null);
		}
		params.addValue("countryId", league.getCountry());
		params.addValue("numgroups", league.getNumberOfGroups());
		params.addValue("numTeams", league.getNumberOfTeams());
		params.addValue("doubleGroupMatches", league.getDoubleGroupMatches() ? 1 : 0);
		params.addValue("doubleCupMatches", league.getDoubleCupMatches() ? 1 : 0);
		params.addValue("doubleFinalMatches", league.getDoubleFinalMatches() ? 1 : 0);
		params.addValue("system", league.getSystem());

		jdbc.update(
				"CALL `football_tournaments`.`sp_addLeague`(:fullname, :shortname, :level, :logo, :onlyForMe, :countryId, :numgroups, :numTeams, :doubleGroupMatches, :doubleCupMatches, :doubleFinalMatches, :system);",
				params);
	}

	public Map<Integer, String> getLeaguesForCombo(String username) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);

		return jdbc.query("CALL `football_tournaments`.`sp_getLeaguesCombo` (:username);", params,
				new ResultSetExtractor<Map<Integer, String>>() {

					@Override
					public Map<Integer, String> extractData(ResultSet rs) throws SQLException, DataAccessException {
						HashMap<Integer, String> mapRet = new HashMap<Integer, String>();
						while (rs.next()) {
							mapRet.put(Integer.parseInt(rs.getString("id")), rs.getString("fullname"));
						}
						return mapRet;
					}
				});
	}

	public League findLeagueById(int leagueId, String username) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("leagueId", leagueId);
		params.addValue("username", username);

		List<League> leagueList = jdbc.query("CALL `football_tournaments`.`sp_findLeagueById`(:leagueId, :username);",
				params, new RowMapper<League>() {

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
							league.setOnlyForMe(true);
						}
						league.setNumberOfGroups(rs.getInt("groupsNumber"));
						league.setNumberOfTeams(rs.getInt("teamsNumber"));
						league.setSystem(rs.getString("system"));
						league.setDoubleGroupMatches(rs.getInt("doubleGroupMatches") > 0 ? true : false);
						league.setDoubleCupMatches(rs.getInt("doubleCupMatches") > 0 ? true : false);
						league.setDoubleFinalMatches(rs.getInt("doubleFinalMatches") > 0 ? true : false);

						return league;
					}
				});

		if (leagueList.isEmpty())
			return null;
		else
			return leagueList.get(0);
	}

	public List<String> getLeaguesForAutoComplete(String username) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);

		List<String> leagueList = jdbc.query("CALL `football_tournaments`.`sp_findLeaguesToAutocomplete`(:username);",
				params, new RowMapper<String>() {

					@Override
					public String mapRow(ResultSet rs, int rowNum) throws SQLException {

						return rs.getString("league");
					}
				});

		return leagueList;
	}

	public List<League> getCompletedLeagues(String username) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);
		List<League> leagues = jdbc.query("CALL `football_tournaments`.`sp_getCompletedLeaguesForUser`(:username);",
				params, new RowMapper<League>() {

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
							league.setOnlyForMe(true);
						}
						league.setNumberOfGroups(rs.getInt("groupsNumber"));
						league.setNumberOfTeams(rs.getInt("teamsNumber"));
						league.setSystem(rs.getString("system"));
						league.setDoubleGroupMatches(rs.getInt("doubleGroupMatches") > 0 ? true : false);
						league.setDoubleCupMatches(rs.getInt("doubleCupMatches") > 0 ? true : false);
						league.setDoubleFinalMatches(rs.getInt("doubleFinalMatches") > 0 ? true : false);

						return league;
					}
				});

		return leagues;
	}
}