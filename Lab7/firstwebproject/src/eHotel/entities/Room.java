package eHotel.entities;

public class Room {
	
	private String room_no;
	private String room_status;
	private String customer_ssn;
	
	public Room() {
		
	}
	
	public Room(String room_no, String room_status) {
		this.room_no = room_no;
		this.room_status = room_status;
	}

	public String getRoom_no() {
		return room_no;
	}

	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}

	public String getRoom_status() {
		return room_status;
	}

	public void setRoom_status(String room_status) {
		this.room_status = room_status;
	}

	public String getCustomer_ssn() {
		return customer_ssn;
	}

	public void setCustomer_ssn(String customer_ssn) {
		this.customer_ssn = customer_ssn;
	}
	

}
