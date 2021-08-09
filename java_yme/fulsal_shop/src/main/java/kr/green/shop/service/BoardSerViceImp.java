package kr.green.shop.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.shop.dao.BoardDAO;
import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.BoardVO;
import kr.green.shop.vo.MemberVO;

@Service
public class BoardSerViceImp implements BoardService{
	
	@Autowired
	BoardDAO boardDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public ArrayList<BoardVO> getBoardList(Criteria cri) {
		return boardDao.getBoardList(cri);
	}

	@Override
	public void insertBoard(BoardVO board, MemberVO user) {
		if(board == null || user == null) {
			return;
		}
		board.setBd_me_id(user.getMe_id());
		if(board.getBd_pw() != null && board.getBd_pw().length() != 0) {
			String encodePw = passwordEncoder.encode(board.getBd_pw());
			board.setBd_pw(encodePw);
		boardDao.insertBoard(board);
		}
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
		boardDao.deleteBoard(num);
		
	}
}
