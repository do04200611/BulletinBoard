package cs.dit;

import java.sql.Date;

public class LoginDto {
    private Integer BCODE;
    private String SUBJECT;
    private String CONTENT;
    private String WRITER;
    private Date REGDATE;

    public Integer getBCODE() {
        return BCODE;
    }

    public void setBCODE(Integer bCODE) {
        BCODE = bCODE;
    }

    public String getSUBJECT() {
        return SUBJECT;
    }

    public void setSUBJECT(String sUBJECT) {
        SUBJECT = sUBJECT;
    }

    public String getCONTENT() {
        return CONTENT;
    }

    public void setCONTENT(String cONTENT) {
        CONTENT = cONTENT;
    }

    public String getWRITER() {
        return WRITER;
    }

    public void setWRITER(String wRITER) {
        WRITER = wRITER;
    }

    public Date getREGDATE() {
        return REGDATE;
    }

    public void setREGDATE(Date REGDATE) {
        REGDATE = REGDATE;
    }

    public LoginDto() {
        // 기본 생성자의 내용 추가 (필요한 경우)
    }

    public LoginDto(String SUBJECT, String CONTENT) {
        this.SUBJECT = SUBJECT;
        this.CONTENT = CONTENT;
    }

    public LoginDto(String SUBJECT, String CONTENT, String WRITER, Date REGDATE) {
        this.SUBJECT = SUBJECT;
        this.CONTENT = CONTENT;
        this.WRITER = WRITER;
        this.REGDATE = REGDATE;
    }
}
