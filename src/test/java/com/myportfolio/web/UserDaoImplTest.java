package com.myportfolio.web;

import com.myportfolio.web.dao.UserDao;
import com.myportfolio.web.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import java.util.Calendar;
import java.util.Date;
import static org.junit.Assert.assertTrue;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDaoImplTest  {
    @Autowired
    UserDao userDao;

    @Test
    public void deleteUser() {
    }
    @Test
    public void selectUser() {
    }
    @Test
    public void insertUser() {
    }
    @Test
    public void updateUser()throws Exception{

        Calendar cal=Calendar.getInstance();
        cal.clear();
        cal.set(2021,1,1);

        userDao.deleteAll();

        User user=new User("jjjjj", "123456","mm","abc@bo.com","gg","male", new Date(cal.getTimeInMillis()) );
        int rowCnt=userDao.insertUser(user);
        assertTrue(rowCnt==1);

        user.setPswd("123456");
        user.setEmail("bbb@bb.com");
        rowCnt=userDao.updateUser(user);
        assertTrue(rowCnt==1);

        User user2=userDao.selectUser(user.getId());
        assertTrue(user.equals(user2));

        System.out.println("user="+user);
        System.out.println("user2="+user2);


    }
}