package com.fyni.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fyni.domain.CommentDTO;
import com.fyni.persistence.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentDAO dao;

	@Override
	public int commentCreate(CommentDTO comment) {
		return dao.commentCreate(comment);
	}

	@Override
	public int commentUpdate(CommentDTO comment) {
		return dao.commentUpdate(comment);
	}

	@Override
	public int commentDelete(int comment_ID) {
		return dao.commentDelete(comment_ID);
	}

	@Override
	public List<CommentDTO> commentEventOwn(int event_ID) {
		return dao.commentEventOwn(event_ID);
	}

	@Override
	public List<CommentDTO> commentUserOwn(String user_ID) {
		return dao.commentUserOwn(user_ID);
	}

}
