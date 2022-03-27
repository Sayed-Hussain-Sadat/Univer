
<%@ page import ="java.sql.*,java.lang.ClassNotFoundException" %>
<html>
	<head>
	</head>
	<body>
		
		<%
			Connection con = null;
			PreparedStatement ps = null;
			
			String role = request.getParameter("SURoletxt");
			String ID = request.getParameter("logIDtxt");
			String fname = request.getParameter("fnametxt");
			String lname = request.getParameter("lnametxt");
			String DOB = request.getParameter("DOBirthtxt");
			String gender = request.getParameter("gendertxt");
			String phone = request.getParameter("phonetxt");
			String fpass = request.getParameter("passwordtxt");
			String ConPass = request.getParameter("Conpasswordtxt");
			
			
				
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
				
				if(con != null)
				{
					String query ="insert into usertbl values(?,?,?,?,?,?,?,?)";
					
					ps = con.prepareStatement(query);
					ps.setString(1,role);
					ps.setString(2,ID);
					ps.setString(3,fname);
					ps.setString(4,lname);
					ps.setString(5,DOB);
					ps.setString(6,gender);
					ps.setString(7,phone);
					if(fpass.equals(ConPass))
					{
						ps.setString(8,fpass);
					}
					
					
					
					int result = ps.executeUpdate();
					if(result != 0)
					{
						out.print("Data Successfully Inserted");
					}
					else
					{
						out.print("Sorry,Data Not Inserted");
					}
				}
				else
				{
					out.print("Sorry,No connection done");
				}
			}
			catch(ClassNotFoundException cnfe)
			{
				out.print("Sorry,Class Of Connection Have Problem");
			}
			catch(SQLException sqlex)
			{
				out.print("Sorry,SQL Exception accord");
			}
		%>
	</body>
</html>