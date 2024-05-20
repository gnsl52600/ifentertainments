<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<head>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js'></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<input type="submit" id="swalBtn" value="이건 예시버튼1이요"/><br/><br/><br/>
	<input type="button" onclick="deleteBoard()" value="이건 예시버튼2이요" ><br/><br/><br/>
	
	<input type="button" onclick="btn()" value="이건 예시3버튼이요" ><br/><br/><br/>
	
	
	<input type="button" onclick="btn1()" value="이건 예시4버튼이요" ><br/><br/><br/>
	<input type="button" onclick="btn2()" value="이건 예시5버튼이요" ><br/><br/><br/>
	
	
	
</body>

 
<script type="text/javascript">

//그 스위트알러트는 	success v 
//				error x  
//				warning !
//				info i 
//				question ?
//				쓰면 각각의 기호로 나타나게 해줘요 그리고 저희 alert 대신 Swal.fire('타이틀','내용','아이콘')형식으로 해줘야해요
//
$(function(){
	
	var swalBtn=$("#swalBtn");

	
	swalBtn.on("click",function(){
		Swal.fire(
			  '여긴 제목',
			  '스위트 알러트 성공',
			  'success'
			)
	
	});
});
	
///////////////////////////////////////////////////////////////////////////////////////////
	
	
	
function btn()	{

Swal.fire({

	  icon: "success",
	  title: "수정이 완료되었습니다.",
	  showConfirmButton: false,
	  timer: 1500
	});
	
};
/////////////////////////////////////////////////////////////////////////////////////////

//여기는 예ㅣㅅ로 만든 게시물삭제
//Swal.fire({
//		title:'',
//		text:'',
//		icon:''
//	기본 형식은 이렇게 해야됩니다.
//});

function deleteBoard(seq) {
    // 경고창 띄우기
    Swal.fire({
        title: '글을 삭제하시겠습니까?', 
        text: "삭제하시면 다시 복구시킬 수 없습니다.", 
        icon: 'warning', 
        showCancelButton: true, // 취소 버튼 보이도록 설정
        confirmButtonColor: '#3085d6', // 삭제 버튼 색상 설정
        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
        confirmButtonText: '삭제', // 삭제 버튼 텍스트 설정
        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
    }).then((result) => {
        setTimeout(() => {
            Swal.close(); // 일정 시간 후 SweetAlert2 경고창 닫기
        }, 2000); // 2000ms(2초) 후에 경고창 닫기
        if (result.isConfirmed) { 
        	// 삭제 버튼을 눌렀을 때
   
 
            Swal.fire( 
                '게시물 삭제 성공!', 
                '', 
                'success' 
            )
        } else if (result.dismiss === Swal.DismissReason.cancel) { // 취소 버튼을 눌렀을 때
            // "취소" 버튼을 눌렀을 때
            Swal.fire( 
                '작업이 취소되었습니다.', 
                '', 
                'info' 
            )
        }
    });
};


//////////////////////////////////////////////////////////////////////////////////////////

function btn1() {

  
	
    Swal.fire({
        title: "시간경과후 닫히는 알러트", // 제목 설정
        html: "닫히는 시간 <b></b> 초 남았음~~", // b 태그 안에 시간을 넣기위해 설정
        timer: 3000, 
        timerProgressBar: true, // 타이머 진행 바 
        didOpen: () => { // 경고창이 열릴 때 실행되는 콜백 함수
            Swal.showLoading(); // 로딩 아이콘 표시
            var timer = Swal.getPopup().querySelector("b"); // 경고창 내의 b 태그 가져오기
            var endTime = Date.now() + Swal.getTimerLeft(); // 경고창이 닫힐 때까지의 시간 설정
            timerInterval = setInterval(() => { // 100ms마다 실행되는 타이머 설정
                var remain = Math.max(0, endTime - Date.now()); // 남은 시간 계산
                var cho = Math.ceil(remain / 1000); // 초 단위로 시간 변환
                timer.textContent = cho; // 변환된 시간을 b 태그에 표시
            }, 100);
        }
    })
}


//이미지 넣을수있는 
function btn2() {
Swal.fire({
	  title: "이미지",
	  text: "이미지넣을수있는.",
	  imageUrl: "https://unsplash.it/400/200",
	  imageWidth: 400,
	  imageHeight: 200,
	  imageAlt: "Custom image"
	});
}
</script>


</html>
