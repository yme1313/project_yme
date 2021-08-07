package kr.green.shop.service;

import java.util.ArrayList;

import kr.green.shop.vo.BoardVO;
import kr.green.shop.vo.MemberVO;

public interface BoardService {

	ArrayList<BoardVO> getBoardList();

	void insertBoard(BoardVO board, MemberVO user);

	BoardVO getBoard(Integer num);

	void updateBoard(BoardVO board, MemberVO user);

}
