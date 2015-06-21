package com.hrabhi.gestionscolarite.model;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;


@Entity
public class Avis extends BaseEntity{
	
	private String value;
	
	@ManyToOne(targetEntity=Professeur.class)
	private Professeur prof;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Professeur getProf() {
		return prof;
	}

	public void setProf(Professeur prof) {
		this.prof = prof;
	}

}
