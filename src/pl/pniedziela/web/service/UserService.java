package pl.pniedziela.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Service;

import pl.pniedziela.web.dao.UserDao;
import pl.pniedziela.web.domain.User;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private StandardPasswordEncoder passEncoder;

	public boolean saveUser(User user) {

		return userDao.create(user);
	}

	public User findByLogin(String username) {

		return userDao.findByLogin(username);
	}

	public User findByEmail(String email) {

		return userDao.findByEmail(email);
	}

	public void log(String username, String operation, String message) {

		userDao.log(username, operation, message);
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
}
