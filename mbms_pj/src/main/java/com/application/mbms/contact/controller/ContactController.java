package com.application.mbms.contact.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContactController {

	@Autowired
	private JavaMailSender mailSender;

	@GetMapping("/contact")
	public ModelAndView contact(){
		return new ModelAndView("/contact");
	}
	
	@PostMapping("/sendMail")
    public ResponseEntity<Object> sendMailTest(HttpServletRequest request) throws Exception{
        
        String subject = "MOVIESYNC사용자로 부터 온 메일입니다.";
        String content = request.getParameter("content");
        String email = request.getParameter("email");
        String writer = request.getParameter("writer");

        String to = "doogun97@gmail.com";
        String from = "doogun97@gmail.com";
        
        String contact = "작성자 : " + writer + "<br><br> 이메일 : " + email + "<br><br>" + content;
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
            // 단순한 텍스트 메세지만 사용시
            
            /*
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
             * true는 멀티파트 메세지를 사용하겠다는 의미 
             */
            
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            
            /* 
             * 메일 주소에 보내는이와 메일주소를 모두 표기
             * mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
             */
            
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(contact, true);
            // true : html사용
            
            /*
             * 단순한 텍스트만 사용 : mailHelper.setText(content);
             */
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<Object>(HttpStatus.OK);
    }

}
