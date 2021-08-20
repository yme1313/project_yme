package kr.green.shop.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.pagination.PageMaker;
import kr.green.shop.service.FutsalService;
import kr.green.shop.service.OptionService;
import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.OptionVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/cart")
public class CartController {
	FutsalService futsalService;
	OptionService optionService;
	
	@GetMapping("/list")
	public ModelAndView clothGet(ModelAndView mv, Criteria cri) {
		mv.addObject("title","의류");
		mv.setViewName("/template/goods/cloth");
		return mv;
	}	
	@GetMapping("/detail")
	public ModelAndView detailGet(ModelAndView mv, Integer num) {
		FutsalVO futsal = futsalService.getFutsal(num);
		ArrayList <OptionVO> list = optionService.getOptionList(num);
		mv.addObject("futsal", futsal);
		mv.addObject("title","풋살화 상세");
		mv.addObject("list", list);
		mv.setViewName("/template/goods/detail");
		return mv;
	}	
}
