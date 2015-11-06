/*chkSubmit(유효성 체크 대상, 메시지 내용) */
function chkSubmit(v_item, v_name){
	if(v_item.val().replace(/\s/g, "")=="") {
		alert(v_name+" 입력해주세요");
		v_item.val("");
		v_item.focus();
		return false;
	}else{
		return true; 
	}
}
function chkFile(item){
	/*
	 * 배열 내의 값을 찾아서 인덱스를 반환합니다. (요소가 없을 경우 -1을 반환).
	 * Jquery.inArray(찾을 값, 검색 대상의 배열)
	 */
	var ext = item.val().split('.').pop().toLowerCase(); 
	if(jQuery.inArray(ext, ['gif','png','jpg','jpeg'])== -1){  //확장자가 이미지 확장자가 아닐 때
//	if($.inArray(ext, ['gif','png','jpg','jpeg'])== -1){  //확장자가 이미지 확장자가 아닐 때
		alert('gif,png,jpg,jpeg 파일만 업로드 할 수 있습니다.');
		return false;
	}else{
		return true;
	}
} 

