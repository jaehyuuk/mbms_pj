package com.application.mbms.order.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.mbms.order.dto.TicketDTO;
import com.application.mbms.order.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/ticket")
	public ModelAndView ticket(@RequestParam("movieCd") String movieCd, @ModelAttribute TicketDTO ticketDTO) throws Exception{

		ModelAndView mv = new ModelAndView();
		mv.setViewName("client/ticket/ticket");
		
		mv.addObject("movieDTO", orderService.getMovieDetail(movieCd));
		
		List<TicketDTO> ticketList = orderService.getTicketList(ticketDTO);
		List<String> seatNum = new ArrayList<String>();
		
		for (TicketDTO ticketInfo : ticketList) {
			String[] arr = ticketInfo.getSeat().split(",");
			for (int i = 0; i < arr.length; i++) {
				seatNum.add(arr[i]);
			}
		}
	
		mv.addObject("seatList", seatNum);
		
		List<TicketDTO> hasTicketMemberList = orderService.getHasTicketMember(ticketDTO);
		List<String> hasTicketMember = new ArrayList<String>();
		
		for (TicketDTO memberList : hasTicketMemberList) {
			hasTicketMember.add(memberList.getMemberId());
		}
		
		mv.addObject("hasTicketMember", hasTicketMember);
		
		return mv;
		
	}
	
	@PostMapping("/ticket")
	public ResponseEntity<Object> addTicket(@ModelAttribute TicketDTO ticketDTO) throws Exception {
		
		orderService.addTicket(ticketDTO);
		
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	
}
