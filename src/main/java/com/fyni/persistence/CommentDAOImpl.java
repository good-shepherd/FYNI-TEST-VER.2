package com.fyni.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fyni.domain.CommentDTO;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Inject
	private SqlSession session;
	private static String namespace = "com.fyni.mapper.commentMapper";

	@Override
	public int commentCreate(CommentDTO comment) {
		return session.insert(namespace + ".commentCreate", comment);
	}

	@Override
	public int commentUpdate(CommentDTO comment) {
		return session.update(namespace + ".commentUpdate", comment);
	}

	@Override
	public int commentDelete(int comment_ID) {
		return session.delete(namespace + ".commentDelete", comment_ID);
	}

	@Override
	public List<CommentDTO> commentEventOwn(int event_ID) {
		return session.selectList(namespace + ".commentEventOwn", event_ID);
	}

	@Override
	public List<CommentDTO> commentUserOwn(String user_ID) {
		return session.selectList(namespace + ".commentUserOwn", user_ID);
	}

}
