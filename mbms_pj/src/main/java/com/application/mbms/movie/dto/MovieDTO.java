package com.application.mbms.movie.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MovieDTO {
	
	private long   movieCd;
	private String movieNm;
	private String director;
	private String runningTime;
	private String genre;
	private Date   releaseDt;
	private String plot;
	private String imgNm;
	private double ratings;
	private int    originalPrice;
	private Date   enrollDt;
	
	public long getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(long movieCd) {
		this.movieCd = movieCd;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getRunningTime() {
		return runningTime;
	}
	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public Date getReleaseDt() {
		return releaseDt;
	}
	public void setReleaseDt(Date releaseDt) {
		this.releaseDt = releaseDt;
	}
	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public String getImgNm() {
		return imgNm;
	}
	public void setImgNm(String imgNm) {
		this.imgNm = imgNm;
	}
	public double getRatings() {
		return ratings;
	}
	public void setRatings(double ratings) {
		this.ratings = ratings;
	}
	public int getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(int originalPrice) {
		this.originalPrice = originalPrice;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}

}
