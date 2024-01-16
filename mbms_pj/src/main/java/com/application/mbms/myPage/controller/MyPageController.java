package com.application.mbms.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.myPage.dto.WishListDTO;
import com.application.mbms.myPage.service.MyPageService;
import com.application.mbms.order.dto.TicketDTO;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/member")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	private final String MOVIE_IMAGE_REPO_PATH = "C:\\file_repo\\";					// window
	//private final String MOVIE_IMAGE_REPO_PATH = "/var/lib/tomcat9/file_repo/";	// linux
	
	
	@GetMapping("/myPage")
	public ModelAndView myPage(HttpServletRequest request, @ModelAttribute MovieDTO movieDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView("/member/myPage");
		
		HttpSession session = request.getSession();	
		String memberId = (String)session.getAttribute("memberId");
		
		mv.addObject("memberDTO" , myPageService.getMemberDetail(memberId));
		mv.addObject("myTicketList", myPageService.getMyTicketList(memberId));
		mv.addObject("movieList" , myPageService.getMovieList(movieDTO));
		
		TicketDTO ticketDTO = myPageService.getMyTicketDetail(memberId);
		mv.addObject("relatedMovieList" , myPageService.getRelatedMovieList(ticketDTO));
		
		mv.addObject("wishList", myPageService.getWishList(memberId));
		
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
	
	
	@PostMapping("/myPage")
	public ResponseEntity<Object> register(@ModelAttribute WishListDTO wishListDTO) throws Exception {
		
		myPageService.addWishList(wishListDTO);
		
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	
	@GetMapping("/cancel")
	public ResponseEntity<Object> delete(HttpServletRequest request, @RequestParam("ticketCd") long ticketCd) throws Exception {
		
		myPageService.cancelTicket(ticketCd);
		  
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript = "<script>";
			   jsScript += "alert('예매 취소되었습니다');";
			   jsScript += "location.href='" + request.getContextPath() + "/member/myPage';";
			   jsScript += " </script>";
			   
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	
	@GetMapping("/deleteHeart")
	public ResponseEntity<Object> deleteHeart(@ModelAttribute WishListDTO wishListDTO) throws Exception {
		
		myPageService.deleteHeart(wishListDTO);
		  
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	
	@GetMapping("/deleteWish")
	public ResponseEntity<Object> deleteWish(HttpServletRequest request, @RequestParam("wishListCd") long wishListCd) throws Exception {
		
		myPageService.deleteWish(wishListCd);
		
		String jsScript = "<script>";
		   	   jsScript += "location.href='" + request.getContextPath() + "/member/myPage';";
		       jsScript += "</script>";
			   
		return new ResponseEntity<Object>(jsScript, HttpStatus.OK);
	}
	
	
}
