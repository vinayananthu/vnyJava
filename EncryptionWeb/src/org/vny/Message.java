package org.vny;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "message_info")
public class Message {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int msg_id;
	private String message;
	private String fromUname;
	private String toUname;

	public int getMsg_id() {
		return msg_id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
	}

	public String getFromUname() {
		return fromUname;
	}

	public void setFromUname(String fromUname) {
		this.fromUname = fromUname;
	}

	public String getToUname() {
		return toUname;
	}

	public void setToUname(String toUname) {
		this.toUname = toUname;
	}

}
