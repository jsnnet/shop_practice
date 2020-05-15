package kr.co.kosmo.mvc.dto;

public class AttendVO {
   private int attid;
   private int mnum;
   private String title;
   private String attdate;
   private String attdatetime;
   private String start, end;
   private Boolean allday = false;

   
   
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public int getAttid() {
      return attid;
   }
   public void setAttid(int attid) {
      this.attid = attid;
   }
   public int getMnum() {
      return mnum;
   }
   public void setMnum(int mnum) {
      this.mnum = mnum;
   }
   public String getAttdate() {
      return attdate;
   }
   public void setAttdate(String attdate) {
      this.attdate = attdate;
   }
   public String getAttdatetime() {
      return attdatetime;
   }
   public void setAttdatetime(String attdatetime) {
      this.attdatetime = attdatetime;
   }

   public String getStart() {
      return start;
   }
   public void setStart(String start) {
      this.start = start;
   }
   public String getEnd() {
      return end;
   }
   public void setEnd(String end) {
      this.end = end;
   }
   public Boolean getAllday() {
      return allday;
   }
   public void setAllday(Boolean allday) {
      this.allday = allday;
   }
   
   
   
}