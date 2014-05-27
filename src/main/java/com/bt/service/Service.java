package com.bt.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.TimeZone;

import com.amazonaws.auth.ClasspathPropertiesFileCredentialsProvider;
import com.amazonaws.services.sns.AmazonSNSClient;

public class Service {

	final String DRAW_THE_SPEED = "speed";
	final String HOLLY_CHAINS = "chains";
	
	final String OTHER = "other";
	
	List<String> categories = Arrays.asList(new String[]{"suggest", "payment", "account", OTHER});
	
	Map<String, String> messages = new HashMap<>();
	
	static{

	}
	
	public Service(){}
	
	public Service(String game){
		try{
			ResourceBundle props = ResourceBundle.getBundle(game, Locale.TRADITIONAL_CHINESE);
			
			Iterator<String> keys = props.keySet().iterator();
			while(keys.hasNext()){
				String key = keys.next();
				String value = new String(props.getString(key).getBytes("ISO-8859-1"), "UTF-8");
				
				messages.put(key, value);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public String getMessage(String key){
		return messages.get(key);
	}
	
	public void saveFeedback(String category, String uid, String email, String feedback, String game){
		String cat = category;
		if(!categories.contains(category)){
			cat = OTHER;
		}
		
		Connection conn = null;
		
		try {
			Credential cred = getCredential(game);
			if(cred == null) {
				System.out.println("no data was inserted to DB for game " + game);
				return;
			}
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(cred.url, cred.uid, cred.pwd);
			
			Date date = Calendar.getInstance(TimeZone.getTimeZone("Asia/Shanghai")).getTime();
			String sql = "INSERT INTO USER_FEEDBACK(USER_ID,CATEGORY,EMAIL,TEXT,CREATE_DATE) "
					+ "VALUES(?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Integer.valueOf(uid));
			stmt.setString(2, cat);
			stmt.setString(3, email);
			stmt.setString(4, feedback);
			stmt.setDate(5, new java.sql.Date(date.getTime()));
			
			stmt.execute();
			
			// send notice mail
			
//			conn.commit();
		} catch (Exception e) {
			String msg = "failed to save user feedback, game = {0}, uid = {1}, email = {2}, feedback = {3}";
			System.out.println(MessageFormat.format(msg, new Object[]{game, uid, email, feedback}));
			e.printStackTrace();
		}finally{
			try {
				if(conn != null){
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	void sendMail(String title, String msg){
		AmazonSNSClient client = new AmazonSNSClient(new ClasspathPropertiesFileCredentialsProvider());
		client.publish("", msg);
//		PublishRequest
	}
	
	Credential getCredential(String game){
		Credential cred = new Credential();
		
		ResourceBundle props = ResourceBundle.getBundle("config." + game);
		cred.url = props.getString("url");
		cred.uid = props.getString("uid");
		cred.pwd = props.getString("pwd");
		
//		if(DRAW_THE_SPEED.equals(game)){
//			cred.url = "jdbc:mysql://speed.cqv9bfjneaic.ap-northeast-1.rds.amazonaws.com:3306/speed?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
//			cred.uid = "awsuser";
//			cred.pwd = "mypassword";
//		}else if(HOLLY_CHAINS.equals(game)){
////			cred.url = "jdbc:mysql://speed.cqv9bfjneaic.ap-northeast-1.rds.amazonaws.com:3306/holychains?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
////			cred.uid = "awsuser";
////			cred.pwd = "mypassword";
//
//		}else{
//			cred = null;
//		}
		
		return cred;
	}
	
	class Credential{
		String url;
		String uid;
		String pwd;
	}
}
