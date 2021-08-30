package kr.green.shop.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.shop.dao.FutsalDAO;
import kr.green.shop.dao.OptionDAO;
import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.OptionVO;


@Service

public class FutsalServiceImp implements FutsalService{
	@Autowired
	FutsalDAO futsalDao;
	@Autowired
	OptionDAO optionDao;
		
	@Override
	public ArrayList<FutsalVO> getFutsalList(Criteria cri) {
		return futsalDao.getFutsalList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return futsalDao.getTotalCount(cri);
	}

	@Override
	public void insertGoods(MemberVO user, FutsalVO futsal) {
		if(user == null || futsal == null)
			return;
		futsalDao.insertGoods(futsal);
	}

	@Override
	public void deleteGoods(Integer num, MemberVO user) {
		if(num == null || user == null) 
			return;
		futsalDao.deleteGoods(num);							
	}

	@Override
	public FutsalVO getFutsal(Integer num) {
		if(num == null)
			return null;
		return futsalDao.getFutsal(num);
	}

	@Override
	public void updateGoods(FutsalVO futsal) {
		if(futsal == null) 
			return;
		futsalDao.updateGoods(futsal);
		
	}

	@Override
	public ArrayList<FutsalVO> getGoodsList(Criteria cri) {
		return futsalDao.getGoodsList(cri);
	}

	@Override
	public int getGoodsTotalCount(Criteria cri) {
		return futsalDao.getGoodsTotalCount(cri);
	}

	@Override
	public FutsalVO getDirectBuy(FutsalVO futsal, OptionVO option) {
		option.setOp_fu_num(futsal.getFu_num());
		return futsalDao.getDirectBuy(futsal, option);
	}

	@Override
	public ArrayList<FutsalVO> getBrandList(Criteria cri) {
		return futsalDao.getBrandList(cri);
	}

	@Override
	public int getBrandTotalCount(Criteria cri) {
		return futsalDao.getBrandTotalCount(cri);
	}

	@Override
	public ArrayList<FutsalVO> getSearchList(Criteria cri) {
		return futsalDao.getSearchList(cri);
	}

	@Override
	public int getSearchTotalCount(Criteria cri) {
		return futsalDao.getSearchTotalCount(cri);
	}

}
