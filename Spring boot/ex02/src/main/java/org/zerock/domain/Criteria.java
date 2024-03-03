package org.zerock.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 검색을 위한 클래스 VO
 */
@Getter //항상 있어야한다
@Setter
public class Criteria {
    private String type;
    private String keyword;

    //댓글을 위한 메서드 ReplyController
    private int pageNum; //댓글 페이지
    private int pageSize; // 댓글 페이지 사이즈
    public Criteria(){
        this(1, 10); //처음 페이지는 1, 처음페이지 사이즈는 10
    }

    public Criteria(int pageNum, int pageSize) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
    }

    // T, C, W, TC, TW, TWC
    //["T"]
    //["C"]
    //["W"]
    //["T", "C"]..........
    public String[] getTypeArr(){
        return  type == null ? new String[]{} : type.split(""); //빈객체를 넣어줘야한다

    }


}
