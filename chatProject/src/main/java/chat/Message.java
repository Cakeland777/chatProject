package chat;


public class Message
{

	private String chatterName = null;

	private String message = null;


	private long timeStamp;
	
	public Message(String name, String message, long timeStamp)
	{
		this.chatterName = name;
		this.message= message;
		this.timeStamp = timeStamp;
	}
	
	
	public String getChatterName()
	{
		return chatterName;
	}
	

	public String getMessage()
	{
		return message;
	}

	public long getTimeStamp()
	{
		return timeStamp;
	}
}