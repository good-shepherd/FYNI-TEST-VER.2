package com.fyni.app;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fyni.domain.CommentDTO;
import com.fyni.domain.EventDTO;
import com.fyni.service.CommentService;
import com.fyni.service.EventServiceImpl;

@Controller
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private EventServiceImpl service;

	@Autowired
	CommentService cservice;
	
	/*
	 * @RequestMapping(value = "listAll.do", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public List<EventDTO> searchAll() throws Exception {
	 * List<EventDTO> list = service.eventReadAll(); System.out.println(list);
	 * return list; }
	 */


	

	// event view after creating
	@RequestMapping(value = "eventCreate.do", method = RequestMethod.POST)
	public ModelAndView eventCreate(String event_Title, String event_Content, String event_WhenBegins,
			String event_WhenEnds, int category_ID, String event_Address, String event_LocX, String event_LocY,
			HttpSession session) throws Exception {
		Object userid = session.getAttribute("user_ID");
		// 2017-01-01T01:00 -> YYYY-MM-DD HH:MM:SS
		StringBuffer sb = new StringBuffer();
		sb.append(event_WhenBegins.substring(0, 10)).append(" ").append(event_WhenBegins.substring(11)).append(":00");
		String begins = sb.toString();
		sb = new StringBuffer();
		sb.append(event_WhenEnds.substring(0, 10)).append(" ").append(event_WhenEnds.substring(11)).append(":00");
		String ends = sb.toString();
		EventDTO dto = new EventDTO();
		dto.setEvent_Title(event_Title);
		dto.setEvent_Content(event_Content);
		dto.setEvent_WhenBegins(begins);
		dto.setEvent_WhenEnds(ends);
		dto.setCategory_ID(category_ID);
		dto.setEvent_Address(event_Address);
		dto.setEvent_LocationX(event_LocX);
		dto.setEvent_LocationY(event_LocY);
		dto.setUser_ID(userid.toString());
		service.eventCreate(dto);
		ModelAndView mav = new ModelAndView("ajaxpage/eventbody");
		mav.addObject("event", dto);
		return mav;

	}

	@RequestMapping(value = "writeanevent", method = RequestMethod.GET)
	public String writeAnEvent(HttpSession session) {
		Object userid = session.getAttribute("user_ID");
		if (userid == null) {
			return "login";
		}
		return "writeanevent";
	}
	
	@RequestMapping(value = "eventDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String eventDelete(String event_ID) throws NumberFormatException, Exception {
		int result = service.eventDelete(Integer.parseInt(event_ID));
		System.out.println(result);
		if (result > 0) return "success"; else return "failed";
	}

	@RequestMapping(value = "eventRead.do", method = RequestMethod.POST)
	public ModelAndView eventReadOne(String event_ID) throws Exception {
		ModelAndView mav = new ModelAndView("ajaxpage/eventbody");
		int eventid = Integer.parseInt(event_ID.trim());
		EventDTO event = service.eventRead(eventid);
		List<CommentDTO> list = cservice.commentEventOwn(eventid);
		System.out.println(event.toString());
		mav.addObject("event", event);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("write-comment")
	public String write_comment(@RequestParam("event_ID") String event_ID, 
			@RequestParam("comment_Content") String comment_Content, Model model, HttpSession session) {
		String user_ID = (String)session.getAttribute("user_ID");
		CommentDTO dto = new CommentDTO();
		dto.setComment_Content(comment_Content);
		int eventid = Integer.parseInt(event_ID);
		dto.setEvent_ID(eventid);
		dto.setUser_ID(user_ID);
		int count = 0;
		count = cservice.commentCreate(dto);
		List<CommentDTO> list = cservice.commentEventOwn(eventid);
		model.addAttribute("list", list);
		if(count < 1) {
			return "home";
		}else {
			return "commentbody";
		}
		
	}

}
