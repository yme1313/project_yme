package kr.green.shop.service;

import java.util.ArrayList;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.MemberVO;

public interface FutsalService {

	ArrayList<FutsalVO> getFutsalList(Criteria cri);

	int getTotalCount(Criteria cri);

	void insertGoods(MemberVO user, FutsalVO futsal);

	void deleteGoods(FutsalVO futsal, MemberVO user);

	FutsalVO getFutsal(Integer num);

}
