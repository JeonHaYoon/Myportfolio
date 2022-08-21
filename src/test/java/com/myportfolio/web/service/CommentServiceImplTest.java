package com.myportfolio.web.service;

import com.myportfolio.web.dao.*;
import com.myportfolio.web.domain.*;
import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import java.util.*;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CommentServiceImplTest {
    @Autowired
    CommentService commentService;
    @Autowired
    CommentDao commentDao;
    @Autowired
    BoardDao boardDao;

    @Test
    public void remove() throws Exception {
        boardDao.deleteAll();       //게시판 다 지우고
//        게시판에 새로운 글 게시하
        BoardDto boardDto = new BoardDto("aaa1","hello","jjjjj","fa", 9999);
        assertTrue(boardDao.insert(boardDto) == 1); //잘들어갔는지 확인하고
        Integer bno = boardDao.selectAll().get(0).getBno();
        System.out.println("bno = " + bno); //게시물번호를 얻어와서 출력한다

        commentDao.deleteAll(bno);      //해당게시물에 댓글 다 지운다
        CommentDto commentDto = new CommentDto(bno,0,"hi","asdf");//새로 댓글 넣는다.

        assertTrue(boardDao.select(bno).getComment_cnt() == 0);//처음 댓글카운트0
        assertTrue(commentService.write(commentDto)==1);//댓글하나 쓰고
        assertTrue(boardDao.select(bno).getComment_cnt() == 1);//댓글쓴게 1이면 댓글카운트 1

        Integer cno = commentDao.selectAll(bno).get(0).getCno();

        // 일부러 예외를 발생시키고 Tx가 취소되는지 확인해야.
        int rowCnt = commentService.remove(cno, bno, commentDto.getCommenter());    //댓글지우고
        assertTrue(rowCnt==1);
        assertTrue(boardDao.select(bno).getComment_cnt() == 0);  //댓글커멘트가 0인지 다시 확인
    }

    @Test
    public void write() throws  Exception {
        boardDao.deleteAll();

        BoardDto boardDto = new BoardDto("aaa2","hello","jjjjj","fa", 9999);
        assertTrue(boardDao.insert(boardDto) == 1);
        Integer bno = boardDao.selectAll().get(0).getBno();
        System.out.println("bno = " + bno);

        commentDao.deleteAll(bno);
        CommentDto commentDto = new CommentDto(bno,0,"hi","aaa");

        assertTrue(boardDao.select(bno).getComment_cnt() == 0);
        assertTrue(commentService.write(commentDto)==1);

        Integer cno = commentDao.selectAll(bno).get(0).getCno();
        assertTrue(boardDao.select(bno).getComment_cnt() == 1);
    }
}