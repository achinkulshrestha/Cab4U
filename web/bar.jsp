<%-- 
    Document   : bar
    Created on : Jul 5, 2011, 10:21:03 PM
    Author     : Achin K
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%--%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>

<%
String query="SELECT Count(emp_id),location  from transaction group by location";
JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/cab_booking","com.mysql.jdbc.Driver","root","");

dataset.executeQuery(query);
JFreeChart chart = ChartFactory.createBarChart3D(
"Test", 
"No of EMployee", 
"Location", 
dataset, 
PlotOrientation.VERTICAL,true, true, false);
try
{
   File image = File.createTempFile("image", "tmp");
//ChartUtilities.saveChartAsJPEG(new File("C:/chart.jpg"), chart, 400, 300);
// Assume that we have the chart
	 ChartUtilities.saveChartAsPNG(image, chart, 500, 300);
	 
	 FileInputStream fileInStream = new FileInputStream(image);
	 OutputStream outStream = response.getOutputStream();   
	 
	 long fileLength;
	 byte[] byteStream;
	 
	 fileLength = image.length();
	 byteStream = new byte[(int)fileLength];
	 fileInStream.read(byteStream, 0, (int)fileLength);
	 
	 response.setContentType("image/png");
	 response.setContentLength((int)fileLength);
	 response.setHeader("Cache-Control",
	     "no-store,no-cache, must-revalidate, post-check=0, pre-check=0");
	 response.setHeader("Pragma", "no-cache");
	 
	 fileInStream.close();
	 outStream.write(byteStream);
	 outStream.flush();
	 outStream.close();
}
catch (IOException e)
{
System.out.println("Problem in creating chart.");
}
%>
