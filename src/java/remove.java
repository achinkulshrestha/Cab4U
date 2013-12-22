/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ankita
 */
public class remove extends HttpServlet {

   private Connection con = null;
	private	PreparedStatement pstmt = null;
	private ResultSet rs = null;
        private Statement stmt=null;

        ServletContext context=null;


    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        String emp_id=(req.getParameter("qparam")).toString();
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        context = getServletContext();

         try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost:3306/cab_booking?" +
                                   "user=root&password=";
            Connection con = DriverManager.getConnection(connectionUrl);
            String str="";
                
            int a;
            Statement stmt = con.createStatement();
            System.out.println("in addnewcar servlet");
            pstmt = con.prepareStatement("update  request set status=0 where emp_id ="+emp_id);
            a = pstmt.executeUpdate();
            pstmt = con.prepareStatement("Delete from scheduling where emp_id="+emp_id);
             a = pstmt.executeUpdate();

            RequestDispatcher rd = context.getRequestDispatcher("/cab_allocation.jsp");
            rd.forward(req,res);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException cE) {
            System.out.println("Class Not Found Exception: "+ cE.toString());
        }
         finally { 
            out.close();
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
        processRequest(request, response);
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
        processRequest(request, response);
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