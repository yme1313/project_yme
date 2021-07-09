package kr.green.springtest.service;

import java.util.ArrayList;

import kr.green.springtest.vo.BoardVO;

public interface BoardService {

	ArrayList<BoardVO> getBoardList();

	BoardVO getBoard(Integer num);

	int updateViews(Integer num);

	void insertBoard(BoardVO board);

	int updateBoard(BoardVO board);

	int deleteBoard(Integer num);

}