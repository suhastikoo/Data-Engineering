<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<br>
	<h1 align="center">Search Artists</h1>
	<table align="center">
		<tr>
			<td>Choose an option:</td>
			<td><select id="option">
					<option>Select</option>
					<option value="country">Country</option>
					<option value="year">Birth Year</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>Type your query</td>
			<td><input type="text" id="text"></td>
		</tr>
	</table>
	<table align="center">
		<tr>
			<td><input type="button" value="Search" onClick=myFunct()>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		function myFunct() {
			var value = document.getElementById('option').value;
			var query = document.getElementById('text').value;
			window.location = "ArtistResults.jsp?option=" + value + "&query="
					+ query;
		}
	</script>
</body>
</html>
