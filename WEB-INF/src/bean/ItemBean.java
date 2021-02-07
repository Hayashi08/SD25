package bean;

public class ItemBean {
	
    // プロパティ
    private String id = "";
    private String name = "";
    private String genre = "";
    private int max = 0;
    private int min = 0;
    private int sumqty = 0;
    private int ordersumqty = 0;
    private boolean orderstate = false;
    
    // ゲッターセッター
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
	public int getSumQty() {
		return sumqty;
	}
	public void setSumQty(int sumqty) {
		this.sumqty = sumqty;
	}
	public int getOrderSumQty() {
		return ordersumqty;
	}
	public void setOrderSumQty(int ordersumqty) {
		this.ordersumqty = ordersumqty;
	}
	public boolean getOrderState() {
		return orderstate;
	}
	public void setOrderState(boolean orderstate) {
		this.orderstate = orderstate;
	}

}
