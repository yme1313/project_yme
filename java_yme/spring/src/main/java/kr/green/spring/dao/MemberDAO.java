package kr.green.spring.dao;
 
import org.apache.ibatis.annotations.Param;

import kr.green.spring.vo.MemberVo;
 
public interface MemberDAO {
    public MemberVo getMember(@Param("id")String id);
}
 
