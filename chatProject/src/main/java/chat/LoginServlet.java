package chat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import chat.ChatRoom;
import chat.ChatRoomList;
import chat.Chatter;

import java.io.IOException;

import chat.*;


@WebServlet("/login")
public class LoginServlet extends HttpServlet
{
	private String contextPath = "";

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/login.jsp");		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		contextPath = request.getContextPath();		
		String nickname = request.getParameter("nickname");
		String id = request.getParameter("id");
		nickname = nickname.trim().toLowerCase();

	
		if ((nickname != null && nickname.length() > 1 && nickname.indexOf(" ") == -1)  )
		{
			try
			{
				ChatRoomList roomlist = (ChatRoomList)getServletContext().getAttribute("chatroomlist");
				boolean chatterexists = roomlist.chatterExists(nickname);
				if (chatterexists)
				{
					response.sendRedirect(contextPath + "/login.jsp?d=t&n="+nickname);
				}
				else
				{
					HttpSession session = request.getSession(true);
					int timeout = 1800; // 30 minutes
					String t = getServletContext().getInitParameter("sessionTimeout"); // gets Minutes
					if (t != null)
					{
						try
						{
							timeout = Integer.parseInt(t);
							timeout = timeout * 60;
						}
						catch (NumberFormatException nfe)
						{							
						}
					}
					session.setMaxInactiveInterval(timeout);
					session.setAttribute("nickname", nickname);
					session.setAttribute("id", id);

					ChatRoom chatRoom = roomlist.getRoom("StartUp"); 
					nickname = nickname.toLowerCase();
					Chatter chatter = null;
			
					chatter = new Chatter(nickname, id,new java.util.Date().getTime());
					chatRoom.addChatter(chatter);
					response.sendRedirect(contextPath + "/listrooms.jsp");

				}
			}
			catch(Exception exception)
			{
				System.out.println("Exception thrown in LoginServlet: " + exception.getMessage());
				exception.printStackTrace();
				response.sendRedirect(contextPath + "/error.jsp");
			}
		}
		else
		{
			response.sendRedirect(contextPath + "/login.jsp?ic=t");
		}
	}
}