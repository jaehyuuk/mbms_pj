package com.application.mbms.movie.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.mbms.movie.dto.BoardDTO;
import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.myPage.dto.WishListDTO;

@Repository
public class MovieDAOImpl implements MovieDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MovieDTO> selectMovieList(MovieDTO movieDTO) throws Exception {
		return sqlSession.selectList("movie.selectListMovie" , movieDTO);
	}

	@Override
	public MovieDTO selectOneMovie(long movieCd) throws Exception {
		return sqlSession.selectOne("movie.selectOneMovie", movieCd);
	}

	@Override
	public List<MovieDTO> selectGenreList(String genre) throws Exception {
		return sqlSession.selectList("movie.selectGenreList", genre);
	}
	
	@Override
	public List<WishListDTO> selectWishList(long movieCd) throws Exception {
		return sqlSession.selectList("movie.selectWishList", movieCd);
	}

	@Override
	public int selectAllMovieCnt() throws Exception {
		return sqlSession.selectOne("movie.selectAllMovieCnt");
	}

	@Override
	public List<MovieDTO> selectCategoryList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("movie.selectCategoryList" , searchMap);
	}

	@Override
	public List<MovieDTO> selectRelatedMovieList(String genre) throws Exception {
		return sqlSession.selectList("movie.selectRelatedMovieList", genre);
	}

	@Override
	public List<BoardDTO> selectBoardList(long movieCd) throws Exception {
		return sqlSession.selectList("board.selectBoardList", movieCd);
	}

	@Override
	public void insertBoard(BoardDTO boardDTO) throws Exception {
		sqlSession.update("board.insertBoard", boardDTO);
	}

	@Override
	public void updateRatings(long movieCd) throws Exception {
		sqlSession.update("board.updateRatings", movieCd);
	}

	@Override
	public void deleteBoard(long boardCd) throws Exception {
		sqlSession.delete("board.deleteBoard", boardCd);
	}

	@Override
	public List<MovieDTO> selectSearchMovieList(String search) throws Exception {
		return sqlSession.selectList("movie.selectSearchMovieList", search);
	}
	
}
