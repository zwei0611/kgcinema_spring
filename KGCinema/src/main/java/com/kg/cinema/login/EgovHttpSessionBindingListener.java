package com.kg.cinema.login;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class EgovHttpSessionBindingListener implements HttpSessionBindingListener {
	

	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		if(EgovMultiLoginPreventor.findByLoginId(event.getName())) {
			EgovMultiLoginPreventor.invalidateByLoginId(event.getName());
		}
		EgovMultiLoginPreventor.loginUsers.put(event.getName(), event.getSession());
	}
	
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		EgovMultiLoginPreventor.loginUsers.remove(event.getName(), event.getSession());
	}
	
	public int getUserCount() {
		return EgovMultiLoginPreventor.loginUsers.size();
	}
	
	public String getUsermap() {
		return EgovMultiLoginPreventor.loginUsers.toString();
	}
}

