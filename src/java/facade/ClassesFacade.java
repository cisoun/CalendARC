/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package facade;

import entity.Classes;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
@Stateless
public class ClassesFacade extends AbstractFacade<Classes> {
    @PersistenceContext(unitName = "CalendARCPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
	return em;
    }

    public ClassesFacade() {
	super(Classes.class);
    }

}
