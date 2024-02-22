package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;

public interface BoardMapper {
	//@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();

	void insert(BoardVO board);

	void insertSelectKey(BoardVO board);

	BoardVO read(Long bno);

	int delete(Long bno);

	int update(BoardVO board);

	List<BoardVO> getDynamicMybatis(Map<String, String> map1);
}

