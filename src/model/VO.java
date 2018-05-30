package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class VO {

	Integer chid, head, id, total, correction, cnt, save, ox, orid, gid, seq, lev, rec;
	String question, answer, pname, title, content, pid, input, kind, pw, upfile;
	Date reg_date;

	//문제 선택지 -quiz 테이블에 추가됨
	String s1, s2, s3, s4, s5;

	//챕터 이름 -chname 테이블에 추가됨
	String chname;

	//reg_date 를 테스트하기 위해 필요한 부분.
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		

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
				+ ", pw=" + pw + ", upfile=" + upfile + ", reg_date=" + reg_date + ", s1=" + s1 + ", s2=" + s2 + ", s3="
				+ s3 + ", s4=" + s4 + ", s5=" + s5 + ", chname=" + chname + ", sdf=" + sdf + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((answer == null) ? 0 : answer.hashCode());
		result = prime * result + ((chid == null) ? 0 : chid.hashCode());
		result = prime * result + ((chname == null) ? 0 : chname.hashCode());
		result = prime * result + ((cnt == null) ? 0 : cnt.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((correction == null) ? 0 : correction.hashCode());
		result = prime * result + ((gid == null) ? 0 : gid.hashCode());
		result = prime * result + ((head == null) ? 0 : head.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((input == null) ? 0 : input.hashCode());
		result = prime * result + ((kind == null) ? 0 : kind.hashCode());
		result = prime * result + ((lev == null) ? 0 : lev.hashCode());
		result = prime * result + ((orid == null) ? 0 : orid.hashCode());
		result = prime * result + ((ox == null) ? 0 : ox.hashCode());
		result = prime * result + ((pid == null) ? 0 : pid.hashCode());
		result = prime * result + ((pname == null) ? 0 : pname.hashCode());
		result = prime * result + ((pw == null) ? 0 : pw.hashCode());
		result = prime * result + ((question == null) ? 0 : question.hashCode());
		result = prime * result + ((rec == null) ? 0 : rec.hashCode());
		result = prime * result + ((reg_date == null) ? 0 : reg_date.hashCode());
		result = prime * result + ((s1 == null) ? 0 : s1.hashCode());
		result = prime * result + ((s2 == null) ? 0 : s2.hashCode());
		result = prime * result + ((s3 == null) ? 0 : s3.hashCode());
		result = prime * result + ((s4 == null) ? 0 : s4.hashCode());
		result = prime * result + ((s5 == null) ? 0 : s5.hashCode());
		result = prime * result + ((save == null) ? 0 : save.hashCode());
		result = prime * result + ((sdf == null) ? 0 : sdf.hashCode());
		result = prime * result + ((seq == null) ? 0 : seq.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((total == null) ? 0 : total.hashCode());
		result = prime * result + ((upfile == null) ? 0 : upfile.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		VO other = (VO) obj;
		if (answer == null) {
			if (other.answer != null)
				return false;
		} else if (!answer.equals(other.answer))
			return false;
		if (chid == null) {
			if (other.chid != null)
				return false;
		} else if (!chid.equals(other.chid))
			return false;
		if (chname == null) {
			if (other.chname != null)
				return false;
		} else if (!chname.equals(other.chname))
			return false;
		if (cnt == null) {
			if (other.cnt != null)
				return false;
		} else if (!cnt.equals(other.cnt))
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (correction == null) {
			if (other.correction != null)
				return false;
		} else if (!correction.equals(other.correction))
			return false;
		if (gid == null) {
			if (other.gid != null)
				return false;
		} else if (!gid.equals(other.gid))
			return false;
		if (head == null) {
			if (other.head != null)
				return false;
		} else if (!head.equals(other.head))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (input == null) {
			if (other.input != null)
				return false;
		} else if (!input.equals(other.input))
			return false;
		if (kind == null) {
			if (other.kind != null)
				return false;
		} else if (!kind.equals(other.kind))
			return false;
		if (lev == null) {
			if (other.lev != null)
				return false;
		} else if (!lev.equals(other.lev))
			return false;
		if (orid == null) {
			if (other.orid != null)
				return false;
		} else if (!orid.equals(other.orid))
			return false;
		if (ox == null) {
			if (other.ox != null)
				return false;
		} else if (!ox.equals(other.ox))
			return false;
		if (pid == null) {
			if (other.pid != null)
				return false;
		} else if (!pid.equals(other.pid))
			return false;
		if (pname == null) {
			if (other.pname != null)
				return false;
		} else if (!pname.equals(other.pname))
			return false;
		if (pw == null) {
			if (other.pw != null)
				return false;
		} else if (!pw.equals(other.pw))
			return false;
		if (question == null) {
			if (other.question != null)
				return false;
		} else if (!question.equals(other.question))
			return false;
		if (rec == null) {
			if (other.rec != null)
				return false;
		} else if (!rec.equals(other.rec))
			return false;
		
		
		if (reg_date == null) {
			if (other.reg_date != null)
				return false;
		} else if (!sdf.format(reg_date).equals(sdf.format(other.reg_date)))
			return false;
		
		
		
		if (s1 == null) {
			if (other.s1 != null)
				return false;
		} else if (!s1.equals(other.s1))
			return false;
		if (s2 == null) {
			if (other.s2 != null)
				return false;
		} else if (!s2.equals(other.s2))
			return false;
		if (s3 == null) {
			if (other.s3 != null)
				return false;
		} else if (!s3.equals(other.s3))
			return false;
		if (s4 == null) {
			if (other.s4 != null)
				return false;
		} else if (!s4.equals(other.s4))
			return false;
		if (s5 == null) {
			if (other.s5 != null)
				return false;
		} else if (!s5.equals(other.s5))
			return false;
		if (save == null) {
			if (other.save != null)
				return false;
		} else if (!save.equals(other.save))
			return false;
		if (sdf == null) {
			if (other.sdf != null)
				return false;
		} else if (!sdf.equals(other.sdf))
			return false;
		if (seq == null) {
			if (other.seq != null)
				return false;
		} else if (!seq.equals(other.seq))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (total == null) {
			if (other.total != null)
				return false;
		} else if (!total.equals(other.total))
			return false;
		if (upfile == null) {
			if (other.upfile != null)
				return false;
		} else if (!upfile.equals(other.upfile))
			return false;
		return true;
	}
}
