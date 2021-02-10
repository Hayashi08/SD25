package bean;

public class StockBean {
    
    // プロパティ
    private String id = "";
    private String name = "";
    private String genre = "";
    private int max = 0;
    private int min = 0;
    private int qty = 0;
    private String employee_id = "";
    private String employee_name = "";
    private String date = "";
    private String orderid = "";
    private int orderqty = 0;
    
    // ゲッター・セッター
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
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getEmployeeId() {
		return employee_id;
	}
	public void setEmployeeId(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getEmployeeName() {
		return employee_name;
	}
	public void setEmployeeName(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getOrderId() {
		return orderid;
	}
	public void setOrderId(String orderid) {
		this.orderid = orderid;
	}
	public int getOrderQty() {
		return orderqty;
	}
	public void setOrderQty(int orderqty) {
		this.orderqty = orderqty;
	}
    
}
