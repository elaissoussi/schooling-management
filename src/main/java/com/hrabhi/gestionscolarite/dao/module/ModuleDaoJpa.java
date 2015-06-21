package com.hrabhi.gestionscolarite.dao.module;

import org.springframework.stereotype.Repository;

import com.hrabhi.gestionscolarite.dao.GenericJpaDao;
import com.hrabhi.gestionscolarite.model.Module;

@Repository("moduleDao")
public class ModuleDaoJpa extends GenericJpaDao<Module, Long> implements ModuleDao{

	public ModuleDaoJpa() {
		super(Module.class);
	}
}
