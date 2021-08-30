package kr.green.shop.service;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.shop.dao.OptionDAO;
import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.OptionVO;

@Service
public class OptionServiceImp implements OptionService{
	@Autowired
	OptionDAO optionDao;
	@Autowired
	OptionService optionService;

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

	@Override
	public void changeStock(MemberVO user, String[] fu_Nums, String[] counts, String[] size) {
		if(user == null || fu_Nums == null || counts == null || size == null) {
			return;
		}
		int[] nums = Arrays.asList(fu_Nums).stream().mapToInt(Integer::parseInt).toArray();
		int[] count = Arrays.asList(counts).stream().mapToInt(Integer::parseInt).toArray();
		int[] size1 = Arrays.asList(size).stream().mapToInt(Integer::parseInt).toArray();
		for(int i=0 ; i <fu_Nums.length ; i++) {
			System.out.println(nums[i]);
			System.out.println(count[i]);
			System.out.println(size1[i]);
		}

	}




}
