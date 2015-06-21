package com.hrabhi.gestionscolarite.dao.user;

import java.util.List;

import com.hrabhi.gestionscolarite.dao.GenericDao;
import com.hrabhi.gestionscolarite.model.Etudiant;
import com.hrabhi.gestionscolarite.model.Matiere;
import com.hrabhi.gestionscolarite.model.User;



public interface MatiereDao extends GenericDao<Matiere, Long>
{
	List<Etudiant> getStudentsForSubject(String idMatiere);
}
