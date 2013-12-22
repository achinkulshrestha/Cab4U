
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">

<TITLE>taluklist.jsp</TITLE>
</HEAD>
<BODY>
<% response.setDateHeader("Expires",-1);%>
<%

try{
		String responseText=new String("");

		                     String optionalvalue=(String) request.getParameter("qparam");
                                Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost:3306/test?" +
                                   "user=root&password=";
            Connection con = DriverManager.getConnection(connectionUrl);

           String query;
		ResultSet rs=null;
		PreparedStatement ps=null;
		query="SELECT available_cab_info.cab_id as c1, cab_info.capacity as c2 FROM available_cab_info, cab_info WHERE cab_info.id = available_cab_info.cab_id ";
//"AND scheduling.cab_id = available_cab_info.cab_id where district_code="+optionalvalue+"";
		ps=con.prepareStatement(query);
		rs=ps.executeQuery();
		responseText="<select name=cab>";
	
		while(rs.next())
		{
			responseText+="<option  value='"+ rs.getString("c1") +"'>"+rs.getInt("c1")+" ("+rs.getInt("c2")+"</option> ";		
		}
	responseText+="</select>";
  	out.print(responseText);
  	con.close();
 
 } 
 catch(Exception e)
	{
		out.println("Error "+e.getMessage());
		
	}
	
%>
</BODY>
</HTML>
