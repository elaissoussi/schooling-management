package com.hrabhi.gestionscolarite.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/error")
public class ErrorPageController
{
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public String error404(final Model model)
	{
		return "error/404";
	}
}
