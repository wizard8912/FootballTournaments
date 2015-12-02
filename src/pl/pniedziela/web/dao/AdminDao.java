package pl.pniedziela.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DriverManagerDataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
	}

	public JSONArray getHistory(String lang) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("lang", lang);
		final JSONArray json = new JSONArray();
		jdbc.query("CALL `football_tournaments`.`sp_getHistoryLogs`(:lang);", params, new RowMapper<JSONObject>() {

			@Override
			public JSONObject mapRow(ResultSet rs, int rowNum) throws SQLException {
				JSONObject obj = new JSONObject();
				obj.put("recid", rs.getInt("id"));
				obj.put("username", rs.getString("username"));
				obj.put("date", new SimpleDateFormat("yyyy-MM-dd").format(new Date(rs.getTimestamp("date").getTime())));
				obj.put("time", new SimpleDateFormat("HH:mm").format(new Date(rs.getTimestamp("date").getTime())));
				obj.put("action", rs.getString("action"));
				obj.put("ipaddress", rs.getString("ipaddress"));

				json.put(obj);
				return null;
			}

		});

		return json;
	}

	public JSONArray getAllBans() {

		final JSONArray json = new JSONArray();
		jdbc.query("CALL `football_tournaments`.`sp_getAllBans`();", new RowMapper<JSONObject>() {

			@Override
			public JSONObject mapRow(ResultSet rs, int rowNum) throws SQLException {
				JSONObject obj = new JSONObject();
				obj.put("recid", rs.getInt("id"));
				obj.put("username", rs.getString("username"));
				obj.put("bannedFromDate", new SimpleDateFormat("yyyy-MM-dd")
						.format(new Date(rs.getTimestamp("bannedFromDate").getTime())));
				obj.put("bannedFromTime",
						new SimpleDateFormat("HH:mm").format(new Date(rs.getTimestamp("bannedFromDate").getTime())));
				obj.put("bannedToDate",
						new SimpleDateFormat("yyyy-MM-dd").format(new Date(rs.getTimestamp("bannedToDate").getTime())));
				obj.put("bannedToTime",
						new SimpleDateFormat("HH:mm").format(new Date(rs.getTimestamp("bannedToDate").getTime())));
				obj.put("banauthor", rs.getString("author"));
				obj.put("reason", rs.getString("reason"));

				json.put(obj);
				return null;
			}

		});

		return json;
	}

	public JSONArray getAllUsers() {
		final JSONArray json = new JSONArray();
		jdbc.query("CALL `football_tournaments`.`sp_getAllUsers`();", new RowMapper<JSONObject>() {

			@Override
			public JSONObject mapRow(ResultSet rs, int rowNum) throws SQLException {
				JSONObject obj = new JSONObject();
				obj.put("recid", rs.getInt("id"));
				obj.put("username", rs.getString("username"));
				obj.put("firstname", rs.getString("firstname"));
				obj.put("lastname", rs.getString("lastname"));
				obj.put("city", rs.getString("city"));
				obj.put("email", rs.getString("email"));
				obj.put("birthdate",
						new SimpleDateFormat("yyyy-MM-dd").format(new Date(rs.getTimestamp("birthdate").getTime())));
				obj.put("registerdate",
						new SimpleDateFormat("yyyy-MM-dd").format(new Date(rs.getTimestamp("registerdate").getTime())));
				obj.put("registertime",
						new SimpleDateFormat("HH:mm").format(new Date(rs.getTimestamp("registerdate").getTime())));
				obj.put("country", rs.getString("country"));
				obj.put("role", rs.getString("role"));

				json.put(obj);
				return null;
			}

		});

		return json;
	}

	public void deleteUser(Integer userId, String userAdmin, String ipaddress) {
		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("userId", userId);
		params.addValue("userAdmin", userAdmin);
		params.addValue("ipaddress", ipaddress);
		System.out.println(userAdmin);
		jdbc.update("CALL `football_tournaments`.`sp_adminDeleteUser`(:userId, :userAdmin, :ipaddress);", params);

	}
}
