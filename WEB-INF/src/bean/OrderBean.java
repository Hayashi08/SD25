package bean;

public class OrderBean {
    
    // プロパティ
    private int menu_id = -1;
    private String menu_name = "";
    private String menu_genre = "";
    private int menu_price = -1;
    private String menu_create = "";
    private String menu_update = "";
    private String menu_des = "";
    private String menu_allergy = "";

    // ゲッター・セッター
    
	public int getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_genre() {
		return menu_genre;
	}
	public void setMenu_genre(String menu_genre) {
		this.menu_genre = menu_genre;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_create() {
		return menu_create;
	}
	public void setMenu_create(String menu_create) {
		this.menu_create = menu_create;
	}
	public String getMenu_update() {
		return menu_update;
	}
	public void setMenu_update(String menu_update) {
		this.menu_update = menu_update;
	}
	public String getMenu_des() {
		return menu_des;
	}
	public void setMenu_des(String menu_des) {
		this.menu_des = menu_des;
	}
	public String getMenu_allergy() {
		return menu_allergy;
	}
	public void setMenu_allergy(String menu_allergy) {
		this.menu_allergy = menu_allergy;
	}
   

}
