package com.myportfolio.web.dao;

import com.myportfolio.web.domain.CommentDto;

import java.util.List;

public interface CommentDao {
    //    mapper에 있는 sql 불러오는 함수를 만들어준다.
    int deleteAll(Integer bno) throws Exception;

    int count(Integer bno) throws Exception;

    int delete(Integer cno, String commenter) throws Exception;

    int insert(CommentDto dto) throws Exception;

    List<CommentDto> selectAll(Integer bno) throws Exception;

    CommentDto select(Integer cno) throws Exception;

    int update(CommentDto dto) throws Exception;
}
