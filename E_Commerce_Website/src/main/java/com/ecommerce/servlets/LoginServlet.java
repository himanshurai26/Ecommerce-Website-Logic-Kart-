
package com.ecommerce.servlets;

import com.ecommerce.dao.UserDao;
import com.ecommerce.entities.User;
import com.ecommerce.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try{
           
          String Email = request.getParameter("email");
          String  Pssword = request.getParameter("password");
           
          // validation
          
          //Authenticating useer
          
        UserDao userdao = new UserDao(FactoryProvider.getFactory());
          User user = userdao.getUserByEmailAndPassword(Email, Pssword);
          System.out.println(user);
         // out.println("SUceesfully login");
          
         HttpSession session = request.getSession();
          if(user == null){
             session.setAttribute("message","Invalid Details !!, please check details !!");
         response.sendRedirect("login.jsp");
         return;
          }else{
              out.println("<h1>Welcome " + user.getUserName() + "</h1>");
          
             //login
             session.setAttribute("current-user", user);
              
             if(user.getUserType().equals("admin")){
                 // admin.jsp
                 response.sendRedirect("admin.jsp");
                 
             }else if(user.getUserType().equals("normal")){
                 //normal.jsp
                 response.sendRedirect("normal.jsp");
             }else{
                 out.println("User type  error...");
             }
              
        
          
          
         
          
          
          
          
          
          
          }
          
          
          
          
            }catch(Exception e){
                e.printStackTrace();
                out.println("Something is wrong in this code please check");
            }
          
            
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
