package kr.green.shop.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.green.shop.dao.FutsalDAO;
import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.FutsalVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor

public class FutsalServiceImp implements FutsalService{
	
	FutsalDAO futsalDao;
	
	@Override
	public ArrayList<FutsalVO> getFutsalList(Criteria cri) {
		return futsalDao.getFutsalList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return futsalDao.getTotalCount(cri);
	}

}
