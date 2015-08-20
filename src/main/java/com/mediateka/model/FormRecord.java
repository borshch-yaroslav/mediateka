package com.mediateka.model;

import java.sql.Timestamp;

import com.mediateka.annotation.Column;
import com.mediateka.model.enums.FormRecordGoal;
import com.mediateka.model.enums.State;

public class FormRecord {

	@Column(name = "id")
	private Integer id;

	@Column(name = "date_from")
	private Timestamp dateFrom;

	@Column(name = "date_till")
	private Timestamp dateTill;

	@Column(name = "book_id")
	private Integer bookId;

	@Column(name = "goal")
	private FormRecordGoal goal;

	@Column(name = "event_id")
	private Integer eventId;

	@Column(name = "comment")
	private String comment;

	@Column(name = "user_id")
	private Integer userId;

	@Column(name = "admin_id")
	private Integer adminId;

	@Column(name = "state")
	private State state;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(Timestamp dateFrom) {
		this.dateFrom = dateFrom;
	}

	public Timestamp getDateTill() {
		return dateTill;
	}

	public void setDateTill(Timestamp dateTill) {
		this.dateTill = dateTill;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public FormRecordGoal getGoal() {
		return goal;
	}

	public void setGoal(FormRecordGoal goal) {
		this.goal = goal;
	}

	public Integer getEventId() {
		return eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getAdminId() {
		return adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "FormRecord [id=" + id + ", dateFrom=" + dateFrom
				+ ", dateTill=" + dateTill + ", bookId=" + bookId + ", goal="
				+ goal + ", eventId=" + eventId + ", comment=" + comment
				+ ", userId=" + userId + ", adminId=" + adminId + ", state="
				+ state + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FormRecord other = (FormRecord) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}