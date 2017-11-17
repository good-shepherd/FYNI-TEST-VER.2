package com.fyni.persistence;

import java.util.List;

import com.fyni.domain.CommentReportDTO;
import com.fyni.domain.EventReportDTO;

public interface ReportDAO {
	public int eventReportCreate(EventReportDTO dto);

	public int commentReportCreate(CommentReportDTO dto);

	public List<EventReportDTO> eventReportReadByEvent(int event_ID);

	public List<EventReportDTO> eventReportReadByUser(int user_ID);

	public List<CommentReportDTO> commentReportByEvent(int event_ID);

	public List<CommentReportDTO> commentReportComment(int comment_ID);
}
