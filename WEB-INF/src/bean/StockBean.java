package bean;

public class StockBean {
    
    // プロパティ
    private String id = "";
    private String orderid = "";
    private int orderqty = 0;
    
    // ゲッター・セッター
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
    // ゲッター・セッター
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
