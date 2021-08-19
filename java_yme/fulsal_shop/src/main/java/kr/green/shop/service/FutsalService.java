package kr.green.shop.service;

import java.util.ArrayList;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.OptionVO;

public interface FutsalService {

	ArrayList<FutsalVO> getFutsalList(Criteria cri);

	int getTotalCount(Criteria cri);

	void insertGoods(MemberVO user, FutsalVO futsal);

	void deleteGoods(Integer num, MemberVO user);

	FutsalVO getFutsal(Integer num);

	void updateGoods(FutsalVO futsal);

	ArrayList<FutsalVO> getShoesList(Criteria cri);

	int getShoesTotalCount(Criteria cri);

}
