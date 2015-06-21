package com.hrabhi.gestionscolarite.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

public abstract class GenericJpaDao<T, ID extends Serializable> implements
		GenericDao<T, ID> {
	private final Class<T> persistentClass;

	private EntityManager entityManager;

	public GenericJpaDao(final Class<T> persistentClass) {
		this.persistentClass = persistentClass;
	}

	protected EntityManager getEntityManager() {
		return entityManager;
	}

	@PersistenceContext(unitName = "MY_P_U")
	public void setEntityManager(final EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public Class<T> getPersistentClass() {
		return persistentClass;
	}

	@Transactional
	public T findById(final ID id) {
		final T entity = getEntityManager().find(getPersistentClass(), id);
		return entity;
	}

	public List<T> findAll() {
		return getEntityManager().createQuery(
				"select x from " + getPersistentClass().getSimpleName() + " x")
				.getResultList();
	}

	@Transactional
	public T save(final T entity) {
		getEntityManager().persist(entity);
		return entity;
	}

	@Transactional
	public T update(final T entity) {
		final T mergedEntity = getEntityManager().merge(entity);
		return mergedEntity;
	}

	@Transactional
	public T update(final ID id) {
		T t = findById(id);
		final T mergedEntity = getEntityManager().merge(t);
		return mergedEntity;
	}

	@Transactional
	public void delete(final T entity) {
		getEntityManager().remove(entity);
	}

	@Transactional
	public void delete(final ID id) {
		final T t = findById(id);
		delete(t);
	}

	public void flush() {
		getEntityManager().flush();
	}

}
