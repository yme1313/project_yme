package kr.green.shop.service;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.shop.dao.FutsalDAO;
import kr.green.shop.pagination.Criteria;
import kr.green.shop.utils.UploadFileUtils;
import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.MemberVO;


@Service

public class FutsalServiceImp implements FutsalService{
	@Autowired
	FutsalDAO futsalDao;
	
	private String uploadPath = "C:\\Users\\yme13\\Desktop\\JAVA\\project_yme\\java_yme\\img";
	
	@Override
	public ArrayList<FutsalVO> getFutsalList(Criteria cri) {
		return futsalDao.getFutsalList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return futsalDao.getTotalCount(cri);
	}

	@Override
	public void insertGoods(MemberVO user, FutsalVO futsal) {
		if(user == null || futsal == null)
			return;
		try {
			String fu_transimg = UploadFileUtils.uploadFileOri(uploadPath, futsal.getFu_img(), futsal.getFu_img().getBytes());
			futsal.setFu_img(fu_transimg);
			} catch (Exception e) {
				e.printStackTrace();
			}
		futsalDao.insertGoods(futsal);
	}

	@Override
	public void deleteGoods(FutsalVO futsal, MemberVO user) {
		if(futsal == null || user == null) 
			return;
		System.out.println(futsal);
		File file = new File(uploadPath  + futsal.getFu_img());
		System.out.println(file);
			if(file.exists())
				file.delete();
		futsalDao.deleteGoods(futsal.getFu_num());							
	}

	@Override
	public FutsalVO getFutsal(Integer num) {
		if(num == null)
			return null;
		return futsalDao.getFutsal(num);
	}
}
