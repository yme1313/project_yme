package kr.enteritech.homepage.service;

import java.util.ArrayList;

import kr.enteritech.homepage.pagination.Criteria;
import kr.enteritech.homepage.vo.BoardVO;
import kr.enteritech.homepage.vo.MemberVO;

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
