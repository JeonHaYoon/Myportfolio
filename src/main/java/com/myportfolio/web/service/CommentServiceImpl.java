package com.myportfolio.web.service;

import com.myportfolio.web.dao.BoardDao;
import com.myportfolio.web.dao.CommentDao;
import com.myportfolio.web.domain.CommentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class CommentServiceImpl implements CommentService {
//    @Autowired
    BoardDao boardDao;    //댓글이 추가되거나 삭제되면 boardDao에 영향이 간다
//    @Autowired
    CommentDao commentDao;


//    필드주입하면 오토와이어드 안붙여도 문제가없다. 근데 생성자주입을 하면 컴파일할때 안붙인걸 알수가 있다. 그래서 필드주입보다 생성자주입을 권장
//    @Autowired
    public CommentServiceImpl(CommentDao commentDao, BoardDao boardDao) {
        this.commentDao = commentDao;
        this.boardDao = boardDao;
    }


    @Override
    public int getCount(Integer bno) throws Exception {
        return commentDao.count(bno);
    }

//두가지 작업을 해야하므로 @Transantional 을 넣어줌

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer cno, Integer bno, String commenter) throws Exception {
        int rowCnt = boardDao.updateCommentCnt(bno, -1);
        System.out.println("updateCommentCnt - rowCnt = " + rowCnt);
//        throw new Exception("test");
        rowCnt = commentDao.delete(cno, commenter);
        System.out.println("rowCnt = " + rowCnt);
        return rowCnt;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(CommentDto commentDto) throws Exception {
        boardDao.updateCommentCnt(commentDto.getBno(), 1);
//                throw new Exception("test");
        return commentDao.insert(commentDto);
    }

//    @Override
//    public List<CommentDto> getList(Integer bno) throws Exception {
////        throw new Exception("test");
//        return commentDao.selectAll(bno);
//    }

    @Override
    public CommentDto read(Integer cno) throws Exception {
        return commentDao.select(cno);
    }

    @Override
    public List<CommentDto> getList(Integer bno) throws Exception {
//        throw new Exception("test");    예외를 주는 테스트
        return commentDao.selectAll(bno);
    }

    @Override
    public int modify(CommentDto commentDto) throws Exception {
        return commentDao.update(commentDto);
    }
}
