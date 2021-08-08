package kr.green.shop.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.shop.dao.BoardDAO;
import kr.green.shop.vo.BoardVO;
import kr.green.shop.vo.MemberVO;

@Service
public class BoardSerViceImp implements BoardService{
	
	@Autowired
	BoardDAO boardDao;

	@Override
	public ArrayList<BoardVO> getBoardList() {
		return boardDao.getBoardList();
	}

	@Override
	public void insertBoard(BoardVO board, MemberVO user) {
		if(board == null || user == null) {
			return;
		}
		board.setBd_me_id(user.getMe_id());
		//추후 작업시 수정 필요
		board.setBd_type("공지사항");
		boardDao.insertBoard(board);
	}

	@Override
	public BoardVO getBoard(Integer num) {
		if(num == null) {
			return null;
		}
		return boardDao.getBoard(num);
	}

	@Override
	public void updateBoard(BoardVO board, MemberVO user) {
		if(board == null || user == null) {
			return;
		}
		if(!board.getBd_me_id().equals("관리자")){
			return;
		} 
		BoardVO dbBoard= boardDao.getBoard(board.getBd_num());
		dbBoard.setBd_title(board.getBd_title());
		dbBoard.setBd_contents(board.getBd_contents());
		boardDao.updateBoard(dbBoard);	
	}
}
