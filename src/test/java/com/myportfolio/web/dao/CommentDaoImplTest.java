package com.myportfolio.web.dao;

import com.myportfolio.web.domain.CommentDto;
import org.checkerframework.checker.units.qual.C;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CommentDaoImplTest {
    @Autowired
    CommentDao commentDao;

    @Test
    public void count() throws Exception{
        commentDao.deleteAll(1);  //모든 게시물의 댓글 지운다
        assertTrue(commentDao.count(1)==0);  //댓글 카운드가 0인지본다
    }

    @Test
    public void delete() throws Exception{
        commentDao.deleteAll(1);
        CommentDto commentDto= new CommentDto(1,0, "comment", "jjjjj");
        assertTrue(commentDao.insert(commentDto)==1);
        assertTrue(commentDao.count(1)==1);
    }

    @Test
    public void insert() throws Exception{
        commentDao.deleteAll(1);   //특정 게시물의 댓글 모두삭제
        CommentDto commentDto=new CommentDto(1,0,"comment","jjjjj");
        assertTrue(commentDao.insert(commentDto)==1);  //인서트해서 1인지 확인, 들어가서 성공하면 1
        assertTrue(commentDao.count(1)==1);  //count도 1이어야함

        commentDto= new CommentDto(1,0,"comment","jjjjj");
        assertTrue(commentDao.insert(commentDto)==1);   //하나 더 넣고
        assertTrue(commentDao.count(1)==2);    // count 2개인지 확인
    }

    @Test
    public void selectAll() throws Exception{
        commentDao.deleteAll(1);
        CommentDto commentDto=new CommentDto(1,0,"comment","jjjjj");
        assertTrue(commentDao.insert(commentDto)==1);
        assertTrue(commentDao.count(1)==1);

        List<CommentDto> list=commentDao.selectAll(1);  //하나 가져온다
        assertTrue(list.size()==1);     //그 사이즈가 1인가

        commentDto=new CommentDto(1,0,"comment","jjjjj");
        assertTrue(commentDao.insert(commentDto)==1);
        assertTrue(commentDao.count(1)==2);

        list=commentDao.selectAll(1);
        assertTrue(list.size()==2);     //2번반복
    }

    @Test
    public void select() throws Exception {
        commentDao.deleteAll(1);
        CommentDto commentDto = new CommentDto(1, 0, "comment", "asdf");
        assertTrue(commentDao.insert(commentDto)==1);
        assertTrue(commentDao.count(1)==1); //다 지우고 하나 생성해서 카운트 1 맞는지

        List<CommentDto> list = commentDao.selectAll(1);  //다시 꺼내서
        String comment = list.get(0).getComment();//내용과 작성자가 같은지 확
        String commenter = list.get(0).getCommenter();
        assertTrue(comment.equals(commentDto.getComment()));
        assertTrue(commenter.equals(commentDto.getCommenter()));
    }

    @Test
    public void update() throws Exception {
        commentDao.deleteAll(1);
        CommentDto commentDto = new CommentDto(1, 0, "comment", "asdf");
        assertTrue(commentDao.insert(commentDto)==1);
        assertTrue(commentDao.count(1)==1);  //다 지우고 하나 생성해서 카운드 1맞는지

        List<CommentDto> list = commentDao.selectAll(1);  //꺼내서 커맨트 번호 얻고 내용을 커맨트 2로 변경하면 업데이트가 성공하면 1
        commentDto.setCno(list.get(0).getCno());
        commentDto.setComment("comment2");
        assertTrue(commentDao.update(commentDto)==1);

        list = commentDao.selectAll(1);     //다시 읽어와서 세팅한 커멘트 dto 와 같은지 비교, 같으면 업데이트 잘됨
        String comment = list.get(0).getComment();
        String commenter = list.get(0).getCommenter();
        assertTrue(comment.equals(commentDto.getComment()));
        assertTrue(commenter.equals(commentDto.getCommenter()));
    }



}