package kr.green.shop.service;

import java.util.ArrayList;

import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.OptionVO;

public interface OptionService {

	void addOption(FutsalVO futsal, OptionVO option);

	ArrayList<OptionVO> getOptionList(Integer num);


}
