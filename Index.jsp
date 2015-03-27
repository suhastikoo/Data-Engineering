<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gallery Database</title>
</head>
<body background="http://4vector.com/i/free-vector-gallery-show-background-03-vector_017002_3.jpg" style="
    background-position-x: 50%;
">
	<br>
	<h1 align="center">Gallery Database</h1>

	<br>
	<table border="\" "1\"="" align="center">
		<caption><i><b>Choose an option</b></i></caption>
		<tbody><tr>
			<td>List all galleries</td>
			<td><a href="GalleryList.jsp"> Click here</a></td>
		</tr>
		<tr>
			<td>Create new gallery</td>
			<td><a href="NewGallery.jsp"> Click here</a></td>
		</tr>
		<tr>
			<td>Create new artist</td>
			<td><a href="NewArtist.jsp"> Click here</a></td>
		</tr>
		<tr>
			<td>Add new image</td>
			<td><a href="NewImage.jsp"> Click here</a></td>
		</tr>
		<tr>
			<td>Delete image</td>
			<td><a href="GalleryListDelete.jsp"> Click here</a></td>
		</tr>
		<tr>
			<td>Modify image</td>
			<td><a href="GalleryListDelete.jsp"> Click here</a></td>
		</tr>
		<tr>
			<td>Modify artist</td>
			<td><a href="ListArtists.jsp"> Click here</a></td>
		</tr>
		<tr>
			<td>Search Image</td>
			<td><a href="SearchImage.jsp"> Click here</a></td>
		</tr>
		<tr>
			<td>Search Artist</td>
			<td><a href="SearchArtist.jsp"> Click here</a></td>
		</tr>
	</tbody></table>
	<!-- <input type="submit" value="Show" Onclick="goToInfo()"/> -->
	<script>
function goToInfo(){
window.location = "Gallery List.jsp";
 }
</script>


</body>
</html>