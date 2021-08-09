package kr.green.shop.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.BoardVO;

public interface BoardDAO {

	ArrayList<BoardVO> getBoardList(Criteria cri);

	void insertBoard(BoardVO board);
	
	void insertBoardPw(BoardVO board);

	BoardVO getBoard(Integer num);

	void updateBoard(@Param("dbBoard")BoardVO dbBoard);

	int getTotalCount(Criteria cri);

	void deleteBoard(Integer num);

}
