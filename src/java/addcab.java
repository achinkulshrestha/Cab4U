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
public class addcab extends HttpServlet {

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

        String time=(req.getParameterValues("time")).toString();
        String facility=(req.getParameterValues("facility")).toString();
        String[] cab=req.getParameterValues("cab");
        //String cab_id=req.getParameter("cab_id");
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        context = getServletContext();

         try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost:3306/cab_booking?" +
                                   "user=root&password=";
            Connection con = DriverManager.getConnection(connectionUrl);
            String str="";
      /*      for(int i=0;i<check.length;i++)
            {
               
                str+=check[i]+",";
            }*/
                
            int a;
         //   PreparedStatement pstmt;
            System.out.println("in addnewcar servlet");
             pstmt=con.prepareStatement("insert into available_cab_info(cab_id,facility,shift,available) values(?,?,1,1)");
            for(int i=0;i<cab.length;i++)
         {
             pstmt.setInt(1,Integer.parseInt(cab[i]));
            pstmt.setString(2,facility);
            a = pstmt.executeUpdate();
        }
            
           /* RequestDispatcher rd = context.getRequestDispatcher("/cab_allocation.jsp");
            rd.forward(req,res);*/
            res.sendRedirect("/cab_allocation.jsp");
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
    }
}