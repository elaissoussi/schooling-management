package com.hrabhi.gestionscolarite.model;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;




@Entity
public class Note extends BaseEntity  {

	private float value;
	
	@ManyToOne (targetEntity=Etudiant.class)
	private Etudiant etudiant;
	@OneToOne
	private Matiere matiere;
	public float getValue() {
		return value;
	}
	public void setValue(float value) {
		this.value = value;
	}
	public Etudiant getEtudiant() {
		return etudiant;
	}
	public void setEtudiant(Etudiant etudiant) {
		this.etudiant = etudiant;
	}
	public Matiere getMatiere() {
		return matiere;
	}
	public void setMatiere(Matiere matiere) {
		this.matiere = matiere;
	}
}
