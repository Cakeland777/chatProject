package chat;


public class Chatter
{
	private String name = null;
	private String sex = null;
	private String comment = null;
	private String email = null;
	private long loginTime = -1;
	private long enteredInRoomAt = -1;
	private int age = -1;
	private String id=null;


	public Chatter(String name, String id, long loginTime)
	{
		this.name = name;
		this.id=id;
		this.loginTime = loginTime;
	}	

	public String getName()
	{
		return name;
	}

	public String getId()
	{
		return id;
	}

	public String getSex()
	{
		return sex;
	}
	

	public void setComment(String comment)
	{
		this.comment = comment;
	}
	

	public String getComment()
	{
		return comment;
	}
	

	public void setAge(int age)
	{
		this.age=age;
	}

	public int getAge()
	{
		return age;
	}
	

	public void setEmail(String email)
	{
		this.email = email;
	}
	

	public String getEmail()
	{
		return email;
	}

	public long getLoginTime()
	{
		return loginTime;
	}



	public void setEnteredInRoomAt( long enteredAt)
	{
		this.enteredInRoomAt = enteredAt;
	}

	public long getEnteredInRoomAt()
	{
		return enteredInRoomAt;
	}
}