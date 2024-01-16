package com.application.mbms.movie.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.mbms.movie.dto.BoardDTO;
import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.movie.service.MovieService;
import com.application.mbms.myPage.dto.WishListDTO;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService movieService;
	
	private final String MOVIE_IMAGE_REPO_PATH = "C:\\file_repo\\";
	//private final String MOVIE_IMAGE_REPO_PATH = "/var/lib/tomcat9/file_repo/";


	@GetMapping("/")
	public ModelAndView main(@ModelAttribute MovieDTO movieDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/common/main");
		
		mv.addObject("movieList" , movieService.getMovieList(movieDTO));
		
		return mv;
		
	}
	
	
	@GetMapping("/thumbnails")
	public void thumbnails(@RequestParam("imgNm") String imgNm , HttpServletResponse response) throws IOException {
		
		OutputStream out = response.getOutputStream();
		String filePath = MOVIE_IMAGE_REPO_PATH + imgNm;
		
		File image = new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(800,800).outputFormat("jpg").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
		
	}
	
	
	@GetMapping("/movie/detail")
	public ModelAndView detail(@RequestParam("movieCd") long movieCd,  @RequestParam("genre") String genre) throws Exception{

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/movie/detail");
		
		mv.addObject(movieService.getMovieDetail(movieCd));
		
		List<WishListDTO> wishList = movieService.getWishList(movieCd);
		List<String> hasWishMember = new ArrayList<String>();
		
		for (WishListDTO wishListDTO : wishList) {
			hasWishMember.add(wishListDTO.getMemberId());
		}
		
		mv.addObject("wishDTO", hasWishMember);
		
		mv.addObject("movieList", movieService.getRelatedMovieList(genre));
		mv.addObject("boardList" , movieService.getBoardList(movieCd)); 
		
		return mv;
	}
	

	@GetMapping("/movie/category")
	public ModelAndView category(HttpServletRequest request, @ModelAttribute MovieDTO movieDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/movie/category");
	
		int onePageViewCnt = 9;
		

		String temp = request.getParameter("currentPageNumber");
		if (temp == null) {
			temp = "1";
		}
		int currentPageNumber = Integer.parseInt(temp);
		
		int allBoardCnt = movieService.getAllMovieCnt();
		int allPageCnt = allBoardCnt / onePageViewCnt + 1;
		
		if (allBoardCnt % onePageViewCnt == 0) allPageCnt--;
		
		int startPage = (currentPageNumber - 1)  / 9 * 9 + 1;
		if (startPage == 0) {
			startPage = 1;
		}
		
		int endPage = startPage + 4;
		
		if (endPage > allPageCnt) endPage = allPageCnt;
		
		
		int startBoardIdx = (currentPageNumber - 1) * onePageViewCnt;
		
		mv.addObject("startPage"         , startPage);
		mv.addObject("endPage"           , endPage);
		mv.addObject("allBoardCnt"   	 , allBoardCnt);
		mv.addObject("allPageCnt"   	 , allPageCnt);
		mv.addObject("onePageViewCnt"    , onePageViewCnt);
		mv.addObject("currentPageNumber" , currentPageNumber);
		mv.addObject("startBoardIdx"     , startBoardIdx);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("onePageViewCnt" , onePageViewCnt);
		searchMap.put("startBoardIdx"  , startBoardIdx);
		searchMap.put("movieDTO", movieDTO);
		
		String genre = request.getParameter("genre");
		
		if (genre.equals("all")) {
			mv.addObject("movieList" , movieService.getCategoryList(searchMap));
		}		
		else {
			mv.addObject("movieList", movieService.getGenreList(genre));
		}
		
		return mv;
		
	}
	
	
	@PostMapping("/movie/addBoard")
	public ResponseEntity<Object> addBoard(@ModelAttribute BoardDTO boardDTO, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		String jsScript = "";
		
		if (session.getAttribute("memberId") != null) {
			
			String genre = request.getParameter("genre");

			long movieCd = Long.parseLong(request.getParameter("movieCd"));
			String memberId = (String)session.getAttribute("memberId");
			String comment = request.getParameter("comment");
			int ratings = Integer.parseInt(request.getParameter("ratings"));
			
			boardDTO.setMovieCd(movieCd);
			boardDTO.setMemberId(memberId);
			boardDTO.setComment(comment);
			boardDTO.setRatings(ratings);
			
			movieService.addBoard(boardDTO);
			movieService.updateRatings(Long.parseLong(request.getParameter("movieCd")));
			
			jsScript  = "<script>";
			jsScript += " location.href='" + request.getContextPath() + "/movie/detail?movieCd=" + movieCd + "&genre=" + genre +"';";
			jsScript += " </script>";
			
		}
		else {
			
			jsScript  = "<script>";
			jsScript += " location.href='" + request.getContextPath() + "/member/login';";
			jsScript += " </script>";
			
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	
	@GetMapping("/movie/deleteBoard")
	public  ResponseEntity<Object> deleteBoard(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		long movieCd = Long.parseLong(request.getParameter("movieCd"));
		String memberId = request.getParameter("memberId");
		long boardCd = Long.parseLong(request.getParameter("boardCd"));
		String genre = request.getParameter("genre");
		
		String sessionId = (String)session.getAttribute("memberId");
		
		String jsScript = "";
		
		if (memberId.equals(sessionId)) {
			
			movieService.deleteBoard(boardCd);

			if (movieService.getBoardList(movieCd) != null) {
				movieService.updateRatings(Long.parseLong(request.getParameter("movieCd")));
			}
			
			jsScript  = "<script>";
			jsScript += " alert('삭제되었습니다.');";
			jsScript += " location.href='" + request.getContextPath() + "/movie/detail?movieCd=" + movieCd + "&genre=" + genre +"';";
			jsScript += " </script>";
			
		}
		else {
			jsScript += "<script>";
			jsScript += " history.go(-1);";
			jsScript += " </script>";
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}	
	
	
	@GetMapping("/movie/search")
	public ModelAndView search(@ModelAttribute MovieDTO movieDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/movie/search");
		
		mv.addObject("movieList" , movieService.getMovieList(movieDTO));
		
		return mv;
		
	}	
	
	
	@PostMapping("/movie/search")
	public ModelAndView search(@RequestParam("search") String search,@ModelAttribute MovieDTO movieDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/movie/search");
	   
		mv.addObject("keyword", search);
		mv.addObject("movieList" , movieService.getMovieList(movieDTO));
		mv.addObject("searchList", movieService.getSearchMovie(search));
		
		return mv;
		
	}
	
	
}
