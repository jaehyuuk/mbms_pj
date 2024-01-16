package com.application.mbms.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.mbms.member.dto.MemberDTO;
import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.myPage.dao.MyPageDAO;
import com.application.mbms.myPage.dto.WishListDTO;
import com.application.mbms.order.dto.TicketDTO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO myPageDAO;

	@Override
	public MemberDTO getMemberDetail(String memberId) throws Exception {
		return myPageDAO.selectOneDetail(memberId);
	}

	@Override
	public List<Map<String, Object>> getMyTicketList(String memberId) throws Exception {
		return myPageDAO.selectMyTicketList(memberId);
	}
	
	@Override
	public TicketDTO getMyTicketDetail(String memberId) throws Exception {
		return myPageDAO.selectTicketDetail(memberId);
	}
	
	@Override
	public List<MovieDTO> getMovieList(MovieDTO movieDTO) throws Exception {
		return myPageDAO.selectMovieList(movieDTO);
	}
	
	@Override
	public List<MovieDTO> getRelatedMovieList(TicketDTO ticketDTO) throws Exception {
		return myPageDAO.selectRelatedMovieList(ticketDTO);
	}

	@Override
	public void cancelTicket(long ticketCd) throws Exception {
		myPageDAO.deleteTicket(ticketCd);
	}

	@Override
	public void addWishList(WishListDTO wishListDTO) throws Exception {
		myPageDAO.insertWishList(wishListDTO);
	}

	@Override
	public void deleteHeart(WishListDTO wishListDTO) throws Exception {
		myPageDAO.deleteHeart(wishListDTO);
	}
	
	@Override
	public void deleteWish(long movieCd) throws Exception {
		myPageDAO.deleteWish(movieCd);
	}

	@Override
	public List<Map<String, Object>> getWishList(String memberId) throws Exception {
		return myPageDAO.selectWishList(memberId);
	}
	
}
