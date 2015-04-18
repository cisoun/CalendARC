/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CalendarServlet", urlPatterns = {
    "/calendar",
    "/calendar/create",
    "/calendar/lessons",
    "/calendar/show"})
public class CalendarServlet extends HttpServlet {

    private String userPath;
    private final String[] periods = {
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
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	// use RequestDispatcher to forward request internally

	HttpSession session = request.getSession(true);
	userPath = request.getServletPath();
	
	//if (userPath == "/calendar/show") {
	    request.setAttribute("periods", periods);
	//}
	
	userPath = "/WEB-INF/view" + userPath + ".jsp";

	try {
	    request.getRequestDispatcher(userPath).forward(request, response);
	} catch (Exception ex) {
	    ex.printStackTrace();
	}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>
}
