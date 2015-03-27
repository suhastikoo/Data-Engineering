<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!--   <head>     -->
<!--     <title>Bank Application</title>	 -->
<!--   </head> -->
<body background="http://4vector.com/i/free-vector-gallery-show-background-03-vector_017002_3.jpg" style="
    background-position-x: 50%;
">
<!-- <img src = "D:/EclipseEE/Data/Images/EscapeIntoReality.jpg" style="width:304px;height:228px"> -->
	<% 
	//String link = request.getParameter("link");
	String title = request.getParameter("title").replaceAll("/"," ");
	String artist = request.getParameter("artist_id");
	String detail = request.getParameter("detail_id");
	
	//link.replaceAll("/","\\");
	//out.println(link);
	//out.println(title);
	//out.println(artist);
	//out.println(detail);
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
<% 	try {
		String url="jdbc:mysql://127.0.0.1:3306/gallery";
		String id="gallery";
		String pwd="eecs221";
		Connection con= DriverManager.getConnection(url,id,pwd); 
	
		//int func=Integer.valueOf(funcID);
		out.println("<table align=center>");
		out.println("<tr>");
 		out.println("<td><h1>" + title + "</h1></td>"); 
 		out.println("<br>");
 		out.println("<br>");
 		out.println("</tr>");
 		out.println("</table>");
 		out.println("<br>");
 		
 		
 	//	out.println("<br>");
 		
 			
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
				stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
				String sql="SELECT * FROM detail,artist where detail_id=" + detail+" and artist_id="+artist;
				rs=stmt.executeQuery(sql); // Result set get the result of the SQL query
 				out.println("<table border=\"1\" align=center>");
 				out.println("<tr>");
 				out.println("<th>Image ID</th>");
 				out.println("<th>Artist Name</th>");
 				out.println("<th>Year</th>");
				out.println("<th>Type</th>");
				out.println("<th>Size</th>");
				out.println("<th>Location</th>");
				out.println("<th>Description</th>");
 				out.println("</tr>");
 				String temp1 ="";
				while (rs.next()) {
					out.println("<tr>");
					String temp = rs.getString("name");
					temp1 = rs.getString("image_id");
// 					out.print("<td>"+ "<a href = " +temp+".jsp"+">");
// 					out.print(temp);
// 					out.println("</a>"+"</td>");
					out.println("<td>"+rs.getString("image_id")+"</td>");
					out.print("<td>"+ "<a href = ArtistDetails.jsp?artist_id="+artist+"&name="+temp.replaceAll(" ","/")+">");	
					out.print(temp);
 					out.println("</a>"+"</td>");
					out.println("<td>"+rs.getString("year")+"</td>");
					out.println("<td>"+rs.getString("type")+"</td>");
					out.println("<td>"+rs.getString("height") + " X " + rs.getString("width")+"</td>");
					out.println("<td>"+rs.getString("location")+"</td>");
					out.println("<td>"+rs.getString("description")+"</td>");
					out.println("</tr>");
				}
				out.println("<table border=\"1\" align=center>");
				out.println("<tr>");
		 		out.println("<td><img src=Image?imgid=" + temp1 +" width=300px height=300px>"+"</td>"); 
		 		out.println("<br>");
		 		out.println("</tr>");
		 		out.println("</table>");
		 		out.println("<br>");
				rs.close();
				stmt.close();
				out.println("</table>");
		
		con.close();
	}
	catch(Exception e)
	{
			out.println(e.toString());
	}%>

<br>
<table align="center">
<tr>

<td><input type="button" value="Home" onClick=call2()></td>
</tr>
</table>

<script>
function call1(){
	window.location=("Display.jsp");
}

function call2(){
	window.location=("Index.jsp");
}
</script>
</body>
</html>
