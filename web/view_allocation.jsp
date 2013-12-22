<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<script language="Javascript" src="ajaxfunction.js"></script>
<html>
<head>
     <script language="Javascript" src="ajaxfunction.js"></script>
     <script type="text\language">
      
     </script>
<title>display data from the table using jsp</title>
</head>
<body>
<h2 align="center">Data from the table </h2>
<%
try {
/* Create string of connection url within specified format with machine
name, port number and database name. Here machine name id localhost and 
database name is student. */
String connectionURL = "jdbc:mysql://localhost:3306/cab_booking";
// declare a connection by using Connection interface
Connection connection = null;
/* declare object of Statement interface that is used for executing sql 
statements. */
Statement statement = null;
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("com.mysql.jdbc.Driver").newInstance();
/* Create a connection by using getConnection() method that takes parameters 
of string type connection url, user name and password to connect to database.*/
connection = DriverManager.getConnection(connectionURL, "root", "");
/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
statement = connection.createStatement();
// sql query to retrieve values from the secified table.
String QueryString = " Select distinct(cab_id),employee_info.name,scheduling.emp_id, time from scheduling,employee_info where employee_info.id=scheduling.emp_id ";
rs = statement.executeQuery(QueryString);
%>
<TABLE align="center" cellpadding="15" border="1" style="background-color: #ffffcc;">
<TR>
<TD>Cab_id</TD>
<TD>EmpName</TD>
<td>Emp id</td>
<TD>Time</TD>
<td>Remove link</td>
</TR>
    <%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getInt(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getInt(3)%></TD>
<TD><%=rs.getString(4)%></TD><TD><button value=<%=rs.getInt(3)%> onClick="remove(this.value)"> Remove</button></td>
</TR>
<% } %>
<%
// close all the connections.
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
out.println("Unable to connect to database."+ex.toString());
}
%>
</TABLE><TABLE align="center">
<TR>
<TD><FORM ACTION="cab_allocation.jsp" method="get" >
<button type="submit"><-- back</button></TD>
<td><button onclick="exportToExcel();">Save as Excel</button></td>
</TR>
</TABLE>
</font>
</body>
</html>