package com.application.mbms.admin.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.mbms.order.dto.TicketDTO;

@Repository
public class AdminOrderDAOImpl implements AdminOrderDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<TicketDTO> selectListOrder() throws Exception{
		return sqlSession.selectList("admin.order.selectListOrder");
	}

	@Override
	public int selectOrderCnt() throws Exception {
		return sqlSession.selectOne("admin.order.selectOrderCnt");
	}
	
}
