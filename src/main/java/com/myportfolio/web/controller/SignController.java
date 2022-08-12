//회원가입컨트롤

package com.myportfolio.web.controller;

import com.myportfolio.web.domain.User;
import com.myportfolio.web.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.net.URLEncoder;

@Controller
@RequestMapping("/sign")
public class SignController {

    @Autowired
    UserDao userDao;

    final int FAIL=0;

    //    @RequestMapping(value="/sign/add", method={RequestMethod.GET,RequestMethod.POST})
    @GetMapping("/add")//신규회원가입화면
    public String signup(){
        return "signup";
    }


    //    signInfo로 넘어가서 회원가입한 정보들이 저장됨
//    @RequestMapping(value="/sign/save", method= RequestMethod.POST)
//    회원가입을 post 형식으로만 받게 하기 위해  위와같이 설정, 아래와 같이 표현가능
    @PostMapping("/save")
    public String save(User user, Model m) throws Exception{
//        1. 유효성 검사
        if(!isValid(user)){
            String msg= URLEncoder.encode("ID를 잘못입력하셨습니다.", "utf-8"); //url 한글 인코딩

            m.addAttribute("msg",msg);
            return "redirect:/add";           //   두문장을 아래한문장으로 표현가능 URL재작성(rewriting)
//         return "redirect:/sign/add?msg="+msg; //URL재작성(rewriting)

        }
//        2. db에 신규회원 정보 저장
        int rowCnt=userDao.insertUser(user);

        if(rowCnt==FAIL)
            return "signform";

        return "signInfo";
    }

    private boolean isValid(User user) {
        return true;
    }
}
