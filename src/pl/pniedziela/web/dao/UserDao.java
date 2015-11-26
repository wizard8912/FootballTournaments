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

import pl.pniedziela.web.domain.User;

@Repository
public class UserDao {

	private NamedParameterJdbcTemplate jdbc;
	@Autowired
	private StandardPasswordEncoder passEncoder;

	@Autowired
	public void setDataSource(DriverManagerDataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
	}

	public boolean create(User user) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", user.getUsername());
		params.addValue("password", passEncoder.encode(user.getPassword()));
		params.addValue("firstname", user.getFirstname());
		params.addValue("lastname", user.getLastname());
		params.addValue("email", user.getEmail());
		params.addValue("birthdate", user.getBirthdate());
		params.addValue("country", user.getCountry());
		params.addValue("city", user.getCity());
		params.addValue("forgotPassQ", user.getForgotPassQ());
		params.addValue("forgotPassA", passEncoder.encode(user.getForgotPassA()));

		Integer userId = jdbc.queryForObject(
				"CALL `football_tournaments`.`sp_createNewUser`(:username,:password,:firstname,:lastname,:country,:city,:birthdate,:email, :forgotPassQ, :forgotPassA);",
				params, Integer.class);

		if (userId > 0)
			return true;
		else
			return false;
	}

	public User findByLogin(String username) {

		List<User> userList = jdbc.query("CALL `football_tournaments`.`sp_findUserByUsername`(:username);",
				new MapSqlParameterSource("username", username), new RowMapper<User>() {

					@Override
					public User mapRow(ResultSet rs, int rowNum) throws SQLException {

						User user = new User();
						user.setUsername(rs.getString("username"));
						user.setPassword(rs.getString("password"));
						user.setFirstname(rs.getString("firstname"));
						user.setLastname(rs.getString("lastname"));
						user.setEmail(rs.getString("email"));
						user.setCountry(rs.getInt("country"));
						user.setCity(rs.getString("city"));
						user.setBirthdate(rs.getDate("birthdate"));
						user.setForgotPassQ(rs.getString("forgotPassQ"));
						user.setForgotPassA(rs.getString("forgotPassA"));

						return user;
					}
				});

		if (userList.isEmpty())
			return null;
		else
			return userList.get(0);
	}

	public User findByEmail(String email) {

		List<User> userList = jdbc.query("CALL `football_tournaments`.`sp_findUserByEmail`(:email);",
				new MapSqlParameterSource("email", email), new RowMapper<User>() {

					@Override
					public User mapRow(ResultSet rs, int rowNum) throws SQLException {

						User user = new User();
						user.setUsername(rs.getString("username"));
						user.setFirstname(rs.getString("firstname"));
						user.setLastname(rs.getString("lastname"));
						user.setEmail(rs.getString("email"));
						user.setCountry(rs.getInt("country"));
						user.setCity(rs.getString("city"));
						user.setBirthdate(rs.getDate("birthdate"));
						user.setForgotPassQ(rs.getString("forgotPassQ"));
						user.setForgotPassA(rs.getString("forgotPassA"));
						return user;
					}
				});

		if (userList.isEmpty())
			return null;
		else
			return userList.get(0);
	}

	public void log(String username, String operation, String message) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);
		params.addValue("action", operation);
		params.addValue("message", message);

		jdbc.update("CALL `football_tournaments`.`sp_addUserLog`(:username, :action, :message);", params);
	}

	public boolean changeUserPass(User user) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", user.getUsername());
		params.addValue("password", passEncoder.encode(user.getPassword()));

		Integer result = jdbc.queryForObject("CALL `football_tournaments`.`sp_changeUserPass`(:username,:password);",
				params, Integer.class);

		if (result > 0)
			return true;
		else
			return false;
	}

}