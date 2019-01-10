package store.model;

public class StoreVO {

	private int idx; 				// 제품번호(PK)
	private String categoryCode_fk; // 카테고리코드(FK)
	private String brCode_fk; 		// 브랜드 코드(FK)
	private String brName;			// 브랜드명
	private String name; 			// 상품 명
	private String cpu; 			// cpu 명
	private String inch; 			// 화면크기 명
	private String ramCode_fk; 		// RAM 코드(FK)
	private String ramName;			// RAM 제품명
	private String storageCode_fk;  // 저장장치(FK)
	private String storageName;		// 저장장치 제품명
	private String osCode_fk; 		// 운영체제(FK)
	private String osName;			// 운영체제 제품명
	private int price;				// 상품 정가
	private int saleprice;       	// 상품 판매가
	private String image1; 			// 상품 이미지2
	private String image2; 			// 상품 이미지2
	private String content; 		// 상품 설명 
	private int pqty;				// 상품 재고량
	private String inputdate; 		// 상품 입고일자
	private String status; 			// 상품 상태 
	
	public StoreVO() {}

	public StoreVO(int idx, String categoryCode_fk, String brCode_fk, String brName, String name, String cpu,
			String inch, String ramCode_fk, String ramName, String storageCode_fk, String storageName, String osCode_fk,
			String osName, int price, int saleprice, String image1, String image2, String content, int pqty,
			String inputdate, String status) {
		
		this.idx = idx;
		this.categoryCode_fk = categoryCode_fk;
		this.brCode_fk = brCode_fk;
		this.brName = brName;
		this.name = name;
		this.cpu = cpu;
		this.inch = inch;
		this.ramCode_fk = ramCode_fk;
		this.ramName = ramName;
		this.storageCode_fk = storageCode_fk;
		this.storageName = storageName;
		this.osCode_fk = osCode_fk;
		this.osName = osName;
		this.price = price;
		this.saleprice = saleprice;
		this.image1 = image1;
		this.image2 = image2;
		this.content = content;
		this.pqty = pqty;
		this.inputdate = inputdate;
		this.status = status;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getCategoryCode_fk() {
		return categoryCode_fk;
	}

	public void setCategoryCode_fk(String categoryCode_fk) {
		this.categoryCode_fk = categoryCode_fk;
	}

	public String getBrCode_fk() {
		return brCode_fk;
	}

	public void setBrCode_fk(String brCode_fk) {
		this.brCode_fk = brCode_fk;
	}

	public String getBrName() {
		return brName;
	}

	public void setBrName(String brName) {
		this.brName = brName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public String getInch() {
		return inch;
	}

	public void setInch(String inch) {
		this.inch = inch;
	}

	public String getRamCode_fk() {
		return ramCode_fk;
	}

	public void setRamCode_fk(String ramCode_fk) {
		this.ramCode_fk = ramCode_fk;
	}

	public String getRamName() {
		return ramName;
	}

	public void setRamName(String ramName) {
		this.ramName = ramName;
	}

	public String getStorageCode_fk() {
		return storageCode_fk;
	}

	public void setStorageCode_fk(String storageCode_fk) {
		this.storageCode_fk = storageCode_fk;
	}

	public String getStorageName() {
		return storageName;
	}

	public void setStorageName(String storageName) {
		this.storageName = storageName;
	}

	public String getOsCode_fk() {
		return osCode_fk;
	}

	public void setOsCode_fk(String osCode_fk) {
		this.osCode_fk = osCode_fk;
	}

	public String getOsName() {
		return osName;
	}

	public void setOsName(String osName) {
		this.osName = osName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSaleprice() {
		return saleprice;
	}

	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPqty() {
		return pqty;
	}

	public void setPqty(int pqty) {
		this.pqty = pqty;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
} // end of class StoreVO
