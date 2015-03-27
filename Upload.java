

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
@MultipartConfig(maxFileSize = 16177215)
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Upload() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String title = request.getParameter("title");
		String link = request.getParameter("link");
		String gallery = request.getParameter("gallery");
		String artist = request.getParameter("artist");
		//String detail = request.getParameter("detail");
		String year = request.getParameter("year");
		String type = request.getParameter("type");
		String width = request.getParameter("width");
		String height = request.getParameter("height");
		String loc = request.getParameter("loc");
		String des = request.getParameter("des");

		InputStream inputStream = null;
		String message ="";
		Part imagePart = request.getPart("image");

		if (imagePart != null) {
			// prints out some information for debugging
			System.out.println(imagePart.getName());
			System.out.println(imagePart.getSize());
			System.out.println(imagePart.getContentType());
			// obtains input stream of the upload file
			inputStream = imagePart.getInputStream();
		}

		java.sql.CallableStatement csmt = null;
		Connection con = null;
		int row = 0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/gallery";
			String id="gallery";
			String pwd="eecs221";
			String connectionURL = "jdbc:mysql://localhost:3306/gallery?user=gallery&password=eecs221&noAccessToProcedureBodies=true";
			con = DriverManager.getConnection(connectionURL);
			
			System.out.println(con.toString());
			String sqlstat = "{call insertImage (?, ?, ?, ? ,? ,?, ?, ?, ?, ?, ?, ?)}";
			csmt = con.prepareCall(sqlstat);
			csmt.setString(1, title);
			csmt.setString(2, link);
			csmt.setString(4, gallery);
			csmt.setString(5, artist);
			csmt.setString(6, year);
			csmt.setString(7, type);
			csmt.setString(8, width);
			csmt.setString(9, height);
			csmt.setString(10, loc);
			csmt.setString(11, des);
			csmt.registerOutParameter(12, java.sql.Types.INTEGER);

			if (inputStream != null) {
				csmt.setBlob(3, inputStream);
			}
			csmt.executeUpdate();
			row = csmt.getInt(12);
			if (row > 0) {
				message = "File uploaded and saved into database" + row;
			}

		}
		catch (SQLException ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				// closes the database connection
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}

			System.out.println(message);
			response.sendRedirect("ImageAdded.jsp?id="+row);

		}
	}

}
