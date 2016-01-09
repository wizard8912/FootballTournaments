package pl.pniedziela.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

}
