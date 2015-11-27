package pl.pniedziela.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.pniedziela.web.dao.AppConfigDao;
import pl.pniedziela.web.domain.AppConfigBan;

@Service
public class AppConfigService {

	@Autowired
	private AppConfigDao appConfigDao;

	private AppConfigBan appConfigBan;

	public AppConfigBan getAppConfigBan() {

		return appConfigDao.getAppConfigBan();
	}

	public void setAppConfigBan(int failedLoginAttemps, long banTime, long checkLast) {
		this.appConfigBan = new AppConfigBan(failedLoginAttemps, banTime, checkLast);
	}

	public void saveAppConfigBan(String username) {

		appConfigDao.saveBanConfig(this.appConfigBan, username);
	}
}