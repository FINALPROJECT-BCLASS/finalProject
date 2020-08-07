package com.kh.finalProject.manager.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.manager.model.vo.MPageInfo;
import com.kh.finalProject.manager.model.vo.RPageInfo;
import com.kh.finalProject.manager.model.vo.Report;
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

	public int getReportCount(String id) {
		
		return sqlSessionTemplate.selectOne("managerMapper.getReportCount", id);
	}

	public ArrayList<Report> selectRList(RPageInfo rpi) {
		
		int offset = (rpi.getCurrentPage() - 1) * rpi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, rpi.getBoardLimit());
	
		return (ArrayList)sqlSessionTemplate.selectList("managerMapper.selectRList", rpi, rowBounds);
	}

	public int updateReport(Report r) {
	
		return sqlSessionTemplate.update("managerMapper.updateReport", r);
	}

	public int updateRpCount(String id) {
		
		return sqlSessionTemplate.update("managerMapper.updateRpCount", id);
	}

	public int updateChatYn(String id) {
		
		return sqlSessionTemplate.update("managerMapper.updateChatYn", id);
	}

}
