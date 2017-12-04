package com.fyni.service;

import java.util.List;

import com.fyni.domain.EventDTO;

public interface EventService {
	public int eventCreate(EventDTO event) throws Exception;
	public int eventUpdate(EventDTO event) throws Exception;
	public EventDTO eventRead(int event_ID) throws Exception;
	public List<EventDTO> eventReadByCategory(String category_name, int page, int pagepernum) throws Exception;
	public List<EventDTO> eventReadAll(int page, int pagepernum) throws Exception;
	public List<EventDTO> eventUserOwn(String user_ID) throws Exception;
	public List<EventDTO> eventInCircle(String lon, String lat) throws Exception;
	public int eventDelete(int event_ID) throws Exception;
	public int eventUpDown(int event_Up, int event_Down) throws Exception;
	public int eventHit(int event_ID) throws Exception;
}
