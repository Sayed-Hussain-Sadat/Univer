
<%@page import ="java.sql.*,java.lang.ClassNotFoundException" %>
<html>
	<head>
	</head>
	<body>
	
		<%
			Connection con = null;
			PreparedStatement ps = null;
			
			String oldid = request.getParameter("oldtxt");
			String newid = request.getParameter("newtxt");
			String conid = request.getParameter("conftxt");
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
				if(con != null)
				{
					
					String query ="update logtb set pass = ? where pass ='"+oldid+"'";
					
					ps = con.prepareStatement(query);
					if(newid.equals(conid))
					{
						ps.setString(1,newid);
					}
					else
					{
						out.print("Sorry, the new password does not match with old password");
					}
					
					int result = ps.executeUpdate();
					if(result != 0)
					{
						out.print("Successfully Updated");
					}
					else
					{
						out.print("Sorry,Your password is invalid");
					}
					
					
				}
				else
				{
					out.print("Sorry,No Connectionn Done");
				}
			}
			catch(ClassNotFoundException cnfe)
			{
				out.print("Sorry,Class Of Connectionn Have Problem");
			}
			catch(SQLException sqlexp)
			{
				out.print("SQL Exception accourd");
			}
		%>
	</body>
</html>