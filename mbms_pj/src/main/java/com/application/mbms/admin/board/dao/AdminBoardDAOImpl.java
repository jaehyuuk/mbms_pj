package com.application.mbms.admin.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.mbms.movie.dto.BoardDTO;

@Repository
public class AdminBoardDAOImpl implements AdminBoardDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardDTO> selectListBoard() throws Exception {
		return sqlSession.selectList("adminBoard.selectListBoard");
	}

	@Override
	public void deleteBoard(int[] deleteBoardCdList) throws Exception {
		sqlSession.delete("adminBoard.deleteBoard", deleteBoardCdList);
	}

	@Override
	public int selectBoardCnt() throws Exception {
		return sqlSession.selectOne("adminBoard.selectBoardCnt");
	}

}
