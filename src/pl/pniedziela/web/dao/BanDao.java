package pl.pniedziela.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Repository;

import pl.pniedziela.web.domain.Ban;

@Repository
public class BanDao {

	private NamedParameterJdbcTemplate jdbc;
	@Autowired
	private StandardPasswordEncoder passwordEncoder;

	@Autowired
	public void setDataSource(DriverManagerDataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
	}

	public Ban getBan(String username, String password) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);

		List<Ban> banList = jdbc.query("CALL `football_tournaments`.`sp_getUserBanInfo`(:username);", params,
				new RowMapper<Ban>() {

					@Override
					public Ban mapRow(ResultSet rs, int rowNum) throws SQLException {

						Ban ban = new Ban();
						ban.setUserPass(rs.getString("password"));
						ban.setBanAuthor(rs.getInt("banAuthor"));
						ban.setUserId(rs.getInt("user_id"));
						ban.setUsername(rs.getString("username"));
						ban.setBanAuthorName(rs.getString("banAuthorName"));
						ban.setReason(rs.getString("reason"));
						ban.setFromDate(rs.getDate("FromDate"));
						ban.setToDate(rs.getDate("ToDate"));
						return ban;
					}

				});

		if (banList.isEmpty())
			return null;
		else {
			return passwordEncoder.matches(password, banList.get(0).getUserPass()) ? banList.get(0) : null;
		}
	}
}
