package bean;

public class SaleBean {

    // プロパティ
	private int sale_id = 0;
	private String  user_id = "";
	private int situation_id = 0;
	private int sale_total =0;
	private String sale_date = "";
	
    // ゲッター・セッター
	public int getSale_id() {
		return sale_id;
	}
	public void setSale_id(int sale_id) {
		this.sale_id = sale_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getSituation_id() {
		return situation_id;
	}
	public void setSituation_id(int situation_id) {
		this.situation_id = situation_id;
	}
	public int getSale_total() {
		return sale_total;
	}
	public void setSale_total(int sale_total) {
		this.sale_total = sale_total;
	}
	public String getSale_date() {
		return sale_date;
	}
	public void setSale_date(String sale_date) {
		this.sale_date = sale_date;
	}
}
