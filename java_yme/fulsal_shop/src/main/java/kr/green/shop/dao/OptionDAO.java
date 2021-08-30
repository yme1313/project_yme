package kr.green.shop.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.shop.vo.OptionVO;

public interface OptionDAO {

	void addOption(OptionVO option);

	ArrayList<OptionVO> getOptionList(Integer num);

	void changeStock(@Param("fu_num")int num, @Param("or_count")int count, @Param("op_size")int size);



}
