package edu.harvard.login;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.ServletContext;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HarvardLogin extends HttpServlet
{
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	PrintWriter pw = null;
	ServletContext cont = null;
	RequestDispatcher rd = null;
	
	String user = null;
	String password = null;
	String type = null;
	String query = null;
	
	public void init()
	{
		cont = getServletContext();
		String dbdriver = cont.getInitParameter("driver");
		String dburl = cont.getInitParameter("url");
		String dbuser = cont.getInitParameter("user");
		String dbpass = cont.getInitParameter("pass");
		try
		{
			Class.forName(dbdriver);
			con = DriverManager.getConnection(dburl,dbuser,dbpass);
		}
		catch(SQLException sqlexp)
		{
			pw.print("<h5>SQL Exception done</h5>");
		}
		catch(ClassNotFoundException cnfe)
		{
			pw.print("<h5>Class of connection have problem</h5>");
		}
	}
		
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html");
		pw = res.getWriter();
		
		if(con != null)
		{
			user = req.getParameter("usertxt");
			password = req.getParameter("passtxt");
			type = req.getParameter("typetxt");
			if(type.equals("manager"))
			{
				query = "select count(*) from logtb where username = '"+user+"' and pass = '"+password+"'";
				try
				{
					st = con.createStatement();
					rs = st.executeQuery(query);
					
					if(rs.next())
					{
						int result = rs.getInt(1);
						
						if(result == 1)
						{
							res.sendRedirect("administrator.html");
							
						}
						else
						{
							rd = req.getRequestDispatcher("/trd");
							rd.forward(req,res);
						
						}
					}
				}
				catch(SQLException sqlexpp)
				{
					pw.print("<h5>Sorry,Please chick your query</h5>");
				}
			}
			else if(type.equals("teacher"))
			{
				query = "select count(*) from teachertbl where username = '"+user+"' and pass = '"+password+"'";
				try
				{
					st = con.createStatement();
					rs = st.executeQuery(query);
					
					if(rs.next())
					{
						int result = rs.getInt(1);
						
						if(result == 1)
						{
							res.sendRedirect("addmin.html");
							
						}
						else
						{
							rd = req.getRequestDispatcher("/trd");
							rd.forward(req,res);
						
						}
					}
				}
				catch(SQLException sqlexpp)
				{
					pw.print("<h5>Sorry,Please chick your query</h5>");
				}
				
			}
			else if(type.equals("student"))
			{
				
			}
			
			
		}
		else
		{
			pw.print("<h4>Sorry,No Connection Done</h4>");
		}
		
	}
	public void doGet(HttpServletRequest reqq,HttpServletResponse ress)throws ServletException,IOException
	{
		doPost(reqq,ress);
	}
}