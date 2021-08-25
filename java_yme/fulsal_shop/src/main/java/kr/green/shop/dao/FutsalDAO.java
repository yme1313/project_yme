package kr.green.shop.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.CartVO;
import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.OptionVO;

public interface FutsalDAO {

	ArrayList<FutsalVO> getFutsalList(@Param("cri")Criteria cri);

	int getTotalCount(@Param("cri")Criteria cri);

	void insertGoods(FutsalVO futsal);

	void deleteGoods(int fu_num);

	FutsalVO getFutsal(Integer num);

	void updateGoods(FutsalVO futsal);

	ArrayList<FutsalVO> getShoesList(Criteria cri);

	int getShoesTotalCount(Criteria cri);

	ArrayList<FutsalVO> getClothList(Criteria cri);

	int getClothTotalCount(Criteria cri);

	FutsalVO getDirectBuy(@Param("futsal")FutsalVO futsal, @Param("option")OptionVO option, @Param("cart")CartVO cart);

}
