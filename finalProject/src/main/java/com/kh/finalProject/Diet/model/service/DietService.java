package com.kh.finalProject.Diet.model.service;

import com.kh.finalProject.Diet.model.vo.Inbody;

public interface DietService {

	int InbodyInsert(Inbody inbody);

	Inbody selectInbody(String today);

}
