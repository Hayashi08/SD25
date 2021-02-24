package bean;

public class SituationBean {
    
    private int id = 0;
    private String userId = "";
    private String floorId = "";
    private int qty = 0;
    private String date = "";
    private String start = "";
    private String endSchedule = "";
    private String end = "";
    private String free = "";
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getFloorId() {
        return floorId;
    }
    public void setFloorId(String floorId) {
        this.floorId = floorId;
    }
    public int getQty() {
        return qty;
    }
    public void setQty(int qty) {
        this.qty = qty;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getStart() {
        return start;
    }
    public void setStart(String start) {
        this.start = start;
    }
    public String getEndSchedule() {
        return endSchedule;
    }
    public void setEndSchedule(String endSchedule) {
        this.endSchedule = endSchedule;
    }
    public String getEnd() {
        return end;
    }
    public void setEnd(String end) {
        this.end = end;
    }
    public String getFree() {
        return free;
    }
    public void setFree(String free) {
        this.free = free;
    }

}
