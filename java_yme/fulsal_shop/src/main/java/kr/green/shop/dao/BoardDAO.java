package kr.green.shop.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.shop.vo.BoardVO;

public interface BoardDAO {

	ArrayList<BoardVO> getBoardList();

	void insertBoard(BoardVO board);

	BoardVO getBoard(Integer num);

	void updateBoard(@Param("dbBoard")BoardVO dbBoard);

}
