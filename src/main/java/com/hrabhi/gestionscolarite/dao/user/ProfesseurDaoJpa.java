package com.hrabhi.gestionscolarite.dao.user;



import org.springframework.stereotype.Repository;

import com.hrabhi.gestionscolarite.dao.GenericJpaDao;
import com.hrabhi.gestionscolarite.model.Professeur;


@Repository("ProfesseurDao")
public class ProfesseurDaoJpa extends GenericJpaDao<Professeur, Long> implements PofesseurDao
{
	public ProfesseurDaoJpa()
	{
		super(Professeur.class);
	}
}
