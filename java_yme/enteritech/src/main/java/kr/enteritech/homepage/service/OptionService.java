package kr.enteritech.homepage.service;

import java.util.ArrayList;

import kr.enteritech.homepage.vo.MemberVO;
import kr.enteritech.homepage.vo.OptionVO;

public interface OptionService {

	ArrayList<OptionVO> getOptionList(Integer num);

	void changeStock(MemberVO user, String[] fu_Nums, String[] counts, String[] size);

	void addOption(Integer[] fu_num, String[] op_size, Integer[] op_count);

	void addStock(Integer[] op_num, Integer[] addStock);

}
