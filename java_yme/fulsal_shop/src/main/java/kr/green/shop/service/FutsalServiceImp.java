package kr.green.shop.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.shop.dao.FutsalDAO;
import kr.green.shop.dao.OptionDAO;
import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.CartVO;
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
	public ArrayList<FutsalVO> getShoesList(Criteria cri) {
		return futsalDao.getShoesList(cri);
	}

	@Override
	public int getShoesTotalCount(Criteria cri) {
		return futsalDao.getShoesTotalCount(cri);
	}

	@Override
	public ArrayList<FutsalVO> getClothList(Criteria cri) {
		return futsalDao.getClothList(cri);
	}

	@Override
	public int getClothTotalCount(Criteria cri) {
		return futsalDao.getClothTotalCount(cri);
	}

	@Override
	public FutsalVO getDirectBuy(FutsalVO futsal, OptionVO option, CartVO cart) {
		return futsalDao.getDirectBuy(futsal , option, cart);
	}
}
