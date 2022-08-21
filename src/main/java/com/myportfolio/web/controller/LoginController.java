package com.myportfolio.web.controller;

import com.myportfolio.web.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.myportfolio.web.dao.UserDao;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

//로그인 기능

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    UserDao userDao;

    @GetMapping("/login")
    public String loginForm(){
        return "loginForm";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
//        1. 세션종료
            session.invalidate();
//        2.홈으로 이동
            return "redirect:/";
    }

    @PostMapping("/login")
    public String loginForm(String id, String pswd, String toURL, boolean rememberId,
                            HttpServletRequest request, HttpServletResponse response) throws Exception{
//        1. id와 pswd 맞는지 확인
        if(!loginCheck(id, pswd)){
            String msg= URLEncoder.encode("id 또는 pswd가 일치하지 않습니다", "utf-8");
//            일치하지 않으면, loginForm으로 이동
            return "redirect:/login/login?msg="+msg;
        }
//            2. id와 pswd 일치하면 , 세션 객체 얻어오기
        HttpSession session=request.getSession();
        session.setAttribute("id",id);           // 세션 객체를 id에 저장


        if(rememberId) {
//             1. 쿠키를 생성
            Cookie cookie = new Cookie("id", id);
//		       2. 응답에 저장
            response.addCookie(cookie);
        } else {
            // 1. 쿠키를 삭제
            Cookie cookie = new Cookie("id", id);
            cookie.setMaxAge(0); // 쿠키삭제
//		       2. 응답에 저장
            response.addCookie(cookie);
        }
//		       3. 홈으로 이동
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;
        return "redirect:"+toURL;
    }

    private boolean loginCheck(String id, String pswd) {

        User user = null;

        try {
            user = userDao.selectUser(id);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return user!=null && user.getPswd().equals(pswd);

//        User user=userDao.selectUser(id);
//
//        if(user==null) return false;
////        return user.getPswd().equals(pswd);
//        return "jjjjj".equals(id) && "123456".equals(pswd);
    }
}
