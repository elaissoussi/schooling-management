package com.hrabhi.gestionscolarite.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.ManyToAny;

@Entity
public class Module extends BaseEntity {
	
	private String nomModule;
	private int coef;
	
	@OneToMany(targetEntity=Matiere.class,mappedBy="module")
	private List<Matiere> matieres;
	
	@ManyToOne(targetEntity=Niveau.class)
	private Niveau niveau;

	public String getNomModule() {
		return nomModule;
	}

	public void setNomModule(String nomModule) {
		this.nomModule = nomModule;
	}

	public int getCoef() {
		return coef;
	}

	public void setCoef(int coef) {
		this.coef = coef;
	}

	public List<Matiere> getMatieres() {
		return matieres;
	}

	public void setMatieres(List<Matiere> matieres) {
		this.matieres = matieres;
	}

	public Niveau getNiveau() {
		return niveau;
	}

	public void setNiveau(Niveau niveau) {
		this.niveau = niveau;
	}
}
