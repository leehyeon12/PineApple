package store.model;

import user.model.UserVO;

public class CartVO {

	private int cartNo;
	private String fk_userid;
	private String fk_pnum;
	private int oqty;
	private String ramOption;
	private String ssdOption;
	private String windowOption;
	
	private UserVO useritem;
	private	StoreVO storeitem;	// 제품정보 객체 #pnum만 알면 다 꺼내올 수 있다.
	
	public CartVO() {}

	public CartVO(int cartNo, String fk_userid, String fk_pnum, int oqty, String ramOption, String ssdOption,
			String windowOption, UserVO useritem, StoreVO storeitem) {
		super();
		this.cartNo = cartNo;
		this.fk_userid = fk_userid;
		this.fk_pnum = fk_pnum;
		this.oqty = oqty;
		this.ramOption = ramOption;
		this.ssdOption = ssdOption;
		this.windowOption = windowOption;
		this.useritem = useritem;
		this.storeitem = storeitem;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getFk_pnum() {
		return fk_pnum;
	}

	public void setFk_pnum(String fk_pnum) {
		this.fk_pnum = fk_pnum;
	}

	public int getOqty() {
		return oqty;
	}

	public void setOqty(int oqty) {
		this.oqty = oqty;
	}

	public String getRamOption() {
		return ramOption;
	}

	public void setRamOption(String ramOption) {
		this.ramOption = ramOption;
	}

	public String getSsdOption() {
		return ssdOption;
	}

	public void setSsdOption(String ssdOption) {
		this.ssdOption = ssdOption;
	}

	public String getWindowOption() {
		return windowOption;
	}

	public void setWindowOption(String windowOption) {
		this.windowOption = windowOption;
	}

	public UserVO getUseritem() {
		return useritem;
	}

	public void setUseritem(UserVO useritem) {
		this.useritem = useritem;
	}

	public StoreVO getStoreitem() {
		return storeitem;
	}

	public void setStoreitem(StoreVO storeitem) {
		this.storeitem = storeitem;
	}
	
} // end of class CartVO
