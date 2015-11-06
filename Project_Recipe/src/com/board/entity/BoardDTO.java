package com.board.entity;

public class BoardDTO extends PagingDTO{
	//join 회원가입
	private int 	num        ;	//회원번호
	private String 	id         ;	//아이디
	private String 	passwd     ;	//암호
	private String 	name       ;	//이름
	private String 	nickname   ;	//별명
	private String 	email      ;	//이메일
	private String 	phone      ;	//연락처
	//board 게시판
	private int		b_num        ;	//글번호
//	private String 	nickname   ;	//별명
	private String 	b_pwd      ;	//글암호
	private String 	b_title    ;	//글제목
	private int 	readcnt    ;	//조회수
	private String 	writeday   ;	//작성일
	private int 	b_like     ;	//추천수
	private String 	thumbnail  ;	//썸네일
	private String 	b_content  ;	//기본내용
	private int		cg_num	   ;	//카테고리분류
	//content 내용
	private int 	c_num      ;	//내용번호
	private String 	content    ;	//상세내용
	private String 	image      ;	//이미지
	//reply 댓글
	private int		r_num      ;	//댓글번호	
	private String 	r_pwd      ;	//댓글암호
	private String 	r_content  ;	//댓글내용
	private String  r_date     ;	//댓글작성일
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getNum() {
		return b_num;
	}
	public void setNum(int num) {
		this.b_num = num;
	}
	public String getB_pwd() {
		return b_pwd;
	}
	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public int getB_like() {
		return b_like;
	}
	public void setB_like(int b_like) {
		this.b_like = b_like;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getR_pwd() {
		return r_pwd;
	}
	public void setR_pwd(String r_pwd) {
		this.r_pwd = r_pwd;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public int getCg_num() {
		return cg_num;
	}
	public void setCg_num(int cg_num) {
		this.cg_num = cg_num;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
}
