/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.question;

import dao.AnswerUserDao;
import dao.LessonQuestionDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AnswerUser;
import model.LessonQuestion;
import model.User;

/**
 *
 * @author Dan
 */
@WebServlet(name = "ViewQuestionSlotController", urlPatterns = {"/ViewQuestionSlot"})
public class ViewQuestionSlotController extends HttpServlet {

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
            out.println("<title>Servlet ViewQuestionSlotController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewQuestionSlotController at " + request.getContextPath() + "</h1>");
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
        AnswerUserDao dao = new AnswerUserDao();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String currentUsername = user.getUsername();
        request.setAttribute("currentUsername", currentUsername);
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", id);
        String content = request.getParameter("content");

        if (content != null) {
            dao.insertAnswer(new AnswerUser(id, user.getUserId(), content));
        }

        LessonQuestionDao adao = new LessonQuestionDao();
        LessonQuestion listAssignments = adao.getQuestionById(id);
        request.setAttribute("question", listAssignments);

        if (listAssignments.getStatus().equals("On Going")) {
            LocalDateTime currentDateTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");

            try {
                // chua cmt
                if (dao.getComment(user.getUserId()) == null) {
                    request.setAttribute("answer", false);
                } // cmt r
                else {
                    request.setAttribute("answer", true);
                    List< AnswerUser> answerUsers = dao.getAll();
                    System.out.println(answerUsers);
                    request.setAttribute("answerUsers", answerUsers);
                }
                // Phân tích cú pháp chuỗi thành LocalDateTime
                LocalDateTime endDateTime = LocalDateTime.parse(listAssignments.getEnd(), formatter);

                // So sánh thời gian hiện tại với thời gian kết thúc
                if (currentDateTime.isAfter(endDateTime)) {
                    System.out.println("Current time is after the end time.");
                    List< AnswerUser> answerUsers = dao.getAll();
                 
                    request.setAttribute("answerUsers", answerUsers);
                    // Đặt thuộc tính "overtime" nếu thời gian hiện tại lớn hơn thời gian kết thúc
                    request.setAttribute("overtime", true);
                } else {
                    System.out.println("Current time is before the end time.");
                    // Đặt thuộc tính "overtime" nếu thời gian hiện tại không lớn hơn thời gian kết thúc
                    request.setAttribute("overtime", false);
                }
            } catch (DateTimeParseException e) {
                System.out.println("Error parsing the end time: " + e.getMessage());
                // Trong trường hợp xảy ra lỗi phân tích cú pháp, bạn có thể đặt thuộc tính "overtime" theo yêu cầu của bạn
                request.setAttribute("overtime", false);
            }
        } else {

            request.setAttribute("overtime", false);
        }

        request.getRequestDispatcher("ViewQuestionSlot.jsp").forward(request, response);
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
        AnswerUserDao dao = new AnswerUserDao();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String currentUsername = user.getUsername();
        request.setAttribute("currentUsername", currentUsername);
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", id);
        String contentUpdate = request.getParameter("contentUpdate");
       
       
        if (contentUpdate != null) {
            int aid = Integer.parseInt(request.getParameter("aid"));
              
            try {
                dao.updateAnswerUser(aid, new AnswerUser(id, user.getUserId(), contentUpdate));
                  request.getRequestDispatcher("ViewQuestionSlot.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ViewQuestionSlotController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
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
