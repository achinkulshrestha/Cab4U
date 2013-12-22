<%-- 
    Document   : index
    Created on : Jul 6, 2011, 9:49:15 PM
    Author     : achink
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<script language="Javascript" src="ajaxfunction.js"></script>
<script language="Javascript" src="jquery-1.6.2.min.js"></script>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <script language="Javascript" src="/ajaxfunction.js"></script>
        <script type="text/javascript" language="javascript">

            function checkform()
            {	
                alert ("Browser does not support HTTP Request");
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cab Allocation</title>
    </head>
    <body>
        <form name="myform" action="allocation">
            <table>
            
            <tr>
                <td> Select time  <td>
                        <select name="time" id="time">
                            <option>5:30</option>
                            <option>6:30</option>
                            <option>7:30</option>
                            <option>8:30</option>
                        </select>
                                         </td>
                                         <td>Select location  </td>
                                         <td>
                        <select name="zones" onChange="show_grid(this.value)">
                            <option >All</option>
                            <option>indira</option>
                            <option>kormangala</option>
                            <option>ulsoor</option>
                            <option>residency</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="grid">
                        </div>
                    </td>
                </tr>
                <tr>
                    <%

                        try {
                            String responseText = new String("");

                            String optionalvalue = (String) request.getParameter("qparam");
                            Class.forName("com.mysql.jdbc.Driver");
                            String connectionUrl = "jdbc:mysql://localhost:3306/cab_booking?"
                                    + "user=root&password=";
                            Connection con = DriverManager.getConnection(connectionUrl);

                            String query;
                            ResultSet rs = null;
                            PreparedStatement ps = null;
                             ResultSet rs1 = null;
                            PreparedStatement ps1 = null;
                            query = "SELECT available_cab_info.cab_id as c1, cab_info.capacity as c2 FROM available_cab_info, cab_info WHERE cab_info.id = available_cab_info.cab_id ";
//"AND scheduling.cab_id = available_cab_info.cab_id where district_code="+optionalvalue+"";
                            ps = con.prepareStatement(query);
                            rs = ps.executeQuery();
                            
                            %>
                  <td><p>&nbsp;</p>
                  <p>Cab ID</p></td>
                    <td>
                        <select name="cab_id" onChange="showUser(this.value)">>
                            <% while (rs.next()) {
                            query = "SELECT count(emp_id) FROM scheduling WHERE cab_id = "+rs.getInt(1) ;
                            System.out.println(query+"dd");
//"AND scheduling.cab_id = available_cab_info.cab_id where district_code="+optionalvalue+"";
                            ps1 = con.prepareStatement(query);
                            rs1 = ps1.executeQuery();
if(rs1.next())
{%>
                            <option value=<%=rs.getInt(1)%>onselect="show()"><%=rs.getInt(1) + "(" + ((rs.getInt(2))-(rs1.getInt(1))) + ")"%> </option>
                            <%}
                                                       }
       // close all the connections.%>

                        </select>
                    </td>
                    <% rs.close();

                        } catch (Exception ex) {

                            out.println(ex.toString() + "Unable to connect to database.");
                        }
                    %>

                </tr>
                <p>&nbsp;</p>
          <tr><td>&nbsp;</td>
                    <td><input type="submit" 
                               name="B1" value="Allocate" />
              <td><input type="button" value="view allocation" onClick="location.href='view_allocation.jsp'"></td>
                </tr>
                <tr>
                    <td><div id="list"></div></td>
                </tr>
                

                    </form>
                    </body>
                    </form>
                    </body>
                    </html>
