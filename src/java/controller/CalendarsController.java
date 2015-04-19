/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
@ManagedBean(name = "CalendarsController")
@SessionScoped
public class CalendarsController implements Serializable {
    
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

    public String[] getPeriods() {
	return periods;
    }

    /**
     * Creates a new instance of CalendarsController
     */
    public CalendarsController() {
    }

}
