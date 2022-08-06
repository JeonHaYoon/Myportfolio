package com.myportfolio.web;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

@Controller
@RequestMapping("/login")
public class LoginController {

    @GetMapping("/login")
    public String loginForm(){
        return "loginForm";
    }

    @PostMapping("/login")
    public String loginForm(String id, String pswd, Boolean rememberId, HttpServletResponse response) throws Exception{
//        1. id와 pswd 맞는지 확인

        if(!loginCheck(id, pswd)){
            String msg= URLEncoder.encode("id 또는 pswd가 일치하지 않습니다", "utf-8");
//            일치하지 않으면, loginForm으로 이동
            return "redirect:/login/login?msg="+msg;
        }
//            2. id와 pswd 일치하면 ,

        if(rememberId){
//            2-1.쿠키생성
            Cookie cookie=new Cookie("id",id);
//            2-2.응답에저장
            response.addCookie(cookie);   //변수에 HttpServletResponse 넣어줘야함

        }else{
//            쿠키삭제-혹시 있을 수동 있는 쿠키 삭제

            Cookie cookie=new Cookie("id",id);
            cookie.setMaxAge(0);
//          응답에 저
            response.addCookie(cookie);
        }
//          //            2-3. 홈으로 이동
        return "redirect:/";
    }

    private boolean loginCheck(String id, String pswd) {
        return "asdf".equals(id) && "123456".equals(pswd);
      }
}
