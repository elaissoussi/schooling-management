package com.hrabhi.gestionscolarite.dao.user;

import com.hrabhi.gestionscolarite.dao.GenericDao;
import com.hrabhi.gestionscolarite.model.User;


public interface UserDao extends GenericDao<User, Long>
{
	User checkRegistredUser(String userName, String password);
}
