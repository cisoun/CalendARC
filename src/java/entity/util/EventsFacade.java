/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.util;

import controller.UsersController;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    
    public List<Events> getEventsByDay(int idUser, String date) {	
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Calendar calendar = Calendar.getInstance();
	
	// Set calendar to the specified date.
	try {
	    calendar.setTime(formatter.parse(date));
	} catch (ParseException ex) {
	    Logger.getLogger(EventsFacade.class.getName()).log(Level.SEVERE, null, ex);
	}
	Date dateStart = calendar.getTime();
	
	// End of the day.
	calendar.add(Calendar.HOUR_OF_DAY, 24);
	Date endDate = calendar.getTime();
	
	// Query
	Query query = em.createNamedQuery("Events.findByInterval");
        query.setParameter("iduser", idUser);
	query.setParameter("startdate", dateStart);
	query.setParameter("enddate", endDate);
        
        return (List<Events>) query.getResultList();
    }
    
    public List<Events> getEventsByWeek(int idUser, String startDate, String endDate) {
	/*Date dateStart;
	Date dateEnd;
	
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	try {
	    dateStart = formatter.parse(startDate);
	    dateEnd = formatter.parse(endDate);
	} catch (ParseException ex) {
	    Logger.getLogger(EventsFacade.class.getName()).log(Level.SEVERE, null, ex);
	}*/

	System.out.println(startDate + " to " + endDate);
	
	Query query = em.createNamedQuery("Events.findByInterval");
        query.setParameter("iduser", idUser);
	query.setParameter("startdate", startDate);
	query.setParameter("enddate", endDate);
        
        return (List<Events>) query.getResultList();
    }
    
    public List<Events> getEventsByCurrentWeek(int idUser) {
	//SELECT e FROM events e WHERE e.iduser = :iduser AND e.startdate >= DATE(SUBDATE(:date, WEEKDAY(:date))) AND e.enddate < DATE(SUBDATE(:date, WEEKDAY(:date) + 1))
	
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	
	Calendar calendar = Calendar.getInstance();
	calendar.set(Calendar.DAY_OF_WEEK, calendar.getFirstDayOfWeek());
	Date startdate = calendar.getTime();
	
	calendar.set(Calendar.DAY_OF_WEEK, calendar.getFirstDayOfWeek() + 6);
	Date enddate = calendar.getTime();
	
	System.out.println(startdate + " to " + enddate);
	
	Query query = em.createNamedQuery("Events.findByInterval");
        query.setParameter("iduser", idUser);
	query.setParameter("startdate", startdate);
	query.setParameter("enddate", enddate);
        
        return (List<Events>) query.getResultList();
    }
    
    public Users getUserByName(String mail)
    {
        Query query = em.createNamedQuery("Users.findByMail");
        query.setParameter("mail", mail);
        
        return (Users) query.getSingleResult();
    }
    
}
