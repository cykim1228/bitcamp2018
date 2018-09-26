package dao;

import dao.MessageDao;

public class MessageDaoProvider {
	
	private static MessageDaoProvider instance = new MessageDaoProvider();
	public static MessageDaoProvider getInstance() {
		return instance;
	}
	
	private MessageDaoProvider() {}
	
	private MessageDao messageDao = new MessageDao();
	private String dbms;
	
	void setDbms(String dmbs) {
		this.dbms = dbms;
	}
	
	public MessageDao getMessageDao() {
		if ("message".equals(dbms)) {
			return messageDao;
		}
		return null;
		
	}

	public static MessageDaoProvider getInstnace() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
