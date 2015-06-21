package com.hrabhi.gestionscolarite.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

@Entity
public class Niveau extends BaseEntity{

	
	private String nomNiveau;
	
	@OneToMany(fetch = FetchType.EAGER, targetEntity=Etudiant.class, mappedBy="niveau")
	private List<Etudiant> Etudiants;
	
	@OneToMany(targetEntity=Module.class, mappedBy="niveau")
	private List<Matiere> matieres;
	
	@OneToMany(targetEntity=Module.class, mappedBy="niveau")
	private List<Module> modules;

	public String getNomNiveau() {
		return nomNiveau;
	}

	public void setNomNiveau(String nomNiveau) {
		this.nomNiveau = nomNiveau;
	}

	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	public List<Matiere> getMatieres() {
		return matieres;
	}

	public void setMatieres(List<Matiere> matieres) {
		this.matieres = matieres;
	}

	public List<Etudiant> getEtudiants() {
		return Etudiants;
	}

	public void setEtudiants(List<Etudiant> etudiants) {
		Etudiants = etudiants;
	}
}

