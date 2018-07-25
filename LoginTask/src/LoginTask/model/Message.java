package LoginTask.model;

public class Message {

	private int message_id;
	private String id;
	private String password;
	private String message;
	
	public Message() {
		
	}
	
	public Message(String id, String password, String message) {
		super();
		this.id = id;
		this.password = password;
		this.message = message;
	}
	

	public int getMessage_id() {
		return message_id;
	}

	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public boolean hasId() {
		return id != null && !id.isEmpty();
	}

	
}
