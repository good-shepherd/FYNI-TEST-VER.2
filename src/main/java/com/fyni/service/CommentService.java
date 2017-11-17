package com.fyni.service;

import java.util.List;

import com.fyni.domain.CommentDTO;

public interface CommentService {
	
	public int commentCreate(CommentDTO comment);

	public int commentUpdate(CommentDTO comment);

	public int commentDelete(int comment_ID);

	public List<CommentDTO> commentEventOwn(int event_ID);

	public List<CommentDTO> commentUserOwn(String user_ID);
}
