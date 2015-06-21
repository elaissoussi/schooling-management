package com.hrabhi.gestionscolarite.dao.note;

import org.springframework.stereotype.Repository;

import com.hrabhi.gestionscolarite.dao.GenericJpaDao;
import com.hrabhi.gestionscolarite.model.Note;


@Repository("noteDao")
public class NoteDaoJpa extends GenericJpaDao<Note, Long> implements NoteDao{

	public NoteDaoJpa() {
		super(Note.class);
		
	}

	
}
