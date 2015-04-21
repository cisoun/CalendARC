/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package facade;

import facade.AbstractFacade;
import entity.Lessons;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
@Stateless
public class LessonsFacade extends AbstractFacade<Lessons> {
    @PersistenceContext(unitName = "CalendARCPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
	return em;
    }

    public LessonsFacade() {
	super(Lessons.class);
    }

}
