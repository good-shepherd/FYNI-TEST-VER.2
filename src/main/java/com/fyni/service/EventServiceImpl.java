package com.fyni.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fyni.domain.EventDTO;
import com.fyni.persistence.EventDAO;

@Service
public class EventServiceImpl implements EventService {

	@Inject
	private EventDAO dao;

	@Override
	public int eventCreate(EventDTO event) throws Exception {
		return dao.eventCreate(event);
	}

	
	@Override
	public EventDTO eventRead(int event_ID) throws Exception {
		return dao.eventRead(event_ID);
	}
	
	public List<EventDTO> eventReadBySearch(List<String> search_keyword) throws Exception {
		return dao.eventReadBySearch(search_keyword);
	}
	
	@Override
	public List<EventDTO> eventReadByCategory(String category_name, int page, int pagepernum) throws Exception {
		return dao.eventReadByCategory(category_name, page, pagepernum);
	}
	@Override
	public List<EventDTO> eventReadByCategoryLen(String category_name) throws Exception {
		return dao.eventReadByCategoryLen(category_name);
	}

	@Override
	public List<EventDTO> eventReadAllLen() throws Exception {
		return dao.eventReadAllLen();
	}
	@Override
	public List<EventDTO> eventReadAll(int page, int pagepernum) throws Exception {
		return dao.eventReadAll(page, pagepernum);
	}

	@Override
	public List<EventDTO> eventUserOwn(String user_ID) throws Exception {
		return dao.eventUserOwn(user_ID);
	}

	@Override
	public List<EventDTO> eventInCircle(String lon, String lat) throws Exception {
		return dao.eventInCircle(lon, lat);
	}

	@Override
	public int eventDelete(int event_ID) throws Exception {
		return dao.eventDelete(event_ID);
	}

	@Override
	public int eventUpDown(int event_Up, int event_Down) throws Exception {
		return dao.eventUpDown(event_Up, event_Down);
	}

	@Override
	public int eventHit(int event_ID) throws Exception {
		return dao.eventHit(event_ID);
	}


	@Override
	public int eventUpdate(EventDTO event) throws Exception {
		return dao.eventUpdate(event);
	}
	


}
