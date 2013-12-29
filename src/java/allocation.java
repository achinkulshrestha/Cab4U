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
 * @author Achin K
 */
public class allocation extends HttpServlet {

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

        String time=(req.getParameter("time")).toString();
        String location=req.getParameter("zones");
        String[] check=req.getParameterValues("checklist");
        String cab_id=req.getParameter("cab_id");
        cab_id=cab_id.substring(0, cab_id.indexOf(("on")));
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        context = getServletContext();

         try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost:3306/cab_booking?" +
                                   "user=root&password=";
            Connection con = DriverManager.getConnection(connectionUrl);
            String str="";
            for(int i=0;i<check.length;i++)
            {
               
                str+=check[i]+",";
            }
                
            int a;
            Statement stmt = con.createStatement();
            System.out.println("in addnewcar servlet");
            str=str.substring(0, str.length()-1);
            System.out.println("update into request set status=1 where emp_id in ("+ str+ ")");
            pstmt = con.prepareStatement("update  request set status=1 where emp_id in ("+ str+ ")");
            a = pstmt.executeUpdate();
            pstmt = con.prepareStatement("insert into scheduling(emp_id,cab_id,time) values(?,?,?)");
for(int i=0;i<check.length;i++)
{ pstmt.setInt(1,Integer.parseInt(check[i]) );
            pstmt.setInt(2,Integer.parseInt(cab_id));
            pstmt.setString(3,time);
            System.out.println(cab_id+"dd");
             a = pstmt.executeUpdate();
}
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