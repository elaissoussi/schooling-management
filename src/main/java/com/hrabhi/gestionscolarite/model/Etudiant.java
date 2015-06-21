package com.hrabhi.gestionscolarite.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


@Entity
public class Etudiant extends User{
	
	@ManyToOne
	private Niveau niveau;

	@OneToMany(targetEntity=Note.class, mappedBy="etudiant")
	private List<Note> notes;

	public Niveau getNiveau() {
		return niveau;
	}

	public void setNiveau(Niveau niveau) {
		this.niveau = niveau;
	}

	public List<Note> getNotes() {
		return notes;
	}

	public void setNotes(List<Note> notes) {
		this.notes = notes;
	}
		
	}

	

	