package com.hrabhi.gestionscolarite.dao;

import java.io.Serializable;
import java.util.List;


public interface GenericDao<T, ID extends Serializable>
{

	T save(T entity);

	T update(T entity);

	T update(ID id);
	
	void delete(T entity);

	void delete(ID id);

	T findById(ID id);

	List<T> findAll();
	
	void flush();
}
