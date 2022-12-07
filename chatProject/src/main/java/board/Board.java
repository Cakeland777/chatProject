package board;
import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.Objects;

import org.json.JSONObject;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Board implements Serializable {
	private static final long serialVersionUID = 1449132512754742285L;
	private String id;
	private String userid;
	private String title;
	private String content;
	private String time;
	private String type;
	private String name;
	
	public Board(String id, String userid, String title, String content, String type, String time, String name) {
		super();
		this.id = id;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.type = type;
		this.time = time;
		this.name=name;
	}
	
	public Board(JSONObject jsonObject) {
		id = jsonObject.getString("id");
		title= jsonObject.getString("title");
		content= jsonObject.getString("content");
		userid = jsonObject.getString("userid");
		type = jsonObject.getString("type");
		time= jsonObject.getString("time");
		name= jsonObject.getString("name");
	}
	
	public Board() {
    }
	 public JSONObject getJsonObject() {
	        JSONObject jsonBoard = new JSONObject();
	        jsonBoard.put("id", id);
	        jsonBoard.put("userid", userid);
	        jsonBoard.put("title", title);
	        jsonBoard.put("content", content);
	        jsonBoard.put("type", type);
	        jsonBoard.put("time", time);
	        jsonBoard.put("name", name);
	        return jsonBoard;
	    }
}
