package pl.pniedziela.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.pniedziela.web.dao.BanDao;
import pl.pniedziela.web.domain.Ban;

@Service
public class BanService {

	@Autowired
	BanDao banDao;

	public Ban getBan(String username, String password) {

		return banDao.getBan(username, password);
	}

	public String getBanInfo(String username, String password) {

		Ban ban = getBan(username, password);
		if (ban == null)
			return null;

		StringBuilder sb = new StringBuilder();
		sb.append("U¿ytkownik: " + ban.getUsername() + " jest zbanowany od dnia: " + ban.getFromDate() + " do dnia: "
				+ ban.getToDate() + ". ");
		if (ban.getReason() != null && ban.getReason() != "")
			sb.append("Powód: " + ban.getReason());
		return sb.toString();
	}
}
