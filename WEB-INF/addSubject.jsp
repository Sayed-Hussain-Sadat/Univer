
<%@page import ="java.sql.*,java.lang.ClassNotFoundException" %>
<html>
	<head>
	</head>
	<body>
		
		<%
			Connection con = null;
			PreparedStatement ps = null;
			
			String subjectName = request.getParameter("subNametxt");
			String desCript = request.getParameter("desCriptxt");
			
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
				
				if(con != null)
				{
					String query ="insert into subjecttbl values(?,?)";
					
					ps = con.prepareStatement(query);
					ps.setString(1,subjectName);
					ps.setString(2,desCript);
					
					int result = ps.executeUpdate();
					if(result != 0)
					{
						out.print("Data Successfully Inserted");
						out.print("<a href ='addSubject.html'>Back</a>");
					}
					else
					{
						out.print("Sorry,Data Not Inserted");
						out.print("<a href ='addSubject.html'>Back</a>");
					}
				}
				else
				{
					out.print("Sorry,No Connection Done");
				}
			}
			catch(ClassNotFoundException cnfe)
			{
				out.print("Sorry,Class Of Connection Have Problem");
			}
			catch(SQLException sqlexp)
			{
				out.print("Oh SQL Exception Accord");
			}
		%>
	</body>
<html>