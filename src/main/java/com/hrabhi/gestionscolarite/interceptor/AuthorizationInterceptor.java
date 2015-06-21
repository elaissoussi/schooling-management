package com.hrabhi.gestionscolarite.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hrabhi.gestionscolarite.model.User;


/**
 * handle all requests for checking authorization
 */
public class AuthorizationInterceptor extends HandlerInterceptorAdapter
{
	private static final Logger LOG = Logger.getLogger(AuthorizationInterceptor.class);
	private static final String DELIMITER = "/";
	private List<String> excludedPaths;

	@Override
	public boolean preHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler)
			throws Exception
	{
		LOG.info("Intercepting URI: " + request.getRequestURI());

		if (checkExcludedPaths(request) || checkUserIsAuthorized(request))
		{
			return true;
		}
		request.getRequestDispatcher("/").forward(request, response);
		return false;
	}

	private boolean checkUserIsAuthorized(final HttpServletRequest request)
	{
		final HttpSession session = request.getSession();
		final User user = (User) session.getAttribute("user");
		if (user == null)
		{
			request.setAttribute("authorizationError", Boolean.TRUE);
			return false;
		}
		return true;
	}

	private boolean checkExcludedPaths(final HttpServletRequest request)
	{
		final int contextPathLength = request.getContextPath().length();
		final String fullPath = request.getRequestURI().substring(contextPathLength);
		final String[] rootPath = fullPath.split(DELIMITER);

		final String path = (rootPath.length >= 1) ? rootPath[1] : "/";
		if (getExcludedPaths().contains(path))
		{
			return true;
		}
		return false;
	}

	public List<String> getExcludedPaths()
	{
		return excludedPaths;
	}

	public void setExcludedPaths(final List<String> excludedPaths)
	{
		this.excludedPaths = excludedPaths;
	}

}
