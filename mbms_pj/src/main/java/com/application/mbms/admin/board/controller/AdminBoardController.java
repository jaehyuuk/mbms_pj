package com.application.mbms.admin.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.mbms.admin.board.service.AdminBoardService;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	
	@GetMapping("/adminBoard")
	public ModelAndView boardList() throws Exception {
		ModelAndView mv = new ModelAndView("/admin/board/adminBoard");
		mv.addObject("boardList" , adminBoardService.getBoardList());
		return mv;
	}
	
	
	@GetMapping("/removeBoard")
	public ResponseEntity<Object> removeBoard(@RequestParam("boardCdList") String boardCdList) throws Exception {
		
		String[] temp = boardCdList.split(",");
		int[] deleteBoardCdList = new int[temp.length];

		for (int i = 0; i < temp.length; i++) {
			deleteBoardCdList[i] = Integer.parseInt(temp[i]);
		}
		
		adminBoardService.removeBoard(deleteBoardCdList);
		
		String jsScript = "<script>";
				jsScript += "alert('코멘트 정보를 삭제하였습니다.'); ";
				jsScript += "location.href='adminBoard'";
				jsScript += "</script>";
		
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
}
