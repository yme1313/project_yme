package kr.green.shop.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.shop.dao.OptionDAO;
import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.OptionVO;

@Service
public class OptionServiceImp implements OptionService{
	@Autowired
	OptionDAO optionDao;
	
	@Override
	public void addOption(FutsalVO futsal, OptionVO option) {
		if(futsal == null || option == null)
			return;
		option.setOp_fu_num(futsal.getFu_num());
		optionDao.addOption(option);
	}

	@Override
	public ArrayList<OptionVO> getOptionList(Integer num) {
		if(num == null)
			return null;
		return optionDao.getOptionList(num);
	}

}
