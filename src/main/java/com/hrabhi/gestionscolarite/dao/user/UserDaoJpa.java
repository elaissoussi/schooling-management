package com.hrabhi.gestionscolarite.dao.user;



import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.hrabhi.gestionscolarite.dao.GenericJpaDao;
import com.hrabhi.gestionscolarite.model.Administrateur;
import com.hrabhi.gestionscolarite.model.Etudiant;
import com.hrabhi.gestionscolarite.model.Professeur;
import com.hrabhi.gestionscolarite.model.User;


@Repository("userDao")
public class UserDaoJpa extends GenericJpaDao<User, Long> implements UserDao
{
	public UserDaoJpa()
	{
		super(User.class);
	}

	@Override
	public User checkRegistredUser(final String login, final String password)
	{
		final Query query = getEntityManager().createQuery(
				"select u from " + getPersistentClass().getSimpleName() + " u where u.login = :login and u.password = :password");
		query.setParameter("login", login);
		query.setParameter("password", password);

		final List results = query.getResultList();

		if (results != null && !results.isEmpty())
		{
			final User user = (User) results.get(0);
	   		return user ; 
		}
		
		return null;
	}
}
