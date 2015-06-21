package com.hrabhi.gestionscolarite.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hrabhi.gestionscolarite.dao.module.ModuleDao;
import com.hrabhi.gestionscolarite.dao.niveau.NiveauDao;
import com.hrabhi.gestionscolarite.dao.user.AdminDao;
import com.hrabhi.gestionscolarite.dao.user.EtudiantDao;
import com.hrabhi.gestionscolarite.dao.user.MatiereDao;
import com.hrabhi.gestionscolarite.dao.user.PofesseurDao;
import com.hrabhi.gestionscolarite.dao.user.UserDao;
import com.hrabhi.gestionscolarite.model.Administrateur;
import com.hrabhi.gestionscolarite.model.Etudiant;
import com.hrabhi.gestionscolarite.model.Matiere;
import com.hrabhi.gestionscolarite.model.Module;
import com.hrabhi.gestionscolarite.model.Niveau;
import com.hrabhi.gestionscolarite.model.Professeur;
import com.hrabhi.gestionscolarite.model.User;

// Espace Administration
@Controller
@RequestMapping(value = "/admin")
public class AdminPageController {

	@Resource
	UserDao userDao;

	@Resource
	EtudiantDao etudiantDao;

	@Resource
	PofesseurDao professeurDao;

	@Resource
	AdminDao adminDao;

	@Resource
	MatiereDao matiereDao;

	@Resource
	NiveauDao niveauDao;

	@Resource
	ModuleDao moduleDao;

	// home admin

	@RequestMapping(method = RequestMethod.GET)
	public String home(final Model model, final HttpSession session) {

		return "administration/adminHome";
	}

	@RequestMapping(value = "/getUserById/{id}", method = RequestMethod.GET)
	@ResponseBody
	public User getUserById(final Model model,
			@PathVariable(value = "id") final Long userId) {
		User user = userDao.findById(userId);
		return user;
	}

	// Gestion etudiants

	@RequestMapping(value = "/students", method = RequestMethod.GET)
	public String homeStudents(final Model model) {
		final List<Etudiant> etudiants = etudiantDao.findAll();
		model.addAttribute("etudiants", etudiants);
		final List<Niveau> niveaux = niveauDao.findAll();
		model.addAttribute("niveaux", niveaux);
		
		return "administration/students";
	}

	// supprier un etudiant
	@RequestMapping(value = "/deleteStudent/{id}", method = RequestMethod.GET)
	public String deleteStudent(final Model model,
			@PathVariable(value = "id") final Long studentId) {
		etudiantDao.delete(studentId);
		final List<Etudiant> etudiants = etudiantDao.findAll();
		model.addAttribute("etudiants", etudiants);
		return "redirect:/admin/students";
	}

	// ajouter un etudiant
	@RequestMapping(value = "/addStudent", method = RequestMethod.GET)
	public String addStudentHome(final Model model) {
		return "administration/addStudent";
	}

	@RequestMapping(value = "/addStudent", method = RequestMethod.POST)
	public String addStudent(final Model model, final HttpServletRequest request) {
		final Etudiant etudiant = new Etudiant();
		etudiant.setLogin(request.getParameter("login"));
		etudiant.setPassword(request.getParameter("motdepasse"));
		etudiant.setFirstName(request.getParameter("nom"));
		etudiant.setLastName(request.getParameter("prenom"));
		etudiant.setMail(request.getParameter("email"));
		Niveau niveau = niveauDao.findById(Long.parseLong(request
				.getParameter("niveau")));
		etudiant.setNiveau(niveau);	
		userDao.save(etudiant);
		return "redirect:/admin/students";
	}

	// Update Student
	@RequestMapping(value = "/updateStudent/{id}", method = RequestMethod.POST)
	public String updateStudent(@PathVariable(value = "id") final Long id,
			final HttpServletRequest request) {
		final User etudiant = (User) userDao.findById(id);
		etudiant.setLogin(request.getParameter("login"));
		etudiant.setPassword(request.getParameter("motdepasse"));
		etudiant.setFirstName(request.getParameter("nom"));
		etudiant.setLastName(request.getParameter("prenom"));
		etudiant.setMail(request.getParameter("email"));
		userDao.update(etudiant);
		return "redirect:/admin/students";
	}

	// Gestion Professeurs

	@RequestMapping(value = "/teachers", method = RequestMethod.GET)
	public String homeTeacher(final Model model) {
		final List<Professeur> profs = professeurDao.findAll();
		model.addAttribute("profs", profs);
		return "administration/teachers";
	}

	// ajouter un professeur
	@RequestMapping(value = "/addTeacher", method = RequestMethod.GET)
	public String addTeacherHome(final Model model) {
		return "administration/addTeacher";
	}

	@RequestMapping(value = "/addTeacher", method = RequestMethod.POST)
	public String addTeacher(final Model model, final HttpServletRequest request) {
		final Professeur prof = new Professeur();
		prof.setLogin(request.getParameter("login"));
		prof.setPassword(request.getParameter("motdepasse"));
		prof.setFirstName(request.getParameter("nom"));
		prof.setLastName(request.getParameter("prenom"));
		prof.setMail(request.getParameter("email"));
		userDao.save(prof);
		return "redirect:/admin/teachers";
	}

	// Update teacher
	@RequestMapping(value = "/updateTeacher/{id}", method = RequestMethod.POST)
	public String updateTeacher(@PathVariable(value = "id") final Long id,
			final HttpServletRequest request) {
		final User prof = (User) userDao.findById(id);
		prof.setLogin(request.getParameter("login"));
		prof.setPassword(request.getParameter("motdepasse"));
		prof.setFirstName(request.getParameter("nom"));
		prof.setLastName(request.getParameter("prenom"));
		prof.setMail(request.getParameter("email"));
		userDao.update(prof);
		return "redirect:/admin/teachers";
	}

	// supprimer un prof
	@RequestMapping(value = "/deleteTeacher/{id}", method = RequestMethod.GET)
	public String deleteTeachert(final Model model,
			@PathVariable(value = "id") final Long teacherId) {
		professeurDao.delete(teacherId);
		final List<Professeur> profs = professeurDao.findAll();
		model.addAttribute("profs", profs);
		return "redirect:/admin/teachers";

	}

	// Gestion des Admins

	@RequestMapping(value = "/admins", method = RequestMethod.GET)
	public String homeadmins(final Model model) {
		final List<Administrateur> admins = adminDao.findAll();
		model.addAttribute("admins", admins);
		return "administration/admins";
	}

	// ajouter un admin
	@RequestMapping(value = "/ajouterAdmins", method = RequestMethod.GET)
	public String addAdminsHome(final Model model) {
		return "administration/addAdmin";
	}

	@RequestMapping(value = "/addAdmin", method = RequestMethod.POST)
	public String addAdmin(final Model model, final HttpServletRequest request) {
		final Administrateur admin = new Administrateur();
		admin.setLogin(request.getParameter("login"));
		admin.setPassword(request.getParameter("motdepasse"));
		admin.setFirstName(request.getParameter("nom"));
		admin.setLastName(request.getParameter("prenom"));
		admin.setMail(request.getParameter("email"));
		userDao.save(admin);
		return "redirect:/admin/admins";
	}

	// supprimer un admins
	@RequestMapping(value = "/deleteAdmin/{id}", method = RequestMethod.GET)
	public String deleteAdmin(final Model model,
			@PathVariable(value = "id") final Long adminId) {
		adminDao.delete(adminId);
		final List<Administrateur> admins = adminDao.findAll();
		model.addAttribute("admins", admins);
		return "redirect:/admin/admins";

	}

	// update Admin
	@RequestMapping(value = "/updateAdmin/{id}", method = RequestMethod.POST)
	public String updateAdmin(@PathVariable(value = "id") final Long id,
			final HttpServletRequest request) {
		final User admin = (User) userDao.findById(id);
		admin.setLogin(request.getParameter("login"));
		admin.setPassword(request.getParameter("motdepasse"));
		admin.setFirstName(request.getParameter("nom"));
		admin.setLastName(request.getParameter("prenom"));
		admin.setMail(request.getParameter("email"));
		userDao.update(admin);
		return "redirect:/admin/admins";
	}

	// Gestion Cours

	@RequestMapping(value = "/cours", method = RequestMethod.GET)
	public String gestionCours(final Model model) {

		final List<Matiere> matieres = matiereDao.findAll();
		model.addAttribute("matieres", matieres);
		final List<Niveau> niveaux = niveauDao.findAll();
		model.addAttribute("niveaux", niveaux);
		final List<Module> modules = moduleDao.findAll();
		model.addAttribute("modules", modules);
		final List<Professeur> profs = professeurDao.findAll();
		model.addAttribute("profs", profs);
		return "administration/gestionCours";
	}

	// ajouter un Module

	@RequestMapping(value = "/ajouterModule", method = RequestMethod.POST)
	public String ajouterModule(final Model model,
			final HttpServletRequest request) {
		final Module module = new Module();
		module.setNomModule(request.getParameter("nomModule"));
		module.setCoef(Integer.parseInt(request.getParameter("coeficient")));
		Niveau niveau = niveauDao.findById(Long.parseLong(request
				.getParameter("niveau")));
		module.setNiveau(niveau);
		moduleDao.save(module);
		return "redirect:/admin/cours";
	}

	// ajouter une matiere

	@RequestMapping(value = "/ajouterMatiere", method = RequestMethod.POST)
	public String ajouterMatiere(final Model model,
			final HttpServletRequest request) {
		final Matiere matiere = new Matiere();
		matiere.setNomMatiere(request.getParameter("nomMatiere"));
		matiere.setCoefMatiere(request.getParameter("coeficient"));
		Module module = moduleDao.findById(Long.parseLong(request
				.getParameter("module")));
		matiere.setModule(module);
		Professeur professeur = professeurDao.findById(Long.parseLong(request
				.getParameter("professeur")));
		matiere.setProf(professeur);
		Niveau niveau = niveauDao.findById(Long.parseLong(request
				.getParameter("niveau")));
		matiere.setNiveau(niveau);
		matiereDao.save(matiere);
		return "redirect:/admin/cours";
	}

	// supprimer matiere
	@RequestMapping(value = "/deleteMatiere/{id}", method = RequestMethod.GET)
	public String deleteMatiere(final Model model,
			@PathVariable(value = "id") final Long matiereId) {
		matiereDao.delete(matiereId);
		final List<Matiere> matieres = matiereDao.findAll();
		model.addAttribute("matieres", matieres);
		return "redirect:/admin/cours";
	}

	// update matiere

	@RequestMapping(value = "/updateMatiere/{id}", method = RequestMethod.POST)
	public String updateMatiere(@PathVariable(value = "id") final Long id,
			final HttpServletRequest request) {
		final Matiere matiere = (Matiere) matiereDao.findById(id);
		matiere.setNomMatiere(request.getParameter("nomMatiere"));
		matiere.setCoefMatiere(request.getParameter("coeficient"));
		Module module = moduleDao.findById(Long.parseLong(request
				.getParameter("module")));
		matiere.setModule(module);
		Professeur professeur = professeurDao.findById(Long.parseLong(request
				.getParameter("professeur")));
		matiere.setProf(professeur);
		
		Niveau niveau = niveauDao.findById(Long.parseLong(request
				.getParameter("niveau")));
		matiere.setNiveau(niveau);
		matiereDao.update(matiere);
		return "redirect:/admin/cours";
	}
}
