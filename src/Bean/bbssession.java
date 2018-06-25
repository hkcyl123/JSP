package Bean;

public class bbssession {
    private int SID;//板块ID
    private String SName;//板块名称
    private int UID;//版主ID
    private int STopicCount;//发帖数

    public int getSID() {
        return SID;
    }

    public void setSID(int SID) {
        this.SID = SID;
    }

    public String getSName() {
        return SName;
    }

    public void setSName(String SName) {
        this.SName = SName;
    }

    public int getUID() {
        return UID;
    }

    public void setUID(int SID) {
        this.SID = SID;
    }

    public int getSTopicCount() {
        return STopicCount;
    }

    public void setSTopicCount(int STopicCount) {
        this.STopicCount = STopicCount;
    }
}
