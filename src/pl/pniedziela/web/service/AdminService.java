package pl.pniedziela.web.service;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Service;

import pl.pniedziela.web.dao.AdminDao;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;

	public JSONArray getUsersHistory(String lang) {

		return adminDao.getHistory(lang);
	}

	public JSONArray getAllBans() {

		return adminDao.getAllBans();
	}

	public JSONArray getAllUsers() {

		return adminDao.getAllUsers();
	}

	public void deleteUser(Integer userId, String userAdmin, String ipaddress) {
		adminDao.deleteUser(userId, userAdmin, ipaddress);
	}

	public void changeUserByAdmin(MapSqlParameterSource params) {
		adminDao.changeUserByAdmin(params);
	}

	public void createUserByAdmin(MapSqlParameterSource params) {
		adminDao.createUserByAdmin(params);
	}

	public void changeUserRole(MapSqlParameterSource params) {
		adminDao.changeUserRole(params);
		
	}
}
