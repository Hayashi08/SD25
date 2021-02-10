package bean;

public class TaskBean {
    
    // プロパティ
    private int task_id = -1;
    private int menu_id = -1;
    private int situation_id = -1;
    private String floor_id = "";
    private int task_qty = -1;
    private String task_time = "";
    private String task_comp = "";
    private String task_deploy = "";

    // ゲッター・セッター
    
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public int getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public int getSituation_id() {
		return situation_id;
	}
	public void setSituation_id(int situation_id) {
		this.situation_id = situation_id;
	}
	public String getFloor_id() {
		return floor_id;
	}
	public void setFloor_id(String floor_id) {
		this.floor_id = floor_id;
	}
	public int getTask_qty() {
		return task_qty;
	}
	public void setTask_qty(int task_qty) {
		this.task_qty = task_qty;
	}
	public String getTask_time() {
		return task_time;
	}
	public void setTask_time(String task_time) {
		this.task_time = task_time;
	}
	public String getTask_comp() {
		return task_comp;
	}
	public void setTask_comp(String task_comp) {
		this.task_comp = task_comp;
	}
	public String getTask_deploy() {
		return task_deploy;
	}
	public void setTask_deploy(String task_deploy) {
		this.task_deploy = task_deploy;
	}
   
    
    
   

}
