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
			<ul class ="nav nav-tabs bg-warning nav-justified">
				<li class ="flex-grow-1">
					<img src ="images/log.png" width ="300" height ="40"></img>
				</li>
				<li class ="nav-item">
					<a href ="addmin.html" class ="nav-link">Home</a>
				</li>
				<li class ="nav-item dropdown">
					<a href ="#" class ="nav-link dropdown-toggle" data-toggle ="dropdown">Administration</a>
					<div class ="dropdown-menu">
						<a href ="#" class ="dropdown-item">Add Attendance</a>
						<a href ="teacherAddSubject.html" class ="dropdown-item">Add Subject</a>
						<a href ="teacherAddMarksheet.html" class ="dropdown-item">Add Marksheet</a>
					</div>
				</li>
				<li class ="nav-item dropdown">
					<a href ="#" class ="nav-link dropdown-toggle" data-toggle ="dropdown">Details</a>
					<div class ="dropdown-menu">
						<a href ="" class ="dropdown-item">Attendance Details</a>
						<a href ="" class ="dropdown-item">Subject Details</a>
						<a href ="" class ="dropdown-item">Result Details</a>
						<a href ="" class ="dropdown-item">Student Details</a>
					</div>
				</li>
				<li class ="nav-item dropdown">
					<a href ="#" class ="nav-link dropdown-toggle" data-toggle ="dropdown">My Account</a>
					<div class ="dropdown-menu">
						<a href ="" class ="dropdown-item">My Profile</a>
						<a href ="" class ="dropdown-item">Change Password</a>
					</div>
				</li>
				<li class ="nav-item">
					<a href ="../index.html" class ="nav-link">Log Out</a>
				</li>					
			</ul>
			
			
			<div style ="width:100%;height:8%;background-color:black">
				<h4 class ="text-light" style ="padding-left:6.5%;padding-top:0.5%">Add Attendance :</h4>
			</div>
			
			<div class ="container">
				<div class ="row" style ="margin-top:6%;margin-left:5%">
					<div style ="width:45%;margin-lef:20px;">
						<form action ="tchAttendance" method ="POST" id ="myForm">
							<div class ="form-group">
								<div class ="form-group">
									<b><label for ="ss">Select Student:</label></b>
									<input type ="text" class ="form-control" name ="stdtxt" id ="ss" />
								</div>
							</div>
							<div class ="form-gorup">
								<strong><label for ="dt">Data:</label></strong>
								<input type ="date" class ="form-control" name ="dattxt" id ="dt">
							</div>
							<div class ="form-group">
								<strong><label for ="st">Status:</label></strong>
								<select class ="form-control" id ="st" name ="statxt">
									<option value ="present">Present</option>
									<option value ="upsent">Upsent</option>
								</select>
							</div>
					</div>
					<div style ="width:45%;margin-left:20px">
						<b><label for ="sub">Select Subject:</label></b>
							<select class ="form-control" id ="sub" name ="SStxt">
								<option value ="Subject 1">Subject 1</option>
								<option value ="Subject 2">Subject 2</option>
								<option value ="Subject 3">Subject 3</option>
							</select>
						<div class ="form-gorup" >
							<strong><label for ="lec">Lecture Title:</label></strong>
							<select class ="form-control" id ="lec" name ="lectxt">
								<option value ="Lecture 1">Lecture 1</option>
								<option value ="Lecture 2">Lecture 2</option>
								<option value ="Lecture 3">Lecture 3</option>
							</select>
						</div>
						<div style ="margin-top:6.5%">
							<button type ="submit" class ="btn btn-primary btn-block">Save</button>
						</div>
						</form>
						<button type ="submit" onclick ="resetFun()" class ="btn btn-danger btn-block" style ="margin-top:2%">Cancel</button>
					</div>
				</div>
			</div>
			
		<%
			Connection con = null;
			PreparedStatement ps = null;
			
			String subject = request.getParameter("SStxt");
			String dat = request.getParameter("dattxt");
			String status = request.getParameter("statxt");
			String student = request.getParameter("stdtxt");
			String lecture = request.getParameter("lectxt");
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
				if(con != null)
				{
					String query ="insert into tchAttendancetbl values(?,?,?,?,?)";
					
					ps = con.prepareStatement(query);
					ps.setString(1,student);
					ps.setString(2,dat);
					ps.setString(3,status);
					ps.setString(4,subject);
					ps.setString(5,lecture);
					
					int result = ps.executeUpdate();
					if(result == 0)
					{
						out.print("Sorry,Not Inserted");
					}
					else
					{
						
						out.print("<b><center>Successfully,Data Inserted</center></b>");
					}
				}
				else
				{
					out.print("Sorry,No Connection Done");
				}
			}
			catch(ClassNotFoundException cnfe)
			{
				
			}
			catch(SQLException sqlexp)
			{
				
			}
			
			
			%>
		</div>
	</body>
</html>