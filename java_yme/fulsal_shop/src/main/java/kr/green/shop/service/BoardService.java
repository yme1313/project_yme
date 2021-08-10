package kr.green.shop.service;

import java.util.ArrayList;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.BoardVO;
import kr.green.shop.vo.MemberVO;

public interface BoardService {

	ArrayList<BoardVO> getBoardList(Criteria cri);

	void insertBoard(BoardVO board, MemberVO user);

	BoardVO getBoard(Integer num);

	void updateBoard(BoardVO board, MemberVO user);

	int getTotalCount(Criteria cri);

	void deleteBoard(Integer num, MemberVO user);

	void insertBoardPw(BoardVO board, MemberVO user);

	boolean checkBoardPw(BoardVO board);

}
