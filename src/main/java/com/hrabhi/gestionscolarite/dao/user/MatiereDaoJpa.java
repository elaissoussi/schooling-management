package com.hrabhi.gestionscolarite.dao.user;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hrabhi.gestionscolarite.dao.GenericJpaDao;
import com.hrabhi.gestionscolarite.model.Etudiant;
import com.hrabhi.gestionscolarite.model.Matiere;
import com.hrabhi.gestionscolarite.model.Niveau;


@Repository("matiereDao")
public class MatiereDaoJpa extends GenericJpaDao<Matiere, Long> implements MatiereDao
{
	public MatiereDaoJpa()
	{
		super(Matiere.class);
	}

	@Override
	@Transactional
	public List<Etudiant> getStudentsForSubject(String idMatiere) {
		
		Matiere matiere = findById(Long.valueOf(idMatiere));
		Niveau niveau = matiere.getNiveau();
		List<Etudiant> etudiants = niveau.getEtudiants();
		return etudiants ; 
	}
}
