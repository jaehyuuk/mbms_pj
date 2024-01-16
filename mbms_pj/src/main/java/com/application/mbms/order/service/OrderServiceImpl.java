package com.application.mbms.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.order.dao.OrderDAO;
import com.application.mbms.order.dto.TicketDTO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public MovieDTO getMovieDetail(String movieCd) throws Exception {
		return orderDAO.selectOneMovie(movieCd);
	}

	@Override
	public void addTicket(TicketDTO ticketDTO) throws Exception {
		orderDAO.insertTicket(ticketDTO);
	}

	@Override
	public List<TicketDTO> getTicketList(TicketDTO ticketDTO) throws Exception {
		return orderDAO.selectTicketList(ticketDTO);
	}

	@Override
	public List<TicketDTO> getHasTicketMember(TicketDTO ticketDTO) throws Exception {
		return orderDAO.selectHasTicketMemberList(ticketDTO);
	}



}
