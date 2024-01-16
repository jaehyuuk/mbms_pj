package com.application.mbms.admin.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.mbms.movie.dto.MovieDTO;

@Repository
public class AdminMovieDAOImpl implements AdminMovieDAO {

	@Autowired
	private SqlSession sqlSession;
		
	@Override
	public List<MovieDTO> selectListMovie() throws Exception {
		return sqlSession.selectList("admin.movie.selectListMovie");
	}
	
	@Override
	public MovieDTO selectOneMovie(String movieCd) throws Exception {
		return sqlSession.selectOne("admin.movie.selectOneMovie", movieCd);
	}
	
	@Override
	public void insertMovie(MovieDTO movieDTO) throws Exception {
		sqlSession.insert("admin.movie.insertMovie" , movieDTO);
	}
	
	@Override
	public void updateMovie(MovieDTO movieDTO) throws Exception {
		sqlSession.update("admin.movie.updateMovie" , movieDTO);
	}

	@Override
	public void deleteMovie(String movieCd) throws Exception {
		sqlSession.delete("admin.movie.deleteMovie", movieCd);
	}

	@Override
	public void deleteBoard(String movieCd) throws Exception {
		sqlSession.delete("admin.movie.deleteBoard", movieCd);
	}

	@Override
	public void deleteTicket(String movieCd) throws Exception {
		sqlSession.delete("admin.movie.deleteTicket", movieCd);		
	}

	@Override
	public void deleteWishList(String movieCd) throws Exception {
		sqlSession.delete("admin.movie.deleteWishList", movieCd);		
	}
	
	@Override
	public int selectMovieCnt() throws Exception {
		return sqlSession.selectOne("admin.movie.selectMovieCnt");
	}

}
