package kr.green.test.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.green.test.dao.BoardDAO;
import kr.green.test.vo.BoardVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImp implements BoardService{
	private BoardDAO boardDao;

	@Override
	public ArrayList<BoardVO> getBoardList() {
		return boardDao.selectBoardList();
	}

	@Override
	public BoardVO getBoard(Integer num) {
		if(num == null) {
			return null;
		}
		return boardDao.selectBoard(num);
	}
}
