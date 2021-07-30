package kr.green.test.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.green.test.vo.BoardVO;
import kr.green.test.vo.MemberVO;

public interface BoardService {

	ArrayList<BoardVO> getBoardList();

	BoardVO getBoard(Integer num);

	void insertBoard(BoardVO board, MultipartFile[] fileList, MemberVO user);

	void insertReplyBoard(BoardVO board, MemberVO user);

}
