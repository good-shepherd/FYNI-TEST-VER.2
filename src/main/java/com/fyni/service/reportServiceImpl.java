package com.fyni.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fyni.domain.CommentReportDTO;
import com.fyni.domain.EventReportDTO;
import com.fyni.persistence.ReportDAO;
@Service
public class reportServiceImpl implements reportService {
	
	@Inject
	ReportDAO dao;
	@Override
	public int eventReportCreate(EventReportDTO dto) {
		return dao.eventReportCreate(dto);
	}

	@Override
	public int commentReportCreate(CommentReportDTO dto) {
		return dao.commentReportCreate(dto);
	}

	@Override
	public List<EventReportDTO> eventReportReadByEvent(int event_ID) {
		return dao.eventReportReadByEvent(event_ID);
	}

	@Override
	public List<EventReportDTO> eventReportReadByUser(int user_ID) {
		return dao.eventReportReadByUser(user_ID);
	}

	@Override
	public List<CommentReportDTO> commentReportByEvent(int event_ID) {
		return dao.commentReportByEvent(event_ID);
	}

	@Override
	public List<CommentReportDTO> commentReportComment(int comment_ID) {
		return dao.commentReportComment(comment_ID);
	}

}
