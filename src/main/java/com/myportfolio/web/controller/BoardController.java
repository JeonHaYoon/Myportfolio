package com.myportfolio.web.controller;

import com.myportfolio.web.domain.BoardDto;
import com.myportfolio.web.domain.PageHandler;
import com.myportfolio.web.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    BoardService boardService;

    @GetMapping("/read")
    public String read(Integer bno,Integer page, Integer pageSize, Model m){
        try {
            BoardDto boardDto= boardService.read(bno);
//           m.addAttribute("BoardDto",boardDto); 아래와 같은문장
            m.addAttribute(boardDto);
            m.addAttribute("page",page);
            m.addAttribute("pageSize",pageSize);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "board";
    }

//    데이터를 받아와서 저장된 정보 받아오기
    @GetMapping("/modify")
    public String modify(Integer bno, Model m)throws Exception{
        BoardDto boardDto=boardService.read(bno);
        m.addAttribute("boardDto",boardDto);
        return "update";
    }

    @PostMapping("/modify")
    public String modify(BoardDto boardDto,HttpSession session,Model m, RedirectAttributes rattr){
        String writer =(String)session.getAttribute("id");
        boardDto.setWriter(writer);

        try {
            int rowCnt=boardService.modify(boardDto);

            if(rowCnt!=1)
                throw new Exception("modify failed");

            rattr.addFlashAttribute("msg","MOD_OK");

            return "redirect:/board/list";


        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(boardDto);
            m.addAttribute("msg","MOD_ERR");
            return "update";

        }
    }
//    try {
//        boardService.modify(boardDto);
//    } catch (Exception e) {
//        throw new RuntimeException(e);
//    }
//        return "redirect:/board/list";


//게시물등록 form
   @GetMapping("/write")
//게시물등록
   public String write(){

       return"write";
   }

    @PostMapping("/write")
    public String write(BoardDto boardDto,HttpSession session,Model m, RedirectAttributes rattr){
        String writer =(String)session.getAttribute("id");
        boardDto.setWriter(writer);
        try {
            int rowCnt=boardService.write(boardDto);

            if(rowCnt!=1)
                throw new Exception("Write failed ");

            rattr.addFlashAttribute("msg","WRT_OK");
            return "redirect:/board/list";

        } catch (Exception e) {
//            에러가 나면 입력했던 다시보내줌
            e.printStackTrace();
            m.addAttribute(boardDto);
            m.addAttribute("msg","WRT_ERR");
            return "write";

        }
    }


    @PostMapping("/remove")
    public String remove(Integer bno, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr){
        String writer=(String)session.getAttribute("id");

        try {
            m.addAttribute("page",page);
            m.addAttribute("pageSize",pageSize);

            int rowCnt= boardService.remove(bno,writer);

            if(rowCnt!=1)
                throw  new Exception("board remove error");

            rattr.addFlashAttribute("msg","DEL_OK");

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","DEL_ERR");
        }

        return "redirect:/board/list";
    }






    @GetMapping("/list")
    public String list(Integer page, Integer pageSize, Model m, HttpServletRequest request) {
        if (!loginCheck(request))   //로그인 안되어있으면 , 로그인화면으로 이동
            return "redirect:/login/login?toURL="+request.getRequestURL();  //로그인 안했을때 로그인 화면으로 이동된 화면으로 이


//        페이지설정
        if(page==null) page=1;
        if(pageSize == null) pageSize=10;

        try {
//            페이지 네비게이션
            int totalCnt=boardService.getCount();
            PageHandler pageHandler=new PageHandler(totalCnt, page, pageSize);

            Map map=new HashMap();
            map.put("offset",(page-1)*pageSize);
            map.put("pageSize",pageSize);

            List<BoardDto> list=boardService.getPage(map);
            m.addAttribute("list",list);        //리스
            m.addAttribute("ph",pageHandler);   //navipage
            m.addAttribute("page",page);
            m.addAttribute("pageSize",pageSize);

        } catch (Exception e) {
            e.printStackTrace();
        }

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

