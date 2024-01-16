package com.application.mbms.admin.board.service;

import java.util.List;

import com.application.mbms.movie.dto.BoardDTO;

public interface AdminBoardService {
	
	public List<BoardDTO> getBoardList() 			 throws Exception;
	public void removeBoard(int[] deleteBoardCdList) throws Exception;
	public int getBoardCnt() 						 throws Exception;

}
