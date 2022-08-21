package com.myportfolio.web.domain;

import java.util.Date;
import java.util.Objects;

public class BoardDto {
    private Integer bno;
    private String title;
    private String cont;
    private String writer;
    private Integer view_cnt;       //조회수
    private Integer comment_cnt;  //댓글갯수
    private Date reg_date;          //작성일
    private Date up_date;           //업데이트일
    private String camp_name;       //캠핑장이름
    private int camp_cost;          //캠핑장비용

    public BoardDto(){}

//    필수값의 변수들
    public BoardDto(String title, String cont, String writer,String camp_name,int camp_cost) {
        this.title = title;
        this.cont = cont;
        this.writer = writer;
        this.camp_name=camp_name;
        this.camp_cost=camp_cost;
    }

    public Integer getBno() {
        return bno;
    }

    public void setBno(Integer bno) {
        this.bno = bno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCont() {
        return cont;
    }

    public void setCont(String cont) {
        this.cont = cont;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Integer getView_cnt() {
        return view_cnt;
    }

    public void setView_cnt(Integer view_cnt) {
        this.view_cnt = view_cnt;
    }

    public Integer getComment_cnt() {
        return comment_cnt;
    }

    public void setComment_cnt(Integer comment_cnt) {
        this.comment_cnt = comment_cnt;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public Date getUp_date() {
        return up_date;
    }

    public void setUp_date(Date up_date) {
        this.up_date = up_date;
    }

    public String getCamp_name() {
        return camp_name;
    }

    public void setCamp_name(String camp_name) {
        this.camp_name = camp_name;
    }
    public int getCamp_cost() {
        return camp_cost;
    }

    public void setCamp_cost(int camp_cost) {
        this.camp_cost = camp_cost;
    }

    @Override
    public String toString() {
        return "BoardDto{" +
                "bno=" + bno +
                ", title='" + title + '\'' +
                ", cont='" + cont + '\'' +
                ", writer='" + writer + '\'' +
                ", view_cnt=" + view_cnt +
                ", comment_cnt=" + comment_cnt +
                ", reg_date=" + reg_date +
                ", up_date=" + up_date +
                ", camp_name='" + camp_name + '\'' +
                ", camp_cost='" + camp_cost +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BoardDto boardDto = (BoardDto) o;
        return Objects.equals(bno, boardDto.bno) && Objects.equals(title, boardDto.title) && Objects.equals(cont, boardDto.cont) && Objects.equals(writer, boardDto.writer) && Objects.equals(camp_name, boardDto.camp_name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bno, title, cont, writer, camp_name);
    }
}
