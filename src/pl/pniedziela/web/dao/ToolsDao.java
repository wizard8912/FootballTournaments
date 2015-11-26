package pl.pniedziela.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
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
}
