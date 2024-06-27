/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.user;

import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Dan
 */
@WebServlet(name = "UpdateUserController", urlPatterns = {"/updateUser"})
public class UpdateUserController extends HttpServlet {

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
            out.println("<title>Servlet UpdateUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateUserController at " + request.getContextPath() + "</h1>");
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
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//        if (user == null) {
//            response.sendRedirect("login");
//        } else {
//            if (!user.getRole().equals("admin")) {
//                PrintWriter out = response.getWriter();
//                out.print("Access Denied");
//            } else {
        String id_raw = request.getParameter("id");

        UserDao dao = new UserDao();
        try {
            int id = Integer.parseInt(id_raw);
            System.out.println(id);
            User user = dao.getUserById(id);
            System.out.println(user);
            request.setAttribute("user", user);
            request.getRequestDispatcher("UpdateUser.jsp").forward(request, response);
        } catch (Exception e) {

        }
//            }

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
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String role = request.getParameter("role");
        String realRole = null;
        UserDao dao = new UserDao();
   
            int id = Integer.parseInt(request.getParameter("id"));
            if (role.equals("admin")) {
                realRole = "admin";

            } else if (role.equals("teacher"))  {
                realRole = "teacher";
            }
            else if (role.equals("student"))  {
                realRole = "student";
            }
            dao.updateUser(id,new User( username, password, email, realRole));
            response.sendRedirect("listUser");
         
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
