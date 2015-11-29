package pl.pniedziela.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

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
				Date date = new Date(rs.getTimestamp("date").getTime());
				String fdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
				obj.put("date", fdate);
				obj.put("action", rs.getString("action"));
				obj.put("ipaddress", rs.getString("ipaddress"));

				json.put(obj);
				return null;
			}

		});

		return json;
	}
}
