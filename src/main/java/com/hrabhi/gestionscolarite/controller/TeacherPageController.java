package com.hrabhi.gestionscolarite.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.SliderUI;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hrabhi.gestionscolarite.dao.note.NoteDao;
import com.hrabhi.gestionscolarite.dao.user.EtudiantDao;
import com.hrabhi.gestionscolarite.dao.user.MatiereDao;
import com.hrabhi.gestionscolarite.dao.user.PofesseurDao;
import com.hrabhi.gestionscolarite.dao.user.UserDao;
import com.hrabhi.gestionscolarite.model.Etudiant;
import com.hrabhi.gestionscolarite.model.Matiere;
import com.hrabhi.gestionscolarite.model.Note;
import com.hrabhi.gestionscolarite.model.Professeur;

//Espace Professeur
@Controller
@RequestMapping(value = "/teacher")
public class TeacherPageController {

	@Resource
	UserDao userDao;

	@Resource
	PofesseurDao profDao;

	@Resource
	EtudiantDao etudiantDao;

	@Resource
	MatiereDao matiereDao;
	
	@Resource
	NoteDao noteDao;

	// home
	@RequestMapping(method = RequestMethod.GET)
	public String home(final Model model) {

		return "professeur/teacherHome";
	}

	// affichage de note
	@RequestMapping(value = "/note", method = RequestMethod.GET)
	public String note(final Model model) {

		final List<Matiere> matieres = matiereDao.findAll();
		model.addAttribute("matieres", matieres);
		return "professeur/addNote";
	}

	// saisir la note

	@RequestMapping(value = "/addNotes", method = RequestMethod.POST)
	public String addNote(final Model model, final HttpServletRequest request) {

		Map params = request.getParameterMap();
		Iterator i = params.keySet().iterator();

		while (i.hasNext()) {
			String key = (String) i.next();
			if (key.startsWith("note")) {
				String[] splitedKey = key.split("_");
				Etudiant etudiant = etudiantDao.findById(Long
						.valueOf(splitedKey[1]));
				String noteValue = ((String[]) params.get(key))[0];
				Note note = new Note();
				note.setValue(Float.valueOf(noteValue));
				note.setEtudiant(etudiant);
				noteDao.save(note);
			}
		}

		return "redirect:/teacher/note";
	}

	// consulter les profs
	@RequestMapping(value = "/showProf", method = RequestMethod.GET)
	public String showProf(final Model model) {
		final List<Professeur> profs = profDao.findAll();
		model.addAttribute("profs", profs);
		return "professeur/showProf";
	}

	// consulter les etudiants
	@RequestMapping(value = "/showStudent", method = RequestMethod.GET)
	public String showStudent(final Model model) {
		final List<Etudiant> etudiants = etudiantDao.findAll();
		model.addAttribute("etudiants", etudiants);
		return "professeur/showStudent";
	}

	// afficher les etudiants selon la matiere
	@RequestMapping(value = "/getStudentsForSubject", method = RequestMethod.GET)
	public String getStudentsForSubject(final Model model,
			HttpServletRequest request) {
		String idMatiere = request.getParameter("selectedSubject");
		List<Etudiant> etudiants = matiereDao.getStudentsForSubject(idMatiere);
		model.addAttribute("etudiants", etudiants);
		final List<Matiere> matieres = matiereDao.findAll();
		model.addAttribute("matieres", matieres);
		return "professeur/addNote";
	}

	// //ajouter Note
	// @RequestMapping(value = "/addNote", method = RequestMethod.GET)
	// public String addNote(final Model model , HttpServletRequest request) {
	// final List<Note> note = noteDao.findAll();
	// model.addAttribute("matieres", matieres);
	// List<Etudiant> etudiants = matiereDao.getStudentsForSubject(idMatiere);
	// model.addAttribute("etudiants", etudiants);
	// return "professeur/addNote";

}
