package chat;


import java.util.Map;
import java.util.LinkedList;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Iterator;
import java.util.HashMap;
import java.util.Set;

import chat.Message;
import chat.Chatter;


public class ChatRoom
{
	
	private String name = null;

	private String description = null;
	

	private Map chatters = new HashMap();

	private List messages = new LinkedList();
	
	/*
	* Used to set the maximum no of messages
	*/
	private int messages_size = 25;
	
	public ChatRoom(String name, String descr)
	{
		this.name= name;
		this.description = descr;
	}
	
	
	public String getName()
	{
		return name;
	}
	

	public String getDescription()
	{
		return description;
	}
	

	public synchronized void addChatter(Chatter chatter)
	{
		chatters.put(chatter.getName(), chatter);
	}
	
	public synchronized Object removeChatter(String chatterName)
	{
		return chatters.remove(chatterName);
	}
	
	
	public Chatter getChatter(String chatterName)
	{
		return (Chatter)chatters.get(chatterName);
	}
	

	public boolean chatterExists(String chatterName)
	{
		return chatters.containsKey(chatterName);
	}
	
	
	public int getNoOfChatters()
	{
		return chatters.size();
	}
	

	public Set getChatters()
	{
		return chatters.entrySet();
	}
	

	public Chatter[] getChattersArray()
	{
		Chatter[] chattersArray = new Chatter[chatters.size()];
		Set chatters = getChatters();
		Iterator chattersit = chatters.iterator();
		int i = 0;
		while(chattersit.hasNext())
		{
			Map.Entry me = (Map.Entry)chattersit.next();
			String key = (String) me.getKey();
			chattersArray[i] = (Chatter)me.getValue();
			i++;
		}
		return chattersArray;
	}
	

	public synchronized void addMessage(Message msg)
	{
		if(messages.size()==messages_size)
		{
			((LinkedList)messages).removeFirst();
		}
		messages.add(msg);
	}
	

	public ListIterator getMessages()
	{
		return messages.listIterator();
	}


	public Message[] getMessages(long afterTimeStamp)
	{
		ListIterator li = messages.listIterator();
		List temp = new ArrayList();
		Message m;
		while (li.hasNext())
		{
			m = (Message)li.next();
			if (m.getTimeStamp() >= afterTimeStamp)
			{
				temp.add(m);
			}
		}
		Object o[] = temp.toArray();
		Message[] arr = new Message[o.length];
		for (int i = 0; i < arr.length; i++)
		{
			arr[i] = (Message)o[i];
		}
		return arr;
	}

	public int getNoOfMessages()
	{
		return messages.size();
	}
	
	
	public void setMaximumNoOfMessages(int size)
	{
		messages_size = size;
	}
	
	public int getMaxiumNoOfMessages()
	{
		return messages_size;
	}
}