package com.kh.finalProject.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7501611712694958946L;
	private String id;
	private String name;
	private String nickname;
	private String pwd;
	private String email;
	private String phone;
	private String birthday;
	private String address;
	private int main_no;
	private String original_file;
	private String rename_file;
	private Date join_date;
	private String out_yn;
	
	
	public Member() {
		super();
	}

	public Member(String id, String name, String nickname, String pwd, String email, String phone, String birthday,
			String address, int main_no, String original_file, String rename_file, Date join_date, String out_yn) {
		super();
		this.id = id;
		this.name = name;
		this.nickname = nickname;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.address = address;
		this.main_no = main_no;
		this.original_file = original_file;
		this.rename_file = rename_file;
		this.join_date = join_date;
		this.out_yn = out_yn;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getMain_no() {
		return main_no;
	}

	public void setMain_no(int main_no) {
		this.main_no = main_no;
	}

	public String getOriginal_file() {
		return original_file;
	}

	public void setOriginal_file(String original_file) {
		this.original_file = original_file;
	}

	public String getRename_file() {
		return rename_file;
	}

	public void setRename_file(String rename_file) {
		this.rename_file = rename_file;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public String getOut_yn() {
		return out_yn;
	}

	public void setOut_yn(String out_yn) {
		this.out_yn = out_yn;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", nickname=" + nickname + ", pwd=" + pwd + ", email=" + email
				+ ", phone=" + phone + ", birthday=" + birthday + ", address=" + address + ", main_no=" + main_no
				+ ", original_file=" + original_file + ", rename_file=" + rename_file + ", join_date=" + join_date
				+ ", out_yn=" + out_yn + "]";
	}
	
	
	
	
	
	
}
