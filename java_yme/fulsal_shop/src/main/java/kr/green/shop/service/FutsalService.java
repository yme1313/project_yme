package kr.green.shop.service;

import java.util.ArrayList;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.FutsalVO;

public interface FutsalService {

	ArrayList<FutsalVO> getFutsalList(Criteria cri);

	int getTotalCount(Criteria cri);

}
