package board;

import java.io.Serializable;

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
	private int count;
	private String parent_no;

	public Board(String id, String userid, String title, String content, String type, String time, String name,
			int count, String parent_no) {
		super();
		this.id = id;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.type = type;
		this.time = time;
		this.name = name;
		this.count = count;
		this.parent_no = parent_no;
	}

	public Board(JSONObject jsonObject) {
		id = jsonObject.getString("id");
		title = jsonObject.getString("title");
		content = jsonObject.getString("content");
		userid = jsonObject.getString("userid");
		type = jsonObject.getString("type");
		time = jsonObject.getString("time");
		name = jsonObject.getString("name");
		count = jsonObject.getInt("count");
		parent_no = jsonObject.getString("parent_no");
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
		jsonBoard.put("count", count);
		jsonBoard.put("parent_no", parent_no);
		return jsonBoard;
	}
}
