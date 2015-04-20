/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.util.Classes;
import entity.util.Lessons;
import entity.util.RelClassLesson;
import entity.util.RelClassUser;
import entity.util.Users;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.apache.jasper.tagplugins.jstl.ForEach;

/**
 *
 * @author Eddy
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
    
    public RelClassUser getClassByUserMail(String mail)
    {
        Query query = em.createNamedQuery("Users.findByMail");
        query.setParameter("mail", mail);
        
        Query query2 = em.createNamedQuery("RelClassUser.findByIduser");
        query2.setParameter("iduser", (int)((Users)query.getSingleResult()).getIduser());
        
        return ((RelClassUser)query2.getSingleResult());
    }
    
    public List<Lessons> getCurrentUserLessons(Classes currentUserClass)
    {
        int idClass = currentUserClass.getIdclass();
        Query query = em.createNamedQuery("Lessons.findAll");
        
        List<Lessons> lessons = query.getResultList();
        
        Query query2 = em.createNamedQuery("RelClassLesson.findByIdclass");
        query2.setParameter("idclass", currentUserClass.getIdclass());
        
        List<RelClassLesson> relClassLesson = query2.getResultList();
        
        int size = lessons.size();
        for (Lessons l : lessons) 
        {
            if(!relClassLesson.contains(l.getIdlesson()))
            {
                lessons.remove(l);
            }
            if (--size == 0) 
            {
                
            }
        }
        return lessons;
    }

}
