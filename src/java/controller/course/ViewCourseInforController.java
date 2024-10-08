/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.course;

import dao.AssignmentDao;
import dao.LessonDao;
import dao.LessonQuestionDao;
import dao.QuestionDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Assignment;
import model.Lesson;
import model.LessonQuestion;
import model.Question;
import model.User;

/**
 *
 * @author Dan
 */
@WebServlet(name = "ViewCourseInforController", urlPatterns = {"/ViewCourseInfor"})
public class ViewCourseInforController extends HttpServlet {

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
            out.println("<title>Servlet ViewCourseInforController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewCourseInforController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user.getRole().equals("teacher")) {
            request.setAttribute("teacher", "teacher");
        } else {
            request.setAttribute("student", "student");
        }
        LessonDao ldao = new LessonDao();
        String slot = request.getParameter("slot");
        List<Lesson> listLessons1 = ldao.getAllByUser(user.getUserId(), slot == null ? "" : slot);
        List<Lesson> listLessons2 = ldao.getAllByUser(user.getUserId());
        request.setAttribute("lesson", listLessons1);
        request.setAttribute("lesson2", listLessons2);
        LessonQuestionDao adao = new LessonQuestionDao();
        List<LessonQuestion> listAssignments = adao.getAll();
        request.setAttribute("question", listAssignments);
        
        request.getRequestDispatcher("ViewCourseInfor.jsp").forward(request, response);
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
