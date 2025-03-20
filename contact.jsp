<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<title>Contact</title>
<body>
<%
		String myname = request.getParameter("name");
		String myphone = request.getParameter("phone");
		String myemail = request.getParameter("email");
		String mysubject = request.getParameter("subject");
		String mymessage = request.getParameter("message");
		

		Connection con = null;
		Statement stmt = null;
		boolean dbinserted = false;
		
		String DBPassword = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sitora","root","root");
			stmt = con.createStatement();
			int count =stmt.executeUpdate("insert into contact(name,phone,email,subject,message)VALUES('"+myname+"','"+myphone+"','"+myemail+"','"+mysubject+"','"+mymessage+"')");
			if(count > 0){
				dbinserted = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		}

		if (dbinserted) {
			response.sendRedirect("home.html");
		} 
		else {
			out.print("Not contacted.");
			%><a href="contact.html">Try Again here </a><%
		}
	%>

</body>
</html>
