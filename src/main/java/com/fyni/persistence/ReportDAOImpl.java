package com.fyni.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fyni.domain.CommentReportDTO;
import com.fyni.domain.EventReportDTO;

@Repository
public class ReportDAOImpl implements ReportDAO {
	
	@Inject
	SqlSession session;
	private static final String namespace = "com.fyni.mapper.reportMapper";
	
	@Override
	public int eventReportCreate(EventReportDTO dto) {
		return session.insert(namespace + ".eventReportCreate", dto);
	}

	@Override
	public int commentReportCreate(CommentReportDTO dto) {
		return session.insert(namespace+".commentReportCreate",dto);
	}

	@Override
	public List<EventReportDTO> eventReportReadByEvent(int event_ID) {
		return session.selectList(namespace+".eventReportReadByEvent",event_ID);
	}

	@Override
	public List<EventReportDTO> eventReportReadByUser(int user_ID) {
		return session.selectList(namespace+".eventReportReadByUser",user_ID);
	}

	@Override
	public List<CommentReportDTO> commentReportByEvent(int event_ID) {
		return session.selectList(namespace+".commentReportReadByEvent",event_ID);
	}

	@Override
	public List<CommentReportDTO> commentReportComment(int comment_ID) {
		return session.selectList(namespace+"commentReportComment",comment_ID);
	}

}
