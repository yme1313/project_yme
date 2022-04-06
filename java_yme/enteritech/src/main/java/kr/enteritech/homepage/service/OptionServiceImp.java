package kr.enteritech.homepage.service;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.enteritech.homepage.dao.OptionDAO;
import kr.enteritech.homepage.vo.MemberVO;
import kr.enteritech.homepage.vo.OptionVO;

@Service
public class OptionServiceImp implements OptionService{
	@Autowired
	OptionDAO optionDao;
	@Autowired
	OptionService optionService;
	
	@Override
	public void addOption(Integer[] fu_num, String[] op_size, Integer[] op_count) {
		if(fu_num == null || op_size == null || op_count == null) {
			return;
		}
		for(int i=0 ; i < fu_num.length ; i++) {
			optionDao.addOption(fu_num[i], op_size[i], op_count[i]);	
		}
	}

	@Override
	public ArrayList<OptionVO> getOptionList(Integer num) {
		if(num == null)
			return null;
		return optionDao.getOptionList(num);
	}

	@Override
	public void changeStock(MemberVO user, String[] fu_Nums, String[] counts, String[] size) {
		if(user == null || fu_Nums == null || counts == null || size == null) {
			return;
		}
		int[] nums = Arrays.asList(fu_Nums).stream().mapToInt(Integer::parseInt).toArray();
		int[] count = Arrays.asList(counts).stream().mapToInt(Integer::parseInt).toArray();
		for(int i=0 ; i <fu_Nums.length ; i++) {
			optionDao.changeStock(nums[i],count[i],size[i]);
		}
		

	}
	@Override
	public void addStock(Integer[] op_num, Integer[] addStock) {
		for(int i = 0 ;  i < op_num.length ; i++) {
			optionDao.addStock(op_num[i], addStock[i]);
		}
		
	}



}
