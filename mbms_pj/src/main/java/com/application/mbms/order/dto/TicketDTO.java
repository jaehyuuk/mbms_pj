package com.application.mbms.order.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class TicketDTO {
	
	private long   ticketCd;
	private String memberId;
	private long   movieCd;
	private String movieNm;
	private String genre;
	private int    originalPrice;
	private String seat;
	private int    paymentAmt;
	private int    price;
	private Date   payOrderTime;
	
	public long getTicketCd() {
		return ticketCd;
	}
	public void setTicketCd(long ticketCd) {
		this.ticketCd = ticketCd;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
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
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(int originalPrice) {
		this.originalPrice = originalPrice;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public int getPaymentAmt() {
		return paymentAmt;
	}
	public void setPaymentAmt(int paymentAmt) {
		this.paymentAmt = paymentAmt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getPayOrderTime() {
		return payOrderTime;
	}
	public void setPayOrderTime(Date payOrderTime) {
		this.payOrderTime = payOrderTime;
	}
	
}
