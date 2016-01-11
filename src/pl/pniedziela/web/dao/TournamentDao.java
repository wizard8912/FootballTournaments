package pl.pniedziela.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Component;

import pl.pniedziela.web.domain.League;
import pl.pniedziela.web.domain.Tournament;
import pl.pniedziela.web.service.LeagueService;

@Component
public class TournamentDao {

	@Autowired
	private LeagueService leagueService;
	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DriverManagerDataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public void createTournamentFromTemplate(String username, int leagueId) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);
		params.addValue("leagueId", leagueId);

		jdbc.update("CALL `football_tournaments`.`sp_createTournamentFromTemplate`(:username,:leagueId);", params);
	}

	public List<Tournament> getAllTournamentsForUser(String username) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);
		List<Tournament> tournaments = jdbc.query("CALL `football_tournaments`.`sp_getTournamentsForUser`(:username);",
				params, new RowMapper<Tournament>() {

					@Override
					public Tournament mapRow(ResultSet rs, int rowNum) throws SQLException {

						Tournament tournament = new Tournament();
						tournament.setId(rs.getInt("id"));
						tournament.setForUser(rs.getInt("forUser"));
						tournament.setAddedTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
								.format(new Date(rs.getTimestamp("addedTime").getTime())));
						tournament.setLeague(leagueService.findLeagueById(rs.getInt("league")));

						return tournament;
					}
				});

		return tournaments;
	}

	public void deleteTournament(int tournamentId) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("tournamentId", tournamentId);

		jdbc.update("CALL `football_tournaments`.`sp_deleteTournament`(:tournamentId);", params);

	}

	public void createTournamentAndAddTeams(int leagueId, int[] listOfTeams, String username) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);
		params.addValue("leagueId", leagueId);

		int tournamentId = jdbc.query(
				"CALL `football_tournaments`.`sp_createTournamentFromTemplate`(:username,:leagueId);", params,
				new ResultSetExtractor<Integer>() {

					@Override
					public Integer extractData(ResultSet rs) throws SQLException, DataAccessException {
						Integer tournamentId = 0;
						while (rs.next()) {
							tournamentId = rs.getInt("id");
						}
						return tournamentId;
					}
				});

		for (int teamId : listOfTeams) {
			params = new MapSqlParameterSource();
			params.addValue("teamId", teamId);
			params.addValue("tournamentId", tournamentId);

			jdbc.update("CALL `football_tournaments`.`sp_addTeamToTournament`(:teamId,:tournamentId);", params);
		}
	}

	public Tournament getTournamentById(int tournamentId) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("tournamentId", tournamentId);
		List<Tournament> tournaments = jdbc.query("CALL `football_tournaments`.`sp_getTournamentById`(:tournamentId);",
				params, new RowMapper<Tournament>() {

					@Override
					public Tournament mapRow(ResultSet rs, int rowNum) throws SQLException {

						Tournament tournament = new Tournament();
						tournament.setId(rs.getInt("id"));
						tournament.setForUser(rs.getInt("forUser"));
						tournament.setAddedTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
								.format(new Date(rs.getTimestamp("addedTime").getTime())));
						tournament.setLeague(leagueService.findLeagueById(rs.getInt("league")));

						return tournament;
					}
				});

		if (tournaments.isEmpty())
			return null;
		else
			return tournaments.get(0);
	}

	public JSONArray getHomeTeams(String tournamentId) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("tournamentId", tournamentId);
		final JSONArray json = new JSONArray();
		jdbc.query("CALL `football_tournaments`.`sp_getHomeTeams`(:tournamentId);", params,
				new RowMapper<JSONObject>() {

					@Override
					public JSONObject mapRow(ResultSet rs, int rowNum) throws SQLException {
						JSONObject obj = new JSONObject();
						obj.put("image", rs.getString("logo"));
						obj.put("description", rs.getString("description"));
						obj.put("value", rs.getString("value"));
						obj.put("text", rs.getString("text"));

						json.put(obj);
						return null;
					}

				});

		return json;
	}

	public JSONArray getAwayTeams(String tournamentId, String homeTeamId) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("tournamentId", tournamentId);
		params.addValue("homeTeamId", homeTeamId);
		final JSONArray json = new JSONArray();
		jdbc.query("CALL `football_tournaments`.`sp_getAwayTeams`(:tournamentId,:homeTeamId);", params,
				new RowMapper<JSONObject>() {

					@Override
					public JSONObject mapRow(ResultSet rs, int rowNum) throws SQLException {
						JSONObject obj = new JSONObject();
						obj.put("image", rs.getString("logo"));
						obj.put("description", rs.getString("description"));
						obj.put("value", rs.getString("value"));
						obj.put("text", rs.getString("text"));

						json.put(obj);
						return null;
					}

				});

		return json;
	}

	public boolean saveMatch(MapSqlParameterSource params) {

		jdbc.update(
				"CALL `football_tournaments`.`sp_saveMatch`(:tournamentId,:homeTeamId,:awayTeamId,:homeTeamGoals,:awayTeamGoals);",
				params);
		return true;
	}

	public JSONArray getTable(String tournamentId) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("tournamentId", tournamentId);
		final JSONArray json = new JSONArray();
		jdbc.query("CALL `football_tournaments`.`sp_getTableForTournament`(:tournamentId);", params,
				new RowMapper<JSONObject>() {

					@Override
					public JSONObject mapRow(ResultSet rs, int rowNum) throws SQLException {
						JSONObject obj = new JSONObject();
						obj.put("fullname", rs.getString("fullname"));
						obj.put("matches", rs.getString("matches"));
						obj.put("wins", rs.getString("wins"));
						obj.put("draws", rs.getString("draws"));
						obj.put("losts", rs.getString("losts"));
						obj.put("goalsScored", rs.getString("goalsScored"));
						obj.put("goalsLost", rs.getString("goalsLost"));
						obj.put("goalsDifference", rs.getString("goalsDifference"));
						obj.put("points", rs.getString("points"));

						json.put(obj);
						return null;
					}

				});

		return json;
	}

}
