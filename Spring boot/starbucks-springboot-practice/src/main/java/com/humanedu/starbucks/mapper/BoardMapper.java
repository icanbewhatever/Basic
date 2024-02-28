package com.humanedu.starbucks.mapper;

import com.humanedu.starbucks.domain.FreeBoardVO;

import java.util.List;

public interface BoardMapper {

    List<FreeBoardVO> getFreeBoardList(String search);

    FreeBoardVO getFreeBoardOne(int num);

    int putFreeBoard(FreeBoardVO freeBoardVO);

    int removeFreeBoard(int num);

    int upFreeBoard(FreeBoardVO freeBoardVO);
}
