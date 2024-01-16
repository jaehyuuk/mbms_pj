package com.application.mbms.admin.member.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AdminDTO {
	
	private String adminId;
	private String passwd;
	private Date   joinDt;
	private String selectMovie; 
	private String managementMovie; 
	private String selectMember; 
	private String managementMember; 
	private String selectComment; 
	private String managementComment; 
	private String selectOrder; 
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getJoinDt() {
		return joinDt;
	}
	public void setJoinDt(Date joinDt) {
		this.joinDt = joinDt;
	}
	public String getSelectMovie() {
		return selectMovie;
	}
	public void setSelectMovie(String selectMovie) {
		this.selectMovie = selectMovie;
	}
	public String getManagementMovie() {
		return managementMovie;
	}
	public void setManagementMovie(String managementMovie) {
		this.managementMovie = managementMovie;
	}
	public String getSelectMember() {
		return selectMember;
	}
	public void setSelectMember(String selectMember) {
		this.selectMember = selectMember;
	}
	public String getManagementMember() {
		return managementMember;
	}

	public void setManagementMember(String managementMember) {
		this.managementMember = managementMember;
	}
	public String getSelectComment() {
		return selectComment;
	}
	public void setSelectComment(String selectComment) {
		this.selectComment = selectComment;
	}
	public String getManagementComment() {
		return managementComment;
	}
	public void setManagementComment(String managementComment) {
		this.managementComment = managementComment;
	}
	public String getSelectOrder() {
		return selectOrder;
	}
	public void setSelectOrder(String selectOrder) {
		this.selectOrder = selectOrder;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDTO.class);
	
	@After("execution(public * adminLogin(..))")
	public void managerLogin() throws Exception {
		
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
 
		logger.info("관리자 접속 " + sdf.format(now));
	}
	
	@After("execution(public * adminLogout(..))")
	public void managerLogout() throws Exception {
		
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
 
        logger.info("관리자 로그아웃 " + sdf.format(now));
	}
	
}
