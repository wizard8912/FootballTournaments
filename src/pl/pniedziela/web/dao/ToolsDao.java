package pl.pniedziela.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Component;

@Component
public class ToolsDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DriverManagerDataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public Map<Integer, String> getCountries() {

		return jdbc.query("SELECT id,name FROM football_tournaments.countries;",
				new ResultSetExtractor<Map<Integer, String>>() {

					@Override
					public Map<Integer, String> extractData(ResultSet rs) throws SQLException, DataAccessException {
						HashMap<Integer, String> mapRet = new HashMap<Integer, String>();
						while (rs.next()) {
							mapRet.put(Integer.parseInt(rs.getString("id")), rs.getString("name"));
						}
						return mapRet;
					}
				});

	}

	public JSONArray getUsersRoles() {

		final JSONArray array = new JSONArray();
		jdbc.query("SELECT role FROM football_tournaments.authorities_dict;", new ResultSetExtractor<List<String>>() {

			@Override
			public List<String> extractData(ResultSet rs) throws SQLException, DataAccessException {
				while (rs.next()) {
					array.put(rs.getString("role"));
				}
				return null;
			}
		}

		);

		return array;
	}

	public JSONArray getCountriesNames() {

		final JSONArray array = new JSONArray();
		jdbc.query("SELECT name FROM football_tournaments.countries;", new ResultSetExtractor<List<String>>() {

			@Override
			public List<String> extractData(ResultSet rs) throws SQLException, DataAccessException {
				while (rs.next()) {
					array.put(rs.getString("name"));
				}
				return null;
			}
		}

		);

		return array;
	}

	public JSONArray getActions(String lang) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("lang", lang);
		final JSONArray array = new JSONArray();
		jdbc.query("CALL `football_tournaments`.`sp_getAllActions`(:lang);", params,
				new ResultSetExtractor<List<String>>() {

					@Override
					public List<String> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							array.put(rs.getString("action"));
						}
						return null;
					}
				}

		);

		return array;
	}
}
