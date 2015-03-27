<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!--   <head> -->
    
    
<!--     <title>Bank Application</title> -->
    
	
<!--   </head> -->
 <body background="http://4vector.com/i/free-vector-gallery-show-background-03-vector_017002_3.jpg" style="
    background-position-x: 50%;
">
<% 
	String funcID = request.getParameter("funcID");
 	String name = request.getParameter("name");
// 	String street = request.getParameter("street");
// 	String city = request.getParameter("city");
%>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	}
	catch(Exception e)
	{
		out.println("can't load mysql driver");
		out.println(e.toString());
	}
%>
<br>
<h1 align="center"> Gallery List</h1>

<% 	try {
		String url="jdbc:mysql://127.0.0.1:3306/gallery";
		String id="gallery";
		String pwd="eecs221";
		Connection con= DriverManager.getConnection(url,id,pwd); 
	
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
				stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
				String sql="SELECT * FROM gallery";
				rs=stmt.executeQuery(sql); // Result set get the result of the SQL query
 				out.println("<table border=\"1\" align=center>");
 				//out.println("<caption> Gallery List </caption>");
 				out.println();
 				out.println();
 				out.println();
 				out.println("<tr>");
 				out.println("<th>Modify</th>");
 				out.println("<th>ID</th>");
 				out.println("<th>Name</th>");
				out.println("<th>Description</th>");
 				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					String temp = rs.getString("gallery_id");
					String temp2 = rs.getString("name");
					String temp3 = rs.getString("description");
					out.print("<td>"+ "<a href = ModifyGallery.jsp?id="+temp+"&name="+temp2+">");
					out.print("Select");
					out.println("</a>"+"</td>");					
					out.print("<td>"+ "<a href = Display.jsp?id="+temp+"&name="+temp2+">");
					out.print(temp);
					out.println("</a>"+"</td>");
					out.println("<td>"+temp2+"</td>");
					out.println("<td>"+temp3+"</td>");
					out.println("</tr>");
				}
				rs.close();
				stmt.close();
				out.println("</table>");
				
		con.close();
	}
	catch(Exception e)
	{
			out.println(e.toString());
	} %>	
	


<br>
<table align="center">
<tr>
<td><input type="button" value="Back" onClick=call1()></td>
<td><input type="button" value="Home" onClick=call2()></td>
</tr>
</table>

<script>
function call1(){
	window.location=("Index.jsp");
}

function call2(){
	window.location=("Index.jsp");
}
</script>
  </body>
</html>
