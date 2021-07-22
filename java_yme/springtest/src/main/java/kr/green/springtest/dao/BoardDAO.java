package kr.green.springtest.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.springtest.pagination.Criteria;
import kr.green.springtest.vo.BoardVO;
import kr.green.springtest.vo.FileVO;
import kr.green.springtest.vo.RecommendVO;

public interface BoardDAO {

	ArrayList<BoardVO> getBoardList(@Param("cri")Criteria cri);

	BoardVO getBoard(@Param("num")Integer num);

	int updateBoard(@Param("board")BoardVO board);

	void insertBoard(@Param("board")BoardVO board);

	int getTotalCount(@Param("cri")Criteria cri);

	void insertFile(@Param("file")FileVO fvo);

	ArrayList<FileVO> getFileList(@Param("num")Integer num);

	void deleteFile(@Param("num")int num);

	RecommendVO getRecommend(@Param("board")int board, @Param("id")String id);

	void insertRecommend(@Param("board")int board,@Param("id") String id, @Param("state")int state);

	void updateRecommend(@Param("rvo")RecommendVO rvo);
}