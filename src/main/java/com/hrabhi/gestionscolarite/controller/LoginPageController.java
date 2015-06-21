package com.hrabhi.gestionscolarite.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hrabhi.gestionscolarite.dao.user.UserDao;
import com.hrabhi.gestionscolarite.model.Administrateur;
import com.hrabhi.gestionscolarite.model.Etudiant;
import com.hrabhi.gestionscolarite.model.Professeur;
import com.hrabhi.gestionscolarite.model.User;



@Controller
public class LoginPageController
{

	@Resource(name = "userDao")
	UserDao userDao;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(final Model model, final HttpServletRequest request, final RedirectAttributes redirectModel,
			final HttpSession session)
	{
		final String login = request.getParameter("username");
		final String password = request.getParameter("password");
		final User user = userDao.checkRegistredUser(login, password);

		String targetUrl = null;

		if (user != null)
		{
			session.setAttribute("user", user);
			if (user instanceof Etudiant)
			{
				targetUrl = "/student";
			}
			else if (user instanceof Professeur)
			{
				targetUrl = "/teacher";
			}
			else if (user instanceof Administrateur)
			{
				targetUrl = "/admin";
			}
		}
		else
		{
			targetUrl = "/";
			redirectModel.addFlashAttribute("authenticateError", Boolean.TRUE);
		}
		return "redirect:" + targetUrl;
	}

	/**
	 * @param model
	 * @param session
	 * @return String
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(final Model model, final HttpServletRequest request)
	{
		final HttpSession session = request.getSession(false);
		if (session != null)
		{
			session.invalidate();
		}
		return "redirect:/";
	}

}
