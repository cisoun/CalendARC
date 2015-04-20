/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.util.Events;
import entity.util.EventsController;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.persistence.Query;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
@ManagedBean(name = "calendarsController")
@SessionScoped
public class CalendarController implements Serializable {

    final String[] periods = {
	"08:00 - 08:45",
	"08:45 - 09:30",
	"09:30 - 10:15",
	"10:30 - 11:15",
	"11:15 - 12:00",
	"12:00 - 12:45",
	"12:45 - 13:30",
	"13:30 - 14:15",
	"14:30 - 15:15",
	"15:15 - 16:00",
	"16:00 - 16:45",
	"16:45 - 17:30",
	"17:30 - 18:15"
    };
    
    
    /**
     * Creates a new instance of CalendarsController
     */
    public CalendarController() {
    }

    public String[] getPeriods() {
	return periods;
    }
    
    public String getDayInWeek(String date, int day) {
	return getWeekFrom(date, day);
    }

    public String getPastWeekFrom(String date) {
	return getWeekFrom(date, -7);
    }

    public String getFuturWeekFrom(String date) {
	return getWeekFrom(date, 7);
    }

    public String getEventCSS(Events event) {
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(event.getStartdate());
	int startHour = calendar.get(Calendar.HOUR_OF_DAY);

	//String marginTop = "margin-top: " + String.valueOf(3 * startHour )
	return "";
    }
    
    private String getWeekFrom(String date, int daysOffset) {
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Calendar calendar = Calendar.getInstance();
	try {
	    calendar.setTime(formatter.parse(date));
	} catch (ParseException ex) {

	    Logger.getLogger(CalendarController.class.getName()).log(Level.SEVERE, null, ex);
	}

	calendar.set(Calendar.DAY_OF_WEEK, calendar.getFirstDayOfWeek());
	calendar.add(Calendar.DAY_OF_MONTH, daysOffset);

	return formatter.format(calendar.getTime());
    }


}
