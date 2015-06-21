package com.hrabhi.gestionscolarite.dao.niveau;

import org.springframework.stereotype.Repository;

import com.hrabhi.gestionscolarite.dao.GenericJpaDao;
import com.hrabhi.gestionscolarite.model.Niveau;


@Repository("niveauDao")
public class NiveauDaoJpa extends GenericJpaDao<Niveau, Long> implements NiveauDao{
	
	public NiveauDaoJpa()
	{
		super(Niveau.class);
	}
	}
