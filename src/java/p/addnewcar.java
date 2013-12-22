/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package p;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
/**
 *
 * @author debopriyog
 */
public class addnewcar extends HttpServlet {

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

        String licence_no=(req.getParameter("carno")).toString();
        int capacity=Integer.parseInt(req.getParameter("capacity"));;
        String model=(req.getParameter("model")).toString();;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        context = getServletContext();

         try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost:3306/cab_booking?" +
                                   "user=root&password=";
            Connection con = DriverManager.getConnection(connectionUrl);

            Statement stmt = con.createStatement();
            System.out.println("in addnewcar servlet");
            pstmt = con.prepareStatement("insert into cab_info(id,license,capacity,model) values(NULL,?,?,?)");

            pstmt.setString(1,licence_no );
            pstmt.setInt(2,capacity);
            pstmt.setString(3,model);
            int a = pstmt.executeUpdate();

            RequestDispatcher rd = context.getRequestDispatcher("/successfullnewcaradded.jsp");
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
