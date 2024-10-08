/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.question.teacher;

import dao.LessonQuestionDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.LessonQuestion;

/**
 *
 * @author Dan
 */
@WebServlet(name = "AddQuestionController", urlPatterns = {"/AddQuestion"})
public class AddQuestion extends HttpServlet {

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
            out.println("<title>Servlet AddQuestion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddQuestion at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("lid"));
        request.setAttribute("lid", id);
        request.getRequestDispatcher("AddQuestion.jsp").forward(request, response);
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
        int id = Integer.parseInt(request.getParameter("lid"));
        System.out.println(id);
        String name = request.getParameter("name");
        String content = request.getParameter("content");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String status = request.getParameter("status");
        String statusReal = null;

        if (status.equals("Not Start")) {
            statusReal = "Not Start";
        }
        if (status.equals("On Going")) {
            statusReal = "On Going";
        }
        if (status.equals("Cancelled")) {
            statusReal = "Cancelled";
        }
        System.out.println(new LessonQuestion(id, name, content, statusReal, start, end));
        LessonQuestionDao dao = new LessonQuestionDao();
        
        dao.insertQuestion(new LessonQuestion(id, name, content, statusReal, start, end));
        String url = "ListQuestion?id=" + id;
        response.sendRedirect(url);
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
