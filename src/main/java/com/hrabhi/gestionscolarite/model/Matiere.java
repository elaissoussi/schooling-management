package com.hrabhi.gestionscolarite.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
public class Matiere extends BaseEntity{
	
	private String nomMatiere;
	private String coefMatiere;
	
	@ManyToOne
	private Niveau niveau;
	
	
	@OneToOne(targetEntity=Note.class,mappedBy="matiere")
	private Note note;
	
	@ManyToOne(targetEntity=Professeur.class)
	private Professeur prof;
	@ManyToOne(targetEntity=Module.class)
	private Module module;
	
	
	public Professeur getProf() {
		return prof;
	}

	public void setProf(Professeur prof) {
		this.prof = prof;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public String getCoefMatiere() {
		return coefMatiere;
	}

	public void setCoefMatiere(String coefMatiere) {
		this.coefMatiere = coefMatiere;
	}
	
	

	public String getNomMatiere() {
		return nomMatiere;
	}

	public void setNomMatiere(String nomMatiere) {
		this.nomMatiere = nomMatiere;
	}

	public Niveau getNiveau() {
		return niveau;
	}

	public void setNiveau(Niveau niveau) {
		this.niveau = niveau;
	}

	public Note getNote() {
		return note;
	}

	public void setNote(Note note) {
		this.note = note;
	}

	
}
