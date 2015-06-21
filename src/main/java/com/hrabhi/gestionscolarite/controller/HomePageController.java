package com.hrabhi.gestionscolarite.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hrabhi.gestionscolarite.model.Administrateur;
import com.hrabhi.gestionscolarite.model.Etudiant;
import com.hrabhi.gestionscolarite.model.Professeur;
import com.hrabhi.gestionscolarite.model.User;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomePageController
{

	private static final Logger logger = LoggerFactory.getLogger(HomePageController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request)
	{
		final User user = (User) request.getSession().getAttribute("user");

		if (user != null)
		{
			String targetUrl = null;

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

			return "redirect:" + targetUrl;
		}

		model.addAttribute("authorizationError", request.getAttribute("authorizationError"));
		model.addAttribute("authentificationError", request.getAttribute("authorizationError"));

		return "home";
	}

}
