package pl.pniedziela.web.service;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.pniedziela.web.dao.AdminDao;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;

	public JSONArray getUsersHistory(String lang) {

		return adminDao.getHistory(lang);
	}
}
