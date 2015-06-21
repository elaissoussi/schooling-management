package com.hrabhi.gestionscolarite.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;


@Entity
public class Professeur extends User{
	
	@OneToMany
	private List<Matiere> matieres;
	
	@OneToMany
	private List<Avis> avis;
}
	