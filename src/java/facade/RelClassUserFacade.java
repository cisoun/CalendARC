/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import entity.Classes;
import entity.Lessons;
import entity.RelClassLesson;
import entity.RelClassUser;
import entity.Users;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
@Stateless
public class RelClassUserFacade extends AbstractFacade<RelClassUser> {

    @PersistenceContext(unitName = "CalendARCPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
	return em;
    }

    public RelClassUserFacade() {
	super(RelClassUser.class);
    }

    public Classes getClassesByUserMail(String mail) {
	
	System.out.println(mail);
	
	Query query = em.createNamedQuery("Users.findByMail");
	query.setParameter("mail", mail);

	Query query2 = em.createNamedQuery("RelClassUser.findByIduser");
	query2.setParameter("iduser", (int) ((Users) query.getSingleResult()).getIduser());

	Query query3 = em.createNamedQuery("Classes.findByIdclass");
	query3.setParameter("idclass", (int) ((RelClassUser) query2.getSingleResult()).getIdclass());
	
	return ((Classes) query3.getSingleResult());
    }

    public List<Lessons> getCurrentUserLessons(Classes currentUserClass) {
	int idClass = currentUserClass.getIdclass();
	Query query = em.createNamedQuery("Lessons.findAll");

	List<Lessons> lessons = query.getResultList();

	Query query2 = em.createNamedQuery("RelClassLesson.findByIdclass");
	query2.setParameter("idclass", currentUserClass.getIdclass());

	List<RelClassLesson> relClassLesson = query2.getResultList();

	List<Lessons> userLessons = new ArrayList<>();

	int size = lessons.size();
	for (Lessons l : lessons) {
	    int sizeRel = relClassLesson.size();
	    for (RelClassLesson r : relClassLesson) {
		if (l.getIdlesson() == r.getIdlesson()) {
		    userLessons.add(l);
		}
	    }

	}

	return userLessons;
    }
}
