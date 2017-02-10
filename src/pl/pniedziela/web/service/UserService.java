package pl.pniedziela.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Service;

import pl.pniedziela.web.dao.UserDao;
import pl.pniedziela.web.domain.MailMail;
import pl.pniedziela.web.domain.User;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private StandardPasswordEncoder passEncoder;
	@Autowired
	private MailMail mm;

	public boolean saveUser(User user) {

		int userId = userDao.create(user);

		if (userId > 0) {
			sendActivationMail(userId);
		}

		return userId > 0 ? true : false;
	}

	private void sendActivationMail(int userId) {

		String activationLink = userDao.getActivationLink(userId);
		User user = userDao.findById(userId);

		mm.sendMail("przemek.niedziela@gmail.com", user.getEmail(), "Aktywacja konta",
				"W celu potwierdzenia rejestracji kliknij w poni¿szy link: \n <a href='http://pniedziela.pl:8080/football_tournaments/activate/"
						+ activationLink + "'>Aktywuj konto</a>");
	}

	public User findByLogin(String username) {

		return userDao.findByLogin(username);
	}

	public User findByEmail(String email) {

		return userDao.findByEmail(email);
	}

	public User findById(int id) {

		return userDao.findById(id);
	}

	public void log(String username, String operation, String ipaddress) {

		userDao.log(username, operation, ipaddress);
	}

	public boolean checkForgotPassA(String username, String forgotPassA) {

		User user = findByLogin(username);
		return passEncoder.matches(forgotPassA, user.getForgotPassA());
	}

	public boolean changeUserPass(User user) {
		return userDao.changeUserPass(user);
	}

	public boolean changeUser(User user) {

		return userDao.changeUser(user);
	}

	public boolean checkPass(User user, String actPass) {

		return passEncoder.matches(actPass, user.getPassword());
	}

	public boolean deleteAccount(User user) {

		return userDao.deleteAccount(user);
	}

	public Integer getUserRoleIdByUserId(Integer userId) {

		return userDao.getUserRoleIdByUserId(userId);
	}
}
