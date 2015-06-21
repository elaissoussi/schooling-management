package com.hrabhi.gestionscolarite.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hrabhi.gestionscolarite.dao.niveau.NiveauDao;
import com.hrabhi.gestionscolarite.dao.note.NoteDao;
import com.hrabhi.gestionscolarite.model.Niveau;
import com.hrabhi.gestionscolarite.model.Note;


@Controller
@RequestMapping(value = "/student")
public class StudentPageController
{

	@Resource
	NoteDao noteDao;

	@Resource
	NiveauDao niveauDao;

	// home
	@RequestMapping(method = RequestMethod.GET)
	public String home(final Model model)
	{

		return "student/studentHome";
	}

	//afficher les notes
	@RequestMapping(value = "/showNote", method = RequestMethod.GET)
	public String showProf(final Model model)
	{
		final List<Note> notes = noteDao.findAll();
		model.addAttribute("notes", notes);
		return "student/showNote";
	}

	//afficher le planing
	@RequestMapping(value = "/planning", method = RequestMethod.GET)
	public String planing(final Model model)
	{
		final List<Niveau> niveaux = niveauDao.findAll();
		model.addAttribute("niveaux", niveaux);

		return "student/planning";
	}
}
