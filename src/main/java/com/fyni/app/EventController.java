package com.fyni.app;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fyni.domain.CommentDTO;
import com.fyni.domain.EventDTO;
import com.fyni.service.CommentService;
import com.fyni.service.EventServiceImpl;

@Controller
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);

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
			String event_WhenEnds, int category_ID, String event_Address, String event_LocationX, String event_LocationY, MultipartFile event_Picture,
			HttpSession session) throws Exception {
		String title = new String(event_Title.getBytes("8859_1"),"utf-8");
		String content = new String(event_Content.getBytes("8859_1"),"utf-8");
		String address = new String(event_Address.getBytes("8859_1"),"utf-8");
		String userid = session.getAttribute("user_ID").toString();
		String begins = htmlToMysqlDate(event_WhenBegins);
		String ends = htmlToMysqlDate(event_WhenEnds);
		EventDTO dto = new EventDTO();
		dto.setEvent_Title(title);
		dto.setEvent_Content(content);
		dto.setEvent_WhenBegins(begins);
		dto.setEvent_WhenEnds(ends);
		dto.setCategory_ID(category_ID);
		dto.setEvent_Address(address);
		dto.setEvent_LocationX(event_LocationX);
		dto.setEvent_LocationY(event_LocationY);
		dto.setUser_ID(userid);
		String filepath = uploadFile(event_Picture.getOriginalFilename(), event_Picture.getBytes());
		dto.setEvent_Picture(filepath);
		service.eventCreate(dto);
		ModelAndView mav = new ModelAndView("ajaxpage/eventbody");
		mav.addObject("event", dto);
		System.out.println(dto);
		System.out.println(mav);
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
		if (result > 0)
			return "success";
		else
			return "failed";
	}

	@RequestMapping(value = "eventUpdate.do", method = RequestMethod.POST)
	public ModelAndView eventUpdate(String event_ID) throws Exception {
		ModelAndView mav = new ModelAndView("ajaxpage/eventupdatebody");
		int eventid = Integer.parseInt(event_ID.trim());
		EventDTO event = service.eventRead(eventid);
		String begins = mysqlToHtmldate(event.getEvent_WhenBegins());
		String ends = mysqlToHtmldate(event.getEvent_WhenEnds());
		event.setEvent_WhenBegins(begins);
		event.setEvent_WhenEnds(ends);
		mav.addObject("event", event);
		return mav;
	}

	@RequestMapping(value = "eventUpdate.go", method = RequestMethod.POST)
	public ModelAndView eventUpdateGo(String event_ID, String event_Title, String event_Content,
			String event_WhenBegins, String event_WhenEnds, String category_ID, String event_Address, String event_LocX,
			String event_LocY, HttpSession session) throws Exception {
		Object userid = session.getAttribute("user_ID");
		String begins = htmlToMysqlDate(event_WhenBegins);
		String ends = htmlToMysqlDate(event_WhenEnds);
		EventDTO dto = new EventDTO();
		dto.setEvent_Title(event_Title);
		dto.setEvent_Content(event_Content);
		dto.setEvent_WhenBegins(begins);
		dto.setEvent_WhenEnds(ends);
		dto.setCategory_ID(Integer.parseInt(category_ID));
		dto.setEvent_Address(event_Address);
		dto.setEvent_LocationX(event_LocX);
		dto.setEvent_LocationY(event_LocY);
		dto.setUser_ID(userid.toString());
		dto.setEvent_ID(Integer.parseInt(event_ID));
		service.eventUpdate(dto);
		ModelAndView mav = new ModelAndView("ajaxpage/eventbody");
		mav.addObject("event", dto);
		return mav;
	}

	@RequestMapping(value = "eventRead.do", method = RequestMethod.POST)
	public ModelAndView eventReadOne(String event_ID) throws Exception {
		ModelAndView mav = new ModelAndView("ajaxpage/eventbody");
		int eventid = Integer.parseInt(event_ID.trim());
		EventDTO event = service.eventRead(eventid);
		List<CommentDTO> list = cservice.commentEventOwn(eventid);
		System.out.println(list);
		System.out.println(event.toString());
		mav.addObject("event", event);
		mav.addObject("list", list);
		mav.addObject("listlen", list.size());
		return mav;
	}

	@RequestMapping("write-comment")
	public String write_comment(@RequestParam("event_ID") String event_ID,
			@RequestParam("comment_Content") String comment_Content, Model model, HttpSession session) {
		String user_ID = (String) session.getAttribute("user_ID");
		CommentDTO dto = new CommentDTO();
		dto.setComment_Content(comment_Content);
		int eventid = Integer.parseInt(event_ID);
		dto.setEvent_ID(eventid);
		dto.setUser_ID(user_ID);
		int count = 0;
		count = cservice.commentCreate(dto);
		List<CommentDTO> list = cservice.commentEventOwn(eventid);
		System.out.println("list : " + list);
		System.out.println("listlen : " + list.size());
		model.addAttribute("clist", list);
		model.addAttribute("clistlen", list.size());
		if (count < 1) {
			return "home";
		} else {
			return "ajaxpage/commentbody";
		}

	}

	@Resource(name = "uploadPath")
	private String uploadPath;

	private String uploadFile(String originalName, byte[] fileData) throws IOException {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		System.out.println(uploadPath);
		System.out.println(fileData);
		File target = new File(uploadPath, savedName);
		System.out.println(target);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	// 2017-01-01T01:00 -> YYYY-MM-DD HH:MM:SS
	private String htmlToMysqlDate(String htmldate) {
		StringBuffer sb = new StringBuffer();
		sb.append(htmldate.substring(0, 10)).append(" ").append(htmldate.substring(11)).append(":00");
		return sb.toString();
	}

	// YYYY-MM-DD HH:MM:SS -> 2017-01-01T01:00
	private String mysqlToHtmldate(String mysqldate) {
		StringBuffer sb = new StringBuffer();
		sb.append(mysqldate.substring(0, 10)).append("T").append(mysqldate.substring(11, 16));
		return sb.toString();
	}
	
	@RequestMapping("cngcomment")
	public String cngcomment(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("user_ID");
		List<CommentDTO> clist = cservice.commentUserOwn(userid);
		model.addAttribute("clist", clist);
		model.addAttribute("clistlen", clist.size());
		return "ajaxpage/userinfocomment";
	}
}
