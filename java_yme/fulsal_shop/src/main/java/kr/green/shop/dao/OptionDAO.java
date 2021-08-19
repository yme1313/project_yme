package kr.green.shop.dao;

import java.util.ArrayList;

import kr.green.shop.vo.OptionVO;

public interface OptionDAO {

	void addOption(OptionVO option);

	ArrayList<OptionVO> getOptionList(Integer num);


}
