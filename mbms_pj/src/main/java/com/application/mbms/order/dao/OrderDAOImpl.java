package com.application.mbms.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.order.dto.TicketDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MovieDTO selectOneMovie(String movieCd) throws Exception {
		return sqlSession.selectOne("order.selectOneMovie", movieCd);
	}

	@Override
	public void insertTicket(TicketDTO ticketDTO) throws Exception {
		sqlSession.insert("order.insertTicket", ticketDTO);
	}

	@Override
	public List<TicketDTO> selectTicketList(TicketDTO ticketDTO) throws Exception {
		return sqlSession.selectList("order.selectTicketList", ticketDTO);
	}

	@Override
	public List<TicketDTO> selectHasTicketMemberList(TicketDTO ticketDTO) throws Exception {
		return sqlSession.selectList("order.selectHasTicketMemberList", ticketDTO);
	}


}
