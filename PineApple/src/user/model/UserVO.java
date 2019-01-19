package user.model;

public class UserVO {

	private String userid; 
	private String gradeCode_fk;
	private int idx;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private String post;
	private String addr;
	private String addrDetail;
	private String birth;
	private String gender;
	private int sumTotalPoint;
	private int sumPurchasePrice;
	private String lastLoginDate;
	private String lastPwdChangeDate;
	private String registDate;
	private int uAuth;
	private int status;
	
	public UserVO() {}
	
	public UserVO(String userid, String gradeCode_fk, int idx, String pwd, String name, String email, String phone,
			String post, String addr, String addrDetail, String birth, String gender, int sumTotalPoint,
			int sumPurchasePrice, String lastLoginDate, String lastPwdChangeDate, String registDate, int uAuth,
			int status) {
		this.userid = userid;
		this.gradeCode_fk = gradeCode_fk;
		this.idx = idx;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.post = post;
		this.addr = addr;
		this.addrDetail = addrDetail;
		this.birth = birth;
		this.gender = gender;
		this.sumTotalPoint = sumTotalPoint;
		this.sumPurchasePrice = sumPurchasePrice;
		this.lastLoginDate = lastLoginDate;
		this.lastPwdChangeDate = lastPwdChangeDate;
		this.registDate = registDate;
		this.uAuth = uAuth;
		this.status = status;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getGradeCode_fk() {
		return gradeCode_fk;
	}

	public void setGradeCode_fk(String gradeCode_fk) {
		this.gradeCode_fk = gradeCode_fk;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getSumTotalPoint() {
		return sumTotalPoint;
	}

	public void setSumTotalPoint(int sumTotalPoint) {
		this.sumTotalPoint = sumTotalPoint;
	}

	public int getSumPurchasePrice() {
		return sumPurchasePrice;
	}

	public void setSumPurchasePrice(int sumPurchasePrice) {
		this.sumPurchasePrice = sumPurchasePrice;
	}

	public String getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(String lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public String getLastPwdChangeDate() {
		return lastPwdChangeDate;
	}

	public void setLastPwdChangeDate(String lastPwdChangeDate) {
		this.lastPwdChangeDate = lastPwdChangeDate;
	}

	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	public int getuAuth() {
		return uAuth;
	}

	public void setuAuth(int uAuth) {
		this.uAuth = uAuth;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
} // end of class UserVO
