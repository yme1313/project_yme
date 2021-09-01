package kr.green.shop.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.shop.vo.OptionVO;

public interface OptionDAO {

	ArrayList<OptionVO> getOptionList(Integer num);

	void changeStock(@Param("num")int num, @Param("count")int count, @Param("size")String size);

	void addOption(@Param("num")int num, @Param("size")String size, @Param("count")int count);

	void addStock(@Param("num")int num, @Param("count")int count);



}
