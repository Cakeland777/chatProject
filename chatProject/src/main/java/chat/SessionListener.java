package chat;

import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;
import chat.ChatRoom;
import chat.ChatRoomList;
import chat.Chatter;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletContext;


public class SessionListener implements HttpSessionAttributeListener 
{
	public void attributeAdded(HttpSessionBindingEvent hsbe)
	{
		//System.out.println("Attribute has been bound");
	}

	public void attributeReplaced(HttpSessionBindingEvent hsbe)
	{
		//System.out.println("Attribute has been replaced");
	}


	public void attributeRemoved(HttpSessionBindingEvent hsbe)
	{
		String name = hsbe.getName();
		HttpSession session = hsbe.getSession();
		if ("nickname".equalsIgnoreCase(name))
		{
			String nickname = (String)hsbe.getValue();
			if (nickname != null)
			{
				ServletContext application = session.getServletContext();
				if (application != null)
				{
					Object o = application.getAttribute("chatroomlist");		
					if (o != null)
					{
						ChatRoomList roomList = (ChatRoomList)o;
						ChatRoom room = roomList.getRoomOfChatter(nickname);
						if (room != null)
						{
							Object chatter = room.removeChatter(nickname);
							if (chatter != null)
							{
								String n = ((Chatter)chatter).getName();
							}
							
						}
					}
				}
				else
				{
					System.out.println("ServletContext is null");
				}					
			}
		}		
	}
}