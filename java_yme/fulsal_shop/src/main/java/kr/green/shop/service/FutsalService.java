package kr.green.shop.service;

import java.util.ArrayList;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.CartVO;
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

	ArrayList<FutsalVO> getClothList(Criteria cri);

	int getClothTotalCount(Criteria cri);

	FutsalVO getDirectBuy(FutsalVO futsal, OptionVO option, CartVO cart);

	ArrayList<FutsalVO> getNikeList(Criteria cri);
	
	int getNikeTotalCount(Criteria cri);
	
	ArrayList<FutsalVO> getAdidasList(Criteria cri);
	
	int getAdidasTotalCount(Criteria cri);
	
	ArrayList<FutsalVO> getPumaList(Criteria cri);
	
	int getPumaTotalCount(Criteria cri);

	ArrayList<FutsalVO> getSearchList(Criteria cri);

	int getSearchTotalCount(Criteria cri);

}
