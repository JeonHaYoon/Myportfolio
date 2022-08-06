package com.myportfolio.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BoardController {

    @GetMapping("list")
    public String list(HttpServletRequest request) {
        if (!loginCheck(request))   //로그인 안되어있으면 , 로그인화면으로 이동
            return "redirect:/login/login";

        return "boardList";  //그게 아니면 게시판으로 이
    }

    private boolean loginCheck(HttpServletRequest request) {
//        1. 세션을 얻어서
        HttpSession session = request.getSession();

//        2. 세션에 id가 있는지 확인, 있으면 true 반
//        if (session.getAttribute("id") != null)
//            return true;
//        else
//            return false;
//        위에 if 구문 4줄 합친게 아래 리턴문
        return session.getAttribute("id") != null;
    }

}

