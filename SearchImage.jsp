<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<br>
	<h1 align="center">Search Images</h1>
	<table align="center">
		<tr>
			<td>Choose an option:</td>
			<td><select id="option">
					<option>Select</option>
					<option value="type">Type</option>
					<option value="year">Year</option>
					<option value="name">Artist Name</option>
					<option value="location">Location</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>Type your query</td>
			<td><input type="text" id="text"></td>
		</tr>
	</table>
	<br>
	<table align="center">
		<tr>
			<td><input type="button" value="Home" onClick=call2()></td>
			<td><input type="button" value="Search" onClick=myFunct()>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		function myFunct() {
			var value = document.getElementById('option').value;
			var query = document.getElementById('text').value;
			window.location = "ImageResults.jsp?option=" + value + "&query="
					+ query;
		}
		function call2() {
			window.location = ("Index.jsp");
		}
	</script>
</body>
</html>
