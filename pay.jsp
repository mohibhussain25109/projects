<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<title>pay</title>
<body>
<%
		String fname = request.getParameter("Fname");
		String email = request.getParameter("Email");
		String add = request.getParameter("Address");
		String city = request.getParameter("City");
		String state = request.getParameter("State");
		String pin = request.getParameter("Pincode");
		String cname = request.getParameter("Cname");
		String ccard = request.getParameter("Ccard");
		String expmonth = request.getParameter("Expmonth");
		String expyear = request.getParameter("Expyear");
		String cvv = request.getParameter("CVV");
		String amount = request.getParameter("Amount");
		

		 Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        boolean dbInserted = false;
	        
	        int paymentId = 0;
		String DBPassword = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sitora","root","root");
		String insertSql = "insert into pay(Fname,Email,Address,City,State,Pincode,Cname,Ccard,Expmonth,Expyear,CVV,Amount)VALUES(?, ?, ?, ?, ?,?,?,?,?,?,?,?)";
	            ps = con.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS);
	            ps.setString(1, fname);
	            ps.setString(2, email);
	            ps.setString(3, add);
	            ps.setString(4, city);
	            ps.setString(5, state);
	            ps.setString(6, pin);
	            ps.setString(7, cname);
	            ps.setString(8, ccard);
	            ps.setString(9, expmonth);
	            ps.setString(10, expyear);
	            ps.setString(11, cvv);
	            ps.setString(12, amount);
	            
	            int count = ps.executeUpdate();
	            if(count > 0) {
	                dbInserted = true;
	                rs = ps.getGeneratedKeys();
	                if(rs.next()){
	                    paymentId= rs.getInt(1);
	                }
	            }
	                
	            
	        } catch(Exception e) {
	            out.println("<p>Error: " + e.getMessage() + "</p>");
	        } finally {
	            if(rs != null) try { rs.close(); } catch(Exception e) {}
	            if(ps != null) try { ps.close(); } catch(Exception e) {}
	            if(con != null) try { con.close(); } catch(Exception e) {}
	        }
	    %>

	    <%
	        if(dbInserted) {
	    %>
	         <h2 style="text-align: center; margin: 20px 0;">Sitora Grand Haven</h2>
	        <h1 style="text-align: center; margin: 20px 0;">Invoice</h1>
	        <div style="width: 80%; margin: 20px auto; border: 1px solid #ccc; padding: 20px; font-size: 1.2rem; line-height: 1.6; background-color: #F3EAD9;">
	            
	            <p><strong>Card Holder Name:</strong> <%= fname %></p>
	            <p><strong>Email:</strong> <%= email %></p>
	            
	            <p><strong>Billing Address:</strong> <%= add %></p>
	             <p><strong>City:</strong> <%= city %></p>
	              <p><strong>State:</strong> <%= state %></p>
	               <p><strong>Pin code:</strong> <%= pin %></p>
	                <p><strong>Card Holder Name:</strong> <%= cname %></p>
	                <p><strong>Card Number:</strong> <%= ccard %></p>
	                <p><strong>Expiry month:</strong> <%= expmonth %></p>
	                <p><strong>Expiry year :</strong> <%= expyear %></p>
	            <p><strong>CVV:</strong> <%= cvv %></p>
	           
	            <p><strong>Amount: </strong> <%= amount %></p>
	        </div>
	        
	    <%
	        } else {
	    %>
	         out.print("Not booked.");
			<a href="payment.html">Try Again here </a>
	    <%
	        }
	    %>

	   
	</body>
	</html>
			
			
		