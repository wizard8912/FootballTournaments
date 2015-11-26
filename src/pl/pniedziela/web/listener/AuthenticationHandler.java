package pl.pniedziela.web.listener;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import pl.pniedziela.web.service.BanService;
import pl.pniedziela.web.service.UserService;

public class AuthenticationHandler
		implements AuthenticationSuccessHandler, AuthenticationFailureHandler, LogoutSuccessHandler {

	UserService userService;
	BanService banService;

	@Autowired
	public void setUserService(UserService userService) {
		if (this.userService == null)
			this.userService = userService;
	}

	@Autowired
	public void setBanService(BanService banService) {
		if (this.banService == null)
			this.banService = banService;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			Authentication authentication) throws IOException, ServletException {

		String message = httpServletRequest.getRemoteAddr();
		String username = ((UserDetails) authentication.getPrincipal()).getUsername();
		userService.log(username, "user.login", message);
		httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/");
	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		String username = request.getParameter("j_username");
		String password = request.getParameter("j_password");
		String error = exception.getMessage();
		String banInfo = banService.getBanInfo(username, password);
		if (banInfo != null)
			error = banInfo;
		String message = error + "; " + request.getRemoteAddr();

		userService.log(username, "user.failedLogin", message);
		response.setContentType("text/html; charset=UTF-8");
		request.getSession().setAttribute("error", error);
		response.sendRedirect(request.getContextPath() + "/login");
	}

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

		String username = ((UserDetails) authentication.getPrincipal()).getUsername();
		String message = request.getRemoteAddr();
		userService.log(username, "user.logout", message);
		response.sendRedirect(request.getContextPath() + "/");

	}
}