package com.fyni.persistence;

import java.util.List;

import com.fyni.domain.EventDTO;

public interface EventDAO {
	public int eventCreate(EventDTO event);
	public int eventUpdate(EventDTO event);
	public EventDTO eventRead(int event_ID);
	public List<EventDTO> eventReadByCategory(String category_name);
	public List<EventDTO> eventReadAll();
	public List<EventDTO> eventUserOwn(String user_ID);
	public List<EventDTO> eventInCircle(String lon, String lat);
	public int eventDelete(int event_ID);
	public int eventUpDown(int event_Up, int event_Down);
	public int eventHit(int event_ID);
}
