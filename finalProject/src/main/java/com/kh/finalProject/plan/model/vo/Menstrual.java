package com.kh.finalProject.plan.model.vo;

import java.io.Serializable;

public class Menstrual implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2940559647868660335L;
	
	private String id;
	private String mcFirst;
	private int mcCycle;
	private int mcPeriod;
	private String mcLast;
	private String mcUpdate;
	private int mcPreCycle;
	private String mcDelete;
	
	public Menstrual() {
	}

	public Menstrual(String id, String mcFirst, int mcCycle, int mcPeriod, String mcLast, String mcUpdate,
			int mcPreCycle, String mcDelete) {
		this.id = id;
		this.mcFirst = mcFirst;
		this.mcCycle = mcCycle;
		this.mcPeriod = mcPeriod;
		this.mcLast = mcLast;
		this.mcUpdate = mcUpdate;
		this.mcPreCycle = mcPreCycle;
		this.mcDelete = mcDelete;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMcFirst() {
		return mcFirst;
	}

	public void setMcFirst(String mcFirst) {
		this.mcFirst = mcFirst;
	}

	public int getMcCycle() {
		return mcCycle;
	}

	public void setMcCycle(int mcCycle) {
		this.mcCycle = mcCycle;
	}

	public int getMcPeriod() {
		return mcPeriod;
	}

	public void setMcPeriod(int mcPeriod) {
		this.mcPeriod = mcPeriod;
	}

	public String getMcLast() {
		return mcLast;
	}

	public void setMcLast(String mcLast) {
		this.mcLast = mcLast;
	}

	public String getMcUpdate() {
		return mcUpdate;
	}

	public void setMcUpdate(String mcUpdate) {
		this.mcUpdate = mcUpdate;
	}

	public int getMcPreCycle() {
		return mcPreCycle;
	}

	public void setMcPreCycle(int mcPreCycle) {
		this.mcPreCycle = mcPreCycle;
	}

	public String getMcDelete() {
		return mcDelete;
	}

	public void setMcDelete(String mcDelete) {
		this.mcDelete = mcDelete;
	}

	@Override
	public String toString() {
		return "Menstrual [id=" + id + ", mcFirst=" + mcFirst + ", mcCycle=" + mcCycle + ", mcPeriod=" + mcPeriod
				+ ", mcLast=" + mcLast + ", mcUpdate=" + mcUpdate + ", mcPreCycle=" + mcPreCycle + ", mcDelete="
				+ mcDelete + "]";
	}
	
}
