package com.application.mbms.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.mbms.admin.board.dao.AdminBoardDAO;
import com.application.mbms.movie.dto.BoardDTO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	
	@Autowired
	private AdminBoardDAO adminBoardDAO;

	@Override
	public List<BoardDTO> getBoardList() throws Exception {
		return adminBoardDAO.selectListBoard();
	}

	@Override
	public void removeBoard(int[] deleteBoardCdList) throws Exception {
		adminBoardDAO.deleteBoard(deleteBoardCdList);
	}

	@Override
	public int getBoardCnt() throws Exception {
		return adminBoardDAO.selectBoardCnt();
	}

}
