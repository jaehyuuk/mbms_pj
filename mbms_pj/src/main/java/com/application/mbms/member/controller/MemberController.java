package com.application.mbms.member.controller;

import javax.servlet.http.HttpServletRequest;
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

import com.application.mbms.member.dto.MemberDTO;
import com.application.mbms.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("/register")
	public ModelAndView register() {
		return new ModelAndView("/member/register");
	}
	
	
	@PostMapping("/register")
	public ResponseEntity<Object> register(@ModelAttribute MemberDTO memberDTO) throws Exception {
		
		memberService.addMember(memberDTO);
		
		return new ResponseEntity<Object>(HttpStatus.OK);
		
	}
	
	
	@GetMapping("/checkDuplicatedId")
	public ResponseEntity<String> checkDuplicatedId(@RequestParam("memberId") String memberId) throws Exception{
		return new ResponseEntity<String>(memberService.checkDuplicatedId(memberId), HttpStatus.OK);
	}
	
	
	@GetMapping("/login")
	public ModelAndView login(){
		return new ModelAndView("/member/login");
	}
	
	
	@PostMapping("/login")
	public ResponseEntity<Object> login(MemberDTO memberDTO, HttpServletRequest request) throws Exception {
		
		String jsScript = "";
		HttpSession session = request.getSession();		
		
		if (memberService.login(memberDTO) != null) {
			
			session.setAttribute("memberId"   , memberDTO.getMemberId());
			session.setAttribute("role"       , "client");
			session.setMaxInactiveInterval(60 * 30);
			
			jsScript  = "<script>";
			jsScript += " location.href='" + request.getContextPath() + "/';";
			jsScript += " </script>";
			
		}
		else { 
			
			jsScript  = "<script>";
			jsScript += " location.href='" + request.getContextPath() + "/member/login?err=true';";
			jsScript += "</script>";
			
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	
	@GetMapping("/logout")
	public ResponseEntity<Object> logout(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate(); 
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript = "<script>";
			   jsScript += "location.href='" + request.getContextPath() + "/';";
			   jsScript += " </script>";
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	
	}
	
	
	@GetMapping("/myInfo")
	public ModelAndView myInfo(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();	
		ModelAndView mv = new ModelAndView("/member/myInfo");
		mv.addObject("memberDTO" , memberService.getMemberDetail((String)session.getAttribute("memberId")));
		
		return mv;
		
	}
	
	
	@PostMapping("/modify")
	public ResponseEntity<Object> modify(@ModelAttribute MemberDTO memberDTO) throws Exception {
		
		memberService.modifyMember(memberDTO);
		
		return new ResponseEntity<Object>(HttpStatus.OK);
		
	}
	
	
	@GetMapping("/withdraw")
	public ResponseEntity<Object> withdraw(HttpServletRequest request, MemberDTO memberDTO) throws Exception {
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		memberService.deleteMember(memberId);
		memberService.deleteTicket(memberId);
		memberService.deleteWishList(memberId);
		memberService.deleteBoard(memberId);
		session.invalidate(); 
		  
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript = "<script>";
			   jsScript += "alert('탈퇴 되었습니다.');";
			   jsScript += "location.href='" + request.getContextPath() + "/';";
			   jsScript += "</script>";
			   
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	
}
