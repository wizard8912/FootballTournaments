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

import pl.pniedziela.web.domain.AppConfigBan;

@Repository
public class AppConfigDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DriverManagerDataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
	}

	public boolean saveBanConfig(AppConfigBan appConfigBan, String username) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("failedLoginAttemps", appConfigBan.getFailedLoginAttemps());
		params.addValue("banTime", appConfigBan.getBanTime());
		params.addValue("checkLast", appConfigBan.getCheckLast());
		params.addValue("username", username);

		Integer result = jdbc.queryForObject(
				"CALL `football_tournaments`.`sp_setAppConfigBan`(:failedLoginAttemps, :banTime, :checkLast, :username);",
				params, Integer.class);

		if (result > 0)
			return true;
		else
			return false;
	}

	public AppConfigBan getAppConfigBan() {

		List<AppConfigBan> appConfigBanList = jdbc.query("CALL `football_tournaments`.`sp_getBanConfig`();",
				new RowMapper<AppConfigBan>() {

					@Override
					public AppConfigBan mapRow(ResultSet rs, int rowNum) throws SQLException {

						AppConfigBan appConfigBan = new AppConfigBan();
						appConfigBan.setBanTime(rs.getLong("banFLforTime"));
						appConfigBan.setCheckLast(rs.getLong("banFLpastTime"));
						appConfigBan.setFailedLoginAttemps(rs.getInt("banFLafterAttemps"));

						return appConfigBan;
					}

				});

		if (appConfigBanList.isEmpty())
			return null;
		else {
			return appConfigBanList.get(0);
		}
	}

}
