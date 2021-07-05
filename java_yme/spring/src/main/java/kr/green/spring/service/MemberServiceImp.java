package kr.green.spring.service;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.green.spring.dao.MemberDAO;
import kr.green.spring.vo.MemberVo;
 
@Service
public class MemberServiceImp implements MemberService {
    @Autowired
    MemberDAO memberDao;
    
    @Override
    public MemberVo getMember(String id) {
        return memberDao.getMember(id);
    }
}