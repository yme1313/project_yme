package kr.green.shop.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.OptionVO;

public interface FutsalDAO {

	ArrayList<FutsalVO> getFutsalList(@Param("cri")Criteria cri);

	int getTotalCount(@Param("cri")Criteria cri);

	void insertGoods(FutsalVO futsal);

	void deleteGoods(int fu_num);

	FutsalVO getFutsal(Integer num);

	void updateGoods(FutsalVO futsal);

	ArrayList<FutsalVO> getGoodsList(Criteria cri);

	int getGoodsTotalCount(Criteria cri);

	FutsalVO getDirectBuy(@Param("futsal")FutsalVO futsal, @Param("option")OptionVO option);

	ArrayList<FutsalVO> getBrandList(Criteria cri);

	int getBrandTotalCount(Criteria cri);

	ArrayList<FutsalVO> getAdidasList(Criteria cri);

	int getAdidasTotalCount(Criteria cri);

	ArrayList<FutsalVO> getPumaList(Criteria cri);

	int getPumaTotalCount(Criteria cri);

	ArrayList<FutsalVO> getSearchList(Criteria cri);

	int getSearchTotalCount(Criteria cri);

}
