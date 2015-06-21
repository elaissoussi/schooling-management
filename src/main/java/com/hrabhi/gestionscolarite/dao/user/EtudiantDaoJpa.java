package com.hrabhi.gestionscolarite.dao.user;



import org.springframework.stereotype.Repository;

import com.hrabhi.gestionscolarite.dao.GenericJpaDao;
import com.hrabhi.gestionscolarite.model.Etudiant;


@Repository("etudiantDao")
public class EtudiantDaoJpa extends GenericJpaDao<Etudiant, Long> implements EtudiantDao
{
	public EtudiantDaoJpa()
	{
		super(Etudiant.class);
	}
}
