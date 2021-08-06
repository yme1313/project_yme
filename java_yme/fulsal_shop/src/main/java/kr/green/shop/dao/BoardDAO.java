package kr.green.shop.dao;

import java.util.ArrayList;

import kr.green.shop.vo.BoardVO;

public interface BoardDAO {

	ArrayList<BoardVO> getBoardList();

	void insertBoard(BoardVO board);

	BoardVO getBoard(Integer num);

}
