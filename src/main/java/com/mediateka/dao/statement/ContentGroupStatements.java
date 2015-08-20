package com.mediateka.dao.statement;

public class ContentGroupStatements {
	// insert
	public static final String INSERT_CONTENT_GROUP = "INSERT INTO content_group "
			+ "(type, name, creator_id, creation_date, text, "
			+ "event_id, club_id, state, content_group.like, dislike, "
			+ "parent_id) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
	public static final String[] INSERT_CONTENT_GROUP_ORDER = { "type", "name",
			"creator_id", "creation_date", "text", "event_id", "club_id",
			"state", "like", "dislike",  "parent_id" };

	
	public static final String CALL_INSERT_CONTENT_GROUP = "CALL insertContentGroup (?,?,?,?,?,?,?,?,?,?,?)";
	
	public static final String[] CALL_INSERT_CONTENT_GROUP_ORDER = { "type", "name",
		"creator_id", "creation_date", "text", "event_id", "club_id",
		"state", "like", "dislike", "parent_id" };
	
	// select
	public static final String SELECT_CONTENT_GROUP_BY_ID = "SELECT * FROM content_group WHERE id=?";
	public static final String[] SELECT_CONTENT_GROUP_BY_ID_ORDER = { "id" };

	public static final String SELECT_CONTENT_GROUP_BY_TYPE = "SELECT * FROM content_group WHERE type=?";
	public static final String[] SELECT_CONTENT_GROUP_BY_TYPE_ORDER = { "type" };

	public static final String SELECT_CONTENT_GROUP_BY_STATE = "SELECT * FROM content_group WHERE state=?";
	public static final String[] SELECT_CONTENT_GROUP_BY_STATE_ORDER = { "state" };

	public static final String SELECT_CONTENT_GROUP_BY_EVENT_ID = "SELECT * FROM content_group WHERE event_id=?";
	public static final String[] SELECT_CONTENT_GROUP_BY_EVENT_ID_ORDER = { "event_id" };

	public static final String SELECT_CONTENT_GROUP_BY_CLUB_ID = "SELECT * FROM content_group WHERE club_id=?";
	public static final String[] SELECT_CONTENT_GROUP_BY_CLUB_ID_ORDER = { "club_id" };

	public static final String SELECT_CONTENT_GROUP_BY_PARENT_ID = "SELECT * FROM content_group WHERE parent_id=? AND state='ACTIVE'";
	public static final String[] SELECT_CONTENT_GROUP_BY_PARENT_ID_ORDER = { "parent_id" };

	public static final String SELECT_CONTENT_GROUP_BY_CREATOR_ID = "SELECT * FROM content_group WHERE creator_id=?";
	public static final String[] SELECT_CONTENT_GROUP_BY_CREATOR_ID_ORDER = { "creator_id" };

	public static final String SELECT_CONTENT_GROUP_BY_NAME_REGEX = "SELECT * FROM content_group WHERE name REGEXP ?";
	public static final String[] SELECT_CONTENT_GROUP_BY_NAME_REGEX_ORDER = { "name" };

	public static final String SELECT_CONTENT_GROUP_ALL = "SELECT * FROM content_group";

	public static final String SELECT_CONTENT_GROUP_BY_EVENT_ID_AND_STATE = "SELECT * FROM content_group WHERE event_id=? "
			+ " AND state = ?";
	public static final String[] SELECT_CONTENT_GROUP_BY_EVENT_ID_AND_STATE_ORDER = { "event_id", "state" };

	public static final String SELECT_CONTENT_GROUP_BY_CLUB_ID_AND_STATE = "SELECT * FROM content_group WHERE club_id=? "
			+ " AND state = ?";
	public static final String[] SELECT_CONTENT_GROUP_BY_CLUB_ID_AND_STATE_ORDER = { "club_id" , "state" };
	
	public static final String SELECT_CONTENT_GROUP_BY_CLUB_ID_AND_STATE_AND_TYPE = 
			"SELECT * FROM content_group WHERE club_id=? AND state = ? AND type = ?";
	
	public static final String[] SELECT_CONTENT_GROUP_BY_CLUB_ID_AND_STATE_AND_TYPE_ORDER = 
		{ "club_id" , "state", "type" };
	
	public static final String SELECT_CONTENT_GROUP_BY_EVENT_ID_AND_STATE_AND_TYPE = 
			"SELECT * FROM content_group WHERE event_id=? AND state = ? AND type = ?";
	
	public static final String[] SELECT_CONTENT_GROUP_BY_EVENT_ID_AND_STATE_AND_TYPE_ORDER = 
		{ "event_id" , "state", "type" };
	
	
	// update
	public static final String UPDATE_CONTENT_GROUP = "UPDATE content_group SET "
			+"type=?, name=?, creator_id=?, creation_date=?, text=?,"
			+ " event_id=?, club_id=?, state=?, content_group.like=?,"
			+ " dislike=?, parent_id=?" + " WHERE id=?";
	public static final String[] UPDATE_CONTENT_GROUP_ORDER = { "type", "name",
			"creator_id", "creation_date", "text", "event_id", "club_id",
			"state", "like", "dislike", "parent_id", "id" };
	
	
}