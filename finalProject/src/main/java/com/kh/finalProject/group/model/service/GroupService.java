package com.kh.finalProject.group.model.service;

import java.util.ArrayList;

import com.kh.finalProject.group.model.vo.GroupMember;
import com.kh.finalProject.group.model.vo.GroupTable;

public interface GroupService {

	ArrayList<GroupTable> selectGroup();

	ArrayList<GroupMember> selectGroupMember();

}
