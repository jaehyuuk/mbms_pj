package com.application.mbms.myPage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.mbms.member.dto.MemberDTO;
import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.myPage.dto.WishListDTO;
import com.application.mbms.order.dto.TicketDTO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDTO selectOneDetail(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectOneDetail", memberId);
	}

	@Override
	public List<Map<String, Object>> selectMyTicketList(String memberId) throws Exception {
		return sqlSession.selectList("myPage.selectMyTicketList" , memberId);
	}
	
	@Override
	public TicketDTO selectTicketDetail(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectTicketDetail", memberId);
	}
	
	@Override
	public List<MovieDTO> selectMovieList(MovieDTO movieDTO) throws Exception {
		return sqlSession.selectList("myPage.selectMovieList", movieDTO);
	}
	
	@Override
	public List<MovieDTO> selectRelatedMovieList(TicketDTO ticketDTO) throws Exception {
		return sqlSession.selectList("myPage.selectRelatedMovieList" , ticketDTO);
	}

	@Override
	public void deleteTicket(long ticketCd) throws Exception {
		sqlSession.delete("myPage.deleteTicket", ticketCd);
	}

	@Override
	public void insertWishList(WishListDTO wishListDTO) throws Exception {
		sqlSession.insert("myPage.insertWishList", wishListDTO);
	}

	@Override
	public void deleteHeart(WishListDTO wishListDTO) throws Exception {
		sqlSession.delete("myPage.deleteHeart", wishListDTO);
	}
	
	@Override
	public void deleteWish(long movieCd) throws Exception {
		sqlSession.delete("myPage.deleteWish", movieCd);
	}
	
	@Override
	public List<Map<String, Object>> selectWishList(String memberId) throws Exception {
		return sqlSession.selectList("myPage.selectWishList" , memberId);
	}
}

