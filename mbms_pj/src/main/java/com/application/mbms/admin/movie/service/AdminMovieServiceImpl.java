package com.application.mbms.admin.movie.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.mbms.admin.movie.dao.AdminMovieDAO;
import com.application.mbms.movie.dto.MovieDTO;

@Service
public class AdminMovieServiceImpl implements AdminMovieService {

	@Autowired
	private AdminMovieDAO adminMovieDAO;

	private final String MOVIE_IMAGE_REPO_PATH = "C:\\file_repo\\";					// window
	//private final String MOVIE_IMAGE_REPO_PATH = "/var/lib/tomcat9/file_repo/";	// linux
	
	@Override
	public List<MovieDTO> getMovieList() throws Exception {
		return adminMovieDAO.selectListMovie();
	}
	
	@Override
	public void addMovie(MovieDTO movieDTO) throws Exception {
		adminMovieDAO.insertMovie(movieDTO);
	}
	
	@Override
	public void modifyMovie(MovieDTO movieDTO) throws Exception {
		adminMovieDAO.updateMovie(movieDTO);
		
	}

	@Override
	@Transactional
	public void adminRemoveMovie(String movieCd) throws Exception {
		MovieDTO dbMovieDTO = adminMovieDAO.selectOneMovie(movieCd); 

		new File(MOVIE_IMAGE_REPO_PATH + dbMovieDTO.getImgNm()).delete();
		adminMovieDAO.deleteMovie(movieCd);
	}

	@Override
	public void adminRemoveBoard(String movieCd) throws Exception {
		adminMovieDAO.deleteBoard(movieCd);
	}

	@Override
	public void adminRemoveTicket(String movieCd) throws Exception {
		adminMovieDAO.deleteTicket(movieCd);
	}

	@Override
	public void adminRemoveWishList(String movieCd) throws Exception {
		adminMovieDAO.deleteWishList(movieCd);
	}

	@Override
	public int getMovieCnt() throws Exception {
		return adminMovieDAO.selectMovieCnt();
	}

}
