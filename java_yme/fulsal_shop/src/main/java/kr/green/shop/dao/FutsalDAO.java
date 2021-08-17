package kr.green.shop.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.FutsalVO;

public interface FutsalDAO {

	ArrayList<FutsalVO> getFutsalList(@Param("cri")Criteria cri);

	int getTotalCount(@Param("cri")Criteria cri);

}
