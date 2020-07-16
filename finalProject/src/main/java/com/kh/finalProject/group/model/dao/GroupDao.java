package com.kh.finalProject.group.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.group.model.vo.GroupMember;
import com.kh.finalProject.group.model.vo.GroupTable;
import com.kh.finalProject.member.model.vo.Member;


@Repository("gDao")
public class GroupDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<GroupTable> selectGroup(String loginUserId) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectGroup", loginUserId);
	}

	public ArrayList<GroupMember> selectGroupMember() {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectGroupMember");
	}

	public ArrayList<Member> searchNameList(String searchName) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.searchNameList", searchName);
	}

	public int groupInsert(GroupTable gt) {
		return sqlSessionTemplate.insert("groupMapper.groupInsert", gt);
	}

	public int groupMemberInsert(ArrayList memberList) {
		return sqlSessionTemplate.insert("groupMapper.groupMemberInsert", memberList);
	}


	public int groupNoSelect() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("groupMapper.groupNoSelect");
	}
	
	
	
}
