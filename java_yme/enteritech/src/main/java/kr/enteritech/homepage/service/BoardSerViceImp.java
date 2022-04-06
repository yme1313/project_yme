package kr.enteritech.homepage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.enteritech.homepage.dao.BoardDAO;
import kr.enteritech.homepage.dao.ReplyDAO;
import kr.enteritech.homepage.pagination.Criteria;
import kr.enteritech.homepage.vo.BoardVO;
import kr.enteritech.homepage.vo.MemberVO;

@Service
public class BoardSerViceImp implements BoardService{
	
	@Autowired
	BoardDAO boardDao;
	@Autowired
	ReplyDAO replyDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public ArrayList<BoardVO> getBoardList(Criteria cri) {
		return boardDao.getBoardList(cri);
	}

	@Override
	public void insertBoardPw(BoardVO board, MemberVO user) {
		if(board == null || user == null) {
			return;
		}
		board.setBd_me_id(user.getMe_id());
		if(board.getBd_pw() != null && board.getBd_pw().length() != 0) {
			String encodePw = passwordEncoder.encode(board.getBd_pw());
			board.setBd_pw(encodePw);
		boardDao.insertBoardPw(board);
		}
	}
	@Override
	public void insertBoard(BoardVO board, MemberVO user) {
		if(board == null || user == null) {
			return;
		}
		board.setBd_me_id(user.getMe_id());
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
		BoardVO dbBoard= boardDao.getBoard(board.getBd_num());
		dbBoard.setBd_title(board.getBd_title());
		dbBoard.setBd_contents(board.getBd_contents());
		boardDao.updateBoard(dbBoard);	
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return boardDao.getTotalCount(cri);
	}

	@Override
	public void deleteBoard(Integer num, MemberVO user) {
		if(num == null || user == null) {
			return;
		}
		BoardVO board = boardDao.getBoard(num);
		if(board == null || !board.getBd_me_id().equals(user.getMe_id())) {
			return;
		}
		replyDao.deleteValid(board.getBd_num());
		boardDao.deleteBoard(num);
		
	}

	@Override
	public boolean checkBoardPw(BoardVO board) {
		if(board == null || board.getBd_pw() == null) {
			return false;
		}
		BoardVO dbBoard = boardDao.getBoard(board.getBd_num());
		if(dbBoard != null && passwordEncoder.matches(board.getBd_pw(), dbBoard.getBd_pw())) {
			return true;
		} else {
			return false;
		}
	}
}
