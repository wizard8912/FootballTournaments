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

import pl.pniedziela.web.domain.Team;

@Repository
public class TeamDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DriverManagerDataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
	}

	public List<Team> getAllTeamsForUser(String username) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);

		List<Team> teams = jdbc.query("CALL `football_tournaments`.`sp_getTeamsForUser`(:username);", params,
				new RowMapper<Team>() {

					@Override
					public Team mapRow(ResultSet rs, int rowNum) throws SQLException {
						Team team = new Team();

						team.setId(rs.getInt("id"));
						team.setFullname(rs.getString("fullname"));
						team.setShortname(rs.getString("shortname"));
						team.setNickname(rs.getString("nickname"));
						team.setCity(rs.getString("city"));
						team.setCountry(rs.getInt("country"));
						team.setCountryName(rs.getString("countryName"));
						team.setAddress(rs.getString("address"));
						team.setFounded(rs.getInt("founded"));
						team.setLogo(rs.getString("logo"));
						team.setManager(rs.getString("manager"));
						team.setStadium(rs.getString("stadium"));
						team.setLeague(rs.getInt("league"));
						team.setLeagueName(rs.getString("leagueName"));
						team.setOnlyForMe(rs.getInt("privateForUser") > 0 ? true : false);

						return team;
					}
				});

		return teams;
	}

	public void addTeam(Team team, String username) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("fullname", team.getFullname());
		params.addValue("shortname", team.getShortname());
		params.addValue("nickname", team.getNickname());
		params.addValue("logo", team.getLogo());
		params.addValue("manager", team.getManager());
		params.addValue("stadium", team.getStadium());
		params.addValue("country", team.getCountry());
		params.addValue("city", team.getCity());
		params.addValue("address", team.getAddress());
		params.addValue("founded", team.getFounded());
		params.addValue("leagueName", team.getLeagueName());
		params.addValue("privateForUser", team.getOnlyForMe() ? username : null);
		System.out.println(team.getOnlyForMe());
		System.out.println(params.getValue("privateForUser"));

		jdbc.update(
				"CALL `football_tournaments`.`sp_addTeam`(:fullname,:shortname,:nickname,:logo,:manager,:stadium,:country,:city,:address,:founded,:leagueName,:privateForUser);",
				params);

	}

	public List<Team> getAllTeamsForLeague(String username, int leagueId) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);
		params.addValue("leagueId", leagueId);

		List<Team> teams = jdbc.query("CALL `football_tournaments`.`sp_getTeamsForLeague`(:username, :leagueId);",
				params, new RowMapper<Team>() {

					@Override
					public Team mapRow(ResultSet rs, int rowNum) throws SQLException {
						Team team = new Team();

						team.setId(rs.getInt("id"));
						team.setFullname(rs.getString("fullname"));
						team.setShortname(rs.getString("shortname"));
						team.setNickname(rs.getString("nickname"));
						team.setCity(rs.getString("city"));
						team.setCountry(rs.getInt("country"));
						team.setCountryName(rs.getString("countryName"));
						team.setAddress(rs.getString("address"));
						team.setFounded(rs.getInt("founded"));
						team.setLogo(rs.getString("logo"));
						team.setManager(rs.getString("manager"));
						team.setStadium(rs.getString("stadium"));
						team.setLeague(rs.getInt("league"));
						team.setLeagueName(rs.getString("leagueName"));
						team.setOnlyForMe(rs.getInt("privateForUser") > 0 ? true : false);

						return team;
					}
				});

		return teams;
	}

}
