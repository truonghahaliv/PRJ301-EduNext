/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.clas;

import dao.ClassDao;
import dao.CourseDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;

/**
 *
 * @author Dan
 */
@WebServlet(name = "UpdateClassController", urlPatterns = {"/UpdateClass"})
public class UpdateClassController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateClassController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateClassController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        String id_raw = request.getParameter("id");

        ClassDao dao = new ClassDao();
        try {
            int id = Integer.parseInt(id_raw);
            System.out.println(id);
            model.Class course = dao.getClassById(id);
            System.out.println(course);
            request.setAttribute("classs", course);
             CourseDao ddao = new CourseDao();
                List<Course> list = ddao.getAll();

                request.setAttribute("list", list);
            request.getRequestDispatcher("UpdateClass.jsp").forward(request, response);

        } catch (Exception e) {

        }
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
      ClassDao dao = new ClassDao();
           CourseDao ddao = new CourseDao();
           int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
     String courseName = request.getParameter("cname");
        System.out.println(name);
        System.out.println(courseName);
        Course course = ddao.getCourseByName(courseName);
     
        try {
            dao.updateUser(id, new model.Class(course.getCourseId(),name));
        } catch (SQLException ex) {
            Logger.getLogger(UpdateClassController.class.getName()).log(Level.SEVERE, null, ex);
        }
            response.sendRedirect("ListClass");
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
