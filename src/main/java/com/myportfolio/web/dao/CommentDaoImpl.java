package com.myportfolio.web.dao;


import com.myportfolio.web.domain.CommentDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
//BoardDao 인터페이스로 만들기, 다른것에 영향 덜주기 위함
public class CommentDaoImpl implements CommentDao {
    //    세션 받아와서 세션주입
    @Autowired
    private SqlSession session;
    private String namespace="com.myportfolio.web.dao.CommentMapper.";

//    mapper에 있는 sql 불러오는 함수를 만들어준다.

    @Override
    public int deleteAll(Integer bno) {
        return session.delete(namespace+"deleteAll", bno);
    }

    @Override
    public int count(Integer bno) throws Exception{
        return session.selectOne(namespace+"count", bno);
    }




    @Override
    public int delete(Integer cno, String commenter) throws Exception{
        Map map=new HashMap();
        map.put("cno",cno);
        map.put("commenter",commenter);
        return session.delete(namespace+"delete",map);
    }

    @Override
    public int insert(CommentDto dto) throws Exception{
        return session.insert(namespace+"insert",dto);
    }

    @Override
    public List<CommentDto> selectAll(Integer bno) throws Exception{
        return session.selectList(namespace+"selectAll",bno);
    }

    @Override
    public CommentDto select(Integer cno) throws Exception{
        return session.selectOne(namespace+"select",cno);
    }

    @Override
    public int update(CommentDto dto) throws Exception{
        return session.update(namespace+"update",dto);
    }


}