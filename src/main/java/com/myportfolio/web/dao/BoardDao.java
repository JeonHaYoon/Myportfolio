package com.myportfolio.web.dao;

import com.myportfolio.web.domain.BoardDto;
import com.myportfolio.web.domain.SearchCondition;

import java.util.List;
import java.util.Map;

public interface BoardDao {
    //    boardMapper.xml에서 select의 resultType과 select id, parameterType이 일치해야함
    BoardDto select(int bno) throws Exception;
    List<BoardDto> selectAll() throws Exception;
    int insert(BoardDto dto) throws Exception;
    int update(BoardDto dto) throws Exception;
    int delete(Integer bno, String writer) throws Exception;
    int deleteAll();
    int count() throws Exception;
    List<BoardDto> selectPage(Map map) throws Exception; // List<E> selectList(String statement, Object parameter)
    int increaseViewCnt(Integer bno) throws Exception; // int update(String statement, Object parameter)
    int updateCommentCnt(Integer bno, int cnt);

    int searchResultCnt(SearchCondition sc) throws Exception;

    List<BoardDto> searchSelectPage(SearchCondition sc) throws Exception;


}
