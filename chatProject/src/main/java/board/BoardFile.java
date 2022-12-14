package board;

import java.io.Serializable;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BoardFile implements Serializable {
	private static final long serialVersionUID = 1449132512754742285L;
	private int id;
	private String bid;
	private String org_name;
	private String real_name;
	private String content_type;
	private long length;

	public BoardFile(int id, String bid, String org_name, String real_name, String content_type, long length) {
		super();
		this.id = id;
		this.bid = bid;
		this.org_name = org_name;
		this.real_name = real_name;
		this.content_type = content_type;
		this.length = length;

	}

	public BoardFile() {
	}

}
