package model;

import java.util.Date;

public class VO {

	Integer chid, head, id, total, correction, cnt, save, ox, orid, gid, seq, lev, rec;
	String question, answer, pname, title, content, pid, input, kind, pw, upfile;
	Date reg_date;

	//문제 선택지 -quiz 테이블에 추가됨
	String s1, s2, s3, s4, s5;

	//챕터 이름 -chname 테이블에 추가됨
	String chname;


	public String getChname() {
		return chname;
	}
	public void setChname(String chname) {
		this.chname = chname;
	}
	public String getS1() {
		return s1;
	}
	public void setS1(String s1) {
		this.s1 = s1;
	}
	public String getS2() {
		return s2;
	}
	public void setS2(String s2) {
		this.s2 = s2;
	}
	public String getS3() {
		return s3;
	}
	public void setS3(String s3) {
		this.s3 = s3;
	}
	public String getS4() {
		return s4;
	}
	public void setS4(String s4) {
		this.s4 = s4;
	}
	public String getS5() {
		return s5;
	}
	public void setS5(String s5) {
		this.s5 = s5;
	}

	public Integer getHead() {

		return head;
	}
	public void setHead(Integer head) {
		this.head = head;
	}
	public String getUpfile() {
		if(upfile == null || upfile.equals("")) {
			upfile = "";
		}
		return upfile;
	}
	public void setUpfile(String upfile) {
		this.upfile = upfile;
	}
	public Integer getChid() {
		return chid;
	}
	public void setChid(Integer chid) {
		this.chid = chid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getCorrection() {
		return correction;
	}
	public void setCorrection(Integer correction) {
		this.correction = correction;
	}
	public Integer getCnt() {
		return cnt;
	}
	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}
	public Integer getSave() {
		return save;
	}
	public void setSave(Integer save) {
		this.save = save;
	}
	public Integer getOx() {
		return ox;
	}
	public void setOx(Integer ox) {
		this.ox = ox;
	}
	public Integer getOrid() {
		return orid;
	}
	public void setOrid(Integer orid) {
		this.orid = orid;
	}
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public Integer getLev() {
		return lev;
	}
	public void setLev(Integer lev) {
		this.lev = lev;
	}
	public Integer getRec() {
		return rec;
	}
	public void setRec(Integer rec) {
		this.rec = rec;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}


	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getInput() {

		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "VO [chid=" + chid + ", head=" + head + ", id=" + id + ", total=" + total + ", correction=" + correction
				+ ", cnt=" + cnt + ", save=" + save + ", ox=" + ox + ", orid=" + orid + ", gid=" + gid + ", seq=" + seq
				+ ", lev=" + lev + ", rec=" + rec + ", question=" + question + ", answer=" + answer + ", pname=" + pname
				+ ", title=" + title + ", content=" + content + ", pid=" + pid + ", input=" + input + ", kind=" + kind
				+ ", pw=" + pw + ", upfile=" + upfile + ", reg_date=" + reg_date + "]";
	}



}