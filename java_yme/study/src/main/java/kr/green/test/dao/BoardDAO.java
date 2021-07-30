package kr.green.test.dao;

import java.util.ArrayList;

import kr.green.test.vo.BoardVO;

public interface BoardDAO {

	ArrayList<BoardVO> selectBoardList();

	BoardVO selectBoard(Integer num);

}
