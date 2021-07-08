package kr.green.springtest.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.springtest.vo.BoardVO;

public interface BoardDAO {

	ArrayList<BoardVO> getBoardList();

	BoardVO getBoard(@Param("num")Integer num);

	int updateBoard(@Param("board")BoardVO board);

	void insertBoard(@Param("board")BoardVO board);

}