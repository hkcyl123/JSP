package Bean;

import java.util.Date;

public class bbstopic {
    private int TID;//发帖表ID
    private int SID;//板块ID
    private int UID;//发帖人ID
    private String UName;
    private String ReplyCount;//回复数
    private String Topic;//标题
    private String TCountents;//正文
    private String TTime;//时间

    public int getTID() {
        return TID;
    }

    public String getUName() {
        return UName;
    }

    public void setUName(String UName) {
        this.UName = UName;
    }

    public void setTID(int TID) {
        this.TID = TID;
    }

    public int getSID() {
        return SID;
    }

    public void setSID(int SID) {
        this.SID = SID;
    }

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public String getReplyCount() {
        return ReplyCount;
    }

    public void setReplyCount(String replyCount) {
        ReplyCount = replyCount;
    }

    public String getTopic() {
        return Topic;
    }

    public void setTopic(String topic) {
        Topic = topic;
    }

    public String getTCountents() {
        return TCountents;
    }

    public void setTCountents(String TCountents) {
        this.TCountents = TCountents;
    }

    public String getTTime() {
        return TTime;
    }

    public void setTTime(String TTime) {
        this.TTime = TTime;
    }
}
