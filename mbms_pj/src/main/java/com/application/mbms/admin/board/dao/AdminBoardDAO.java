package com.application.mbms.admin.board.dao;

import java.util.List;

import com.application.mbms.movie.dto.BoardDTO;

public interface AdminBoardDAO {
	
	public List<BoardDTO> selectListBoard() 		 throws Exception;
	public void deleteBoard(int[] deleteBoardCdList) throws Exception;
	public int selectBoardCnt() 					 throws Exception;

}
