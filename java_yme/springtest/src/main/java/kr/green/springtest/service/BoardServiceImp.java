package kr.green.springtest.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.springtest.dao.BoardDAO;
import kr.green.springtest.pagination.Criteria;
import kr.green.springtest.vo.BoardVO;

@Service
public class BoardServiceImp implements BoardService {
	@Autowired
	BoardDAO boardDao;

	@Override
	public ArrayList<BoardVO> getBoardList(Criteria cri) {
		return boardDao.getBoardList(cri);
	}

	@Override
	public BoardVO getBoard(Integer num) {
		if(num == null) {
			return null;
		}
		return boardDao.getBoard(num);
		//return num == null ? null : boardDao.getBoard(num);
	}

	@Override
	public int updateViews(Integer num) {
		//다오에게 게시글 정보를 가져오라고 요청
		BoardVO board = boardDao.getBoard(num);
		if(board == null) {
			return 0;
		}
		board.setViews(board.getViews()+1);
		return boardDao.updateBoard(board);
	}

	@Override
	public void insertBoard(BoardVO board) {
		boardDao.insertBoard(board);	
	}

	@Override
	public int updateBoard(BoardVO board) {
		if(board == null) {
			return 0;
		} 
		BoardVO dbBoard = boardDao.getBoard(board.getNum());
		dbBoard.setContents(board.getContents());
		dbBoard.setTitle(board.getTitle());
		return boardDao.updateBoard(dbBoard);
	}

	@Override
	public int deleteBoard(Integer num) {
		if(num == null) {
			return 0;
		}
		BoardVO board = boardDao.getBoard(num);
		board.setValid("D");
		boardDao.updateBoard(board);
		return 0;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return boardDao.getTotalCount(cri);
	}
	
}