package com.kh.finalProject.group.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.group.model.vo.GroupMember;
import com.kh.finalProject.group.model.vo.GroupTable;
import com.kh.finalProject.group.model.vo.Member;

@Repository("gDao")
public class GroupDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<GroupTable> selectGroup() {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectGroup");
	}

	public ArrayList<GroupMember> selectGroupMember() {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectGroupMember");
	}

	public ArrayList<Member> searchNameList(String searchName) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.searchNameList");
	}
	
	
	
}
