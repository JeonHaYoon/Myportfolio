package com.myportfolio.web.controller;

import com.myportfolio.web.domain.CommentDto;
import com.myportfolio.web.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

//@Controller
//@ResponseBody   //모든 메서드에 들어가면 위쪽에 고정시켜두면 다른 메서드에 안붙여도 됨
@RestController //@Controller , @ResponseBody 포함되어 있어서 @RestController 붙임
public class CommentController {
//    커멘트 서비스를 가져온다
    @Autowired
    CommentService service;

//    게시물 번호를 주면, 저장된 게시물의 모든 댓글을 가져오는 메서드
    @GetMapping("/comments")        // /comments?bno=1000 GET
//    @ResponseBody
    public ResponseEntity<List<CommentDto>> list(Integer bno) {

        List<CommentDto> list = null;

        try {
            list = service.getList(bno);
            System.out.println("list = " + list);

            return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK); //200
//         ResponseEntity는   List가 entity  , entity 에 상태코드 추가한것. 원래는 entity만 보냈는데 상태코드까지 같이보냄-스프링이 알아서처리
//            entity는 응답이나 요청할 때, 전송할 대상을 entity 라고 함.
//            list 가 우리가 보내려는 entity(택배 안의 내용물이라고 생각)이고, 응답에 들어가는 entity라서 responseEntity이고 보낼때 상태코드도 같이 보낸다.
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<CommentDto>>(HttpStatus.BAD_REQUEST); //400

        }
    }

    //댓글 삭제하는 메서드
    // /comments/1?bno=1085  삭제할 댓글 번호 . mapping된 url 일부를 가져오려면 아래 @PathVariable 사용, bno는 쿼리스트링에 있어서 괜찮다.
    @DeleteMapping("/comments/{cno}")
//    @ResponseBody
    public ResponseEntity<String> remove(@PathVariable Integer cno, Integer bno, HttpSession session){
//        String commenter=(String) session.getAttribute("id");
        String commenter="jjjjj";

        try {
            int rowCnt=  service.remove(cno,bno,commenter);

            if(rowCnt!=1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>("DEL_OK",HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
        }
    }

    //댓글 등록하는  메서드
    @PostMapping("/comments")   // /comments?bno=1080 POST
//    @ResponseBody
// @RequestBody 을 dto 앞에 입력해줘야   json으로 온걸 자바객체로 변환해서 넣어준다.
    public ResponseEntity<String> write(@RequestBody CommentDto dto, Integer bno, HttpSession session){
        //        String commenter=(String) session.getAttribute("id");
        String commenter="jjjjj";
        dto.setCommenter(commenter);   //커멘터 지정 ,아이디로, 로그인안해서 지정해준것,
        dto.setBno(bno);                //게시물번호도 지정
        System.out.println("dto = " + dto);

        try {
            if(service.write(dto)!=1)
                throw new Exception("Write failed.");
            return new ResponseEntity<String>("WRT_OK",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    //댓글 수정하는 메서드
    @PatchMapping("/comments/{cno}")   // /comments/70 PATCH
//    @ResponseBody
// @RequestBody 을 dto 앞에 입력해줘야   json으로 온걸 자바객체로 변환해서 넣어준다.
    public ResponseEntity<String> modify(@RequestBody CommentDto dto,@PathVariable Integer cno, HttpSession session){
        //        String commenter=(String) session.getAttribute("id");
        String commenter="jjjjj";  // 로그인안해서 지정해준것
        dto.setCommenter(commenter);   //커멘터 지정 ,아이디로,
        dto.setCno(cno);   // cno 번호 지정
        System.out.println("dto = " + dto);

        try {
            if(service.modify(dto)!=1)
                throw new Exception("Modify failed.");
            return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }

}
