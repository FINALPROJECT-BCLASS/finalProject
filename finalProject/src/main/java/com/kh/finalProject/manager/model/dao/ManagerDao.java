package com.kh.finalProject.manager.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.manager.model.vo.MPageInfo;
import com.kh.finalProject.member.model.vo.Member;

@Repository("mgDao")
public class ManagerDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getMemberCount(String id) {
		
		return sqlSessionTemplate.selectOne("managerMapper.getMemberCount", id);
	}

	public ArrayList<Member> selectMList(MPageInfo mpi) {
		
		int offset = (mpi.getCurrentPage() - 1) * mpi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, mpi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("managerMapper.selectMList", mpi.getId(), rowBounds);
	}

}
