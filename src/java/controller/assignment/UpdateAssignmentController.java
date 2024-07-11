/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.assignment;

import dao.AssignmentDao;
import dao.ClassDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Assignment;

/**
 *
 * @author Dan
 */
@WebServlet(name="UpdateAssignmentController", urlPatterns={"/UpdateAssignment"})
public class UpdateAssignmentController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateAssignmentController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAssignmentController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ClassDao adao = new ClassDao();
        List<model.Class> list = adao.getAll();

        request.setAttribute("list", list);
       int id = Integer.parseInt(request.getParameter("id"));
         AssignmentDao dao = new AssignmentDao();
         Assignment assignment = dao.getAssignmentById(id);
         request.setAttribute("assignment", assignment);
        request.getRequestDispatcher("UpdateAssignment.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
       String name = request.getParameter("name");
        String content = request.getParameter("description");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String status = request.getParameter("className");
        
         LocalDateTime dateTime = LocalDateTime.parse(start, DateTimeFormatter.ISO_LOCAL_DATE_TIME);

        // Định dạng lại chuỗi thành "yyyy-MM-dd HH:mm:ss.S"
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
        String formattedTimeStart = dateTime.format(formatter);

        // In kết quả
        LocalDateTime dateTime1 = LocalDateTime.parse(end, DateTimeFormatter.ISO_LOCAL_DATE_TIME);

        // Định dạng lại chuỗi thành "yyyy-MM-dd HH:mm:ss.S"
        DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
        String formattedTimeEnd = dateTime1.format(formatter1);
        ClassDao classDao = new ClassDao();
        
        AssignmentDao dao = new AssignmentDao();
          System.out.println(new Assignment(classDao.getClassByName(status).getClassId(), name, content, formattedTimeStart, formattedTimeEnd));
        try {
            dao.updateUser(id, new Assignment(classDao.getClassByName(status).getClassId(), name, content, formattedTimeStart, formattedTimeEnd));
        } catch (SQLException ex) {
            Logger.getLogger(UpdateAssignmentController.class.getName()).log(Level.SEVERE, null, ex);
        }
        String url = "ListAssignment" ;
        response.sendRedirect(url);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
