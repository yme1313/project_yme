package kr.enteritech.homepage.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.enteritech.homepage.pagination.Criteria;
import kr.enteritech.homepage.vo.BoardVO;

public interface BoardDAO {

	ArrayList<BoardVO> getBoardList(Criteria cri);

	void insertBoard(BoardVO board);
	
	void insertBoardPw(BoardVO board);

	BoardVO getBoard(Integer num);

	void updateBoard(@Param("dbBoard")BoardVO dbBoard);

	int getTotalCount(Criteria cri);

	void deleteBoard(Integer num);

	void setAnswer(BoardVO board);

	void noAnswer(BoardVO board);

	void erase(String me_id);

}
