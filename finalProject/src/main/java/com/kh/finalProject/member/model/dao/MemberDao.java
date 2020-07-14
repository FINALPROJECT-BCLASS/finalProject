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
	
}
