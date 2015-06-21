package com.hrabhi.gestionscolarite.dao.user;

import com.hrabhi.gestionscolarite.dao.GenericDao;
import com.hrabhi.gestionscolarite.model.Administrateur;
import com.hrabhi.gestionscolarite.model.User;


public interface AdminDao extends GenericDao<Administrateur, Long>
{
	User checkRegistredUser(String userName, String password);
}
