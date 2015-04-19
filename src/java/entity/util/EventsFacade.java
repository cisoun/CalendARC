/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.util;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Eddy
 */
@Stateless
public class EventsFacade extends AbstractFacade<Events> {
    @PersistenceContext(unitName = "CalendARCPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EventsFacade() {
        super(Events.class);
    }
    
    public Users getUserByName(String mail)
    {
        Query query = em.createNamedQuery("Users.findByMail");
        query.setParameter("mail", mail);
        
        return (Users) query.getSingleResult();
    }
    
}
