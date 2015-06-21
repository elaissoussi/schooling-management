package com.hrabhi.gestionscolarite.dao.user;



import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.hrabhi.gestionscolarite.dao.GenericJpaDao;
import com.hrabhi.gestionscolarite.model.Administrateur;
import com.hrabhi.gestionscolarite.model.User;


@Repository("adminDao")
public class AdminDaoJpa extends GenericJpaDao<Administrateur, Long> implements AdminDao
{
	public AdminDaoJpa()
	{
		super(Administrateur.class);
	}

	@Override
	public User checkRegistredUser(String userName, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	

	
}
