<%@ page import ="java.sql.*" %>
<html>
	<head>
		<link href ="css/bootstrap.min.css" rel ="stylesheet">
		<script src ="js/jquery.min.js"></script>
		<script src ="js/popper.min.js"></script>
		<script src ="js/bootstrap.min.js"></script>
		<title>Add Attendance Page</title>
		<style>
			.par
			{
				position:absolute;
				top:0;
				bottom:0;
				left:0;
				right:0;
				background-image:url('images/har1.jpg');
				background-color:rgb(200,200,120,0.999);
				background-blend-mode:overlay;				
				
			}
			
		</style>
		<script>
			function resetFun()
			{
				document.getElementById("myForm").reset();
			}
		</script>
	</head>
	<body>	
		<div class ="par" >
			<ul class ="nav nav-tabs nav-justified bg-warning">
				<li class ="flex-grow-1">
					<img src ="images/log.png" width ="300" height ="40">
				</li>
				<li class ="nav-item">
					<a href ="administrator.html" class ="nav-link">Home</a>
				</li>
				<li class ="nav-item dropdown">
					<a href ="#" class ="nav-link dropdown-toggle" data-toggle ="dropdown">Administration</a>
					<div class ="dropdown-menu">
						<a href ="#" class ="dropdown-item">Add Attendance</a>
						<a href ="addSubject.html" class ="dropdown-item">Add Subject</a>
						<a href ="addUser.html" class ="dropdown-item">Add User</a>
						<a href ="feeDetails.html" class ="dropdown-item">Add Fee</a>
					</div>
				</li>
				<li class ="nav-item dropdown">
					<a href ="#" class ="nav-link dropdown-toggle" data-toggle ="dropdown">Details</a>
					<div class ="dropdown-menu">
						<a href ="studentDetails.html" class ="dropdown-item">Student Details</a>
						<a href ="attendanceDetails.html" class ="dropdown-item">Attendance Details</a>
						<a href ="#" class ="dropdown-item">Subject Details</a>
						<a href ="resultDetails.html" class ="dropdown-item">Result Details</a>
						<a href ="FeesDetails.html" class ="dropdown-item">Fee Details</a>
					</div>
				</li>
				<li class ="nav-item dropdown">
					<a href ="#" class ="nav-link dropdown-toggle" data-toggle ="dropdown">My Account</a>
					<div class ="dropdown-menu">
						<a href ="myProfile.html" class ="dropdown-item">My Profile</a>
						<a href ="chengPassword.html" class ="dropdown-item">Change Password</a>
					</div>
				</li>
				<li class ="nav-item">
					<a href ="index.html" class ="nav-link">Log Out</a>
				</li>
			</ul>
			
			
			<div style ="width:100%;height:50px;background-color:black">
				<h4 class ="text-light" style ="padding-left:6.5%;padding-top:0.5%">Add Attendance :</h4>
			</div>
			
		<%	
			Connection con = null;
			PreparedStatement ps = null;
			
			String idStr = request.getParameter("idtxt");
			String nameStr = request.getParameter("nametxt");
			String subjectStr = request.getParameter("subjecttxt");
			String lectureStr = request.getParameter("lectxt");
			String dateStr = request.getParameter("dattxt");
			String statusStr = request.getParameter("statxt");
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
				if(con != null)
				{
					String query ="insert into attendancetbl values(?,?,?,?,?,?)";
					ps = con.prepareStatement(query);
					ps.setString(1,idStr);
					ps.setString(2,nameStr);
					ps.setString(3,subjectStr);
					ps.setString(4,lectureStr);
					ps.setString(5,dateStr);
					ps.setString(6,statusStr);
					
					int result = ps.executeUpdate();
					if(result != 0)
					{
						out.print("<b><h4><center>Successfully,Data Inserted</center></h4></b>");
					}
					else
					{
						out.print("Sorry,Not Inserted");
					}
				}
				else
				{
					out.print("Sorry,No Connection Done");
				}
				%>
				<div class ="container">
				<div class ="row" style ="margin-top:5%;margin-left:6%">
					<div style ="width:45%;margin-lef:25px;">
						<form action ="MyAttendant" method ="POST" id ="myForm">
							<div class ="form-group">
								<b><label for ="ss">Student ID :</label></b>
								<input type ="text" class ="form-control" name ="idtxt" id ="ss" />
							</div>
							<div class ="form-group">
								<b><label for ="sname">Student Name: </label></b>
								<input type ="text" class ="form-control" name ="nametxt" id ="sname">
							</div>
							<div class ="form-group">
							<b><label for ="sub">Select Subject:</label></b>
								<select class ="form-control" id ="sub" name ="subjecttxt">
									<option value ="java">Java</option>
									<option value ="c++">C++</option>
									<option value ="python">Python</option>
									<option value ="php">Php</option>
								</select>
							</div>
							<div class ="form-gorup" >
								<strong><label for ="lec">Lecture Title:</label></strong>
								<select class ="form-control" id ="lec" name ="lectxt">
									<option value ="oop">OOP</option>
									<option value ="jdbc">JDBC</option>
									<option value ="swing">Swing</option>
									<option value ="servlet">Servlet</option>
									<option value ="jsp">JSP</option>
									<option value ="spring">Spring</option>
								</select>
							</div>
					</div>
					<div style ="width:45%;margin-left:20px">
						<div class ="form-gorup">
							<strong><label for ="dt">Data:</label></strong>
							<input type ="date" class ="form-control" name ="dattxt" id ="dt">
						</div>
						<div class ="form-group" style ="margin-top:3%">
							<strong><label for ="st">Status:</label></strong>
							<select class ="form-control" id ="st" name ="statxt">
								<option value ="present">Present</option>
								<option value ="upsent">Upsent</option>
							</select>
						</div>
						<div style ="margin-top:10.4%">
							<button type ="submit" class ="btn btn-primary btn-block">Save</button>
						</div>
						</form>
						<button type ="submit" onclick ="resetFun()" class ="btn btn-danger btn-block" style ="margin-top:9%">Cancel</button>
					</div>
				</div>
			</div>

				
				<%
		
				
			}
			catch(ClassNotFoundException cnfe)
			{
				out.print("Sorry,Not Found Such Class");
			}
			catch(SQLException sqlexp)
			{
				out.print("SQL Exception Occurd");
			}
			
			
			
		%>			
		</div>
	</body>
</html>