package com.kh.finalProject.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public Member selectMember(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.selectOne", m);
	}
	
	public int checkId(String id){
		return sqlSessionTemplate.selectOne("memberMapper.checkId", id);
	}

	public int insertMember(Member m) {

		return sqlSessionTemplate.insert("memberMapper.insertMember", m);
	}

	public int updateMember(Member m) {

		return sqlSessionTemplate.insert("memberMapper.updateMember", m);
	}

	public int updatePwd(Member m) {
		
		return sqlSessionTemplate.update("memberMapper.updatePwd", m);
	}

	public Member selectOneFindId(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.selectOneFindId", m);
	}

	public Member selectOne_c(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.selectOne_c", m);
	}

	
}
