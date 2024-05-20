<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<style type="text/css">
.image-container {
    display: flex;
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    height: 100px; /* 부모 요소의 높이를 지정 */
}
.modal .modal-dialog {
    margin-top: 150px; 
}
.addresstable td{
	vertical-align: middle;
	text-align: center;
	padding: 1.5rem;
}
.table_th > th {
	background: #585959 !important;
}
form button {
	border-radius: 10px !important;
}

    
</style>
<!--   <link rel="icon" href="images/fav.png" type="image/png" sizes="16x16">  -->
<%--   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.min.css"> --%>
<%--   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css"> --%>
<%--   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/color.css"> --%>
<%--   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css"> --%>
<!-- </head> -->
<!-- <body> -->
    <div class="col-lg-12">
        <div class="central-meta">
            <h1 class="create-post" style="font-size: 26px !important; line-height: 40px !important;">배송지 관리</h1>
                <table class="table table-responsive-md table-hover">
                    <thead class="thead-dark">
                        <tr class="table_th" style="text-align: center;">
                            <th>배송지명</th>
                            <th>받는사람</th>
                            <th>주소</th>
                            <th>연락처</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" items="${addressList}">
                           <tr data-maNumber="${list.maNumber}" class="addresstable">
                                <td><span>${list.maPlace}</span></td>
                                <td><span>${list.maReciever}</span></td>
                                <td style="text-align: left; padding-left: 40px"><span>(${list.maPostcode})</br> ${list.maAddress1}</br>${list.maAddress2 }</span></td>
                                <td><span>${list.maTelno}</span></td>
                                <td>
								    <div style="display: flex; flex-direction: column; gap: 8px; align-items: center">
								        <c:choose>
								            <c:when test="${list.maDefault == 'Y'}">
								            <div style="display: flex; align-items: center; gap: 10px; justify-content: center;">
											    <div style="display: flex; justify-content: center; background-color: #E6E6FA; border-radius: 10px; padding: 8px 15px;">
											        기본배송지
											    </div>
											    <form action="">
											  <button type="button" class="editButton"  data-toggle="modal" data-target="#shippingAddressModal"
												           data-maPlace="${list.maPlace}" data-maReciever="${list.maReciever}"
													        data-maAddress1="${list.maAddress1}" data-maAddress2="${list.maAddress2}"
													        data-maPostcode="${list.maPostcode}" data-maTelno="${list.maTelno}"
													        data-maNation="${list.maNation}" data-userNo="${list.userNo}">수정</button>
													        <sec:csrfInput/>
											  </form>
											</div>


										</c:when>
								           <c:otherwise>
											    <div style="display: flex; justify-content: space-between;">
												    <form action="" method="post" style="flex-grow: 1; justify-content: space-between;">
												        <input type="hidden" class="maNumber" value="${list.maNumber}" />
												          <button type="button" class="editButton" style="flex: 1; margin-right: 8px;"  data-toggle="modal" data-target="#shippingAddressModal"
												           data-maPlace="${list.maPlace}" data-maReciever="${list.maReciever}"
													        data-maAddress1="${list.maAddress1}" data-maAddress2="${list.maAddress2}"
													        data-maPostcode="${list.maPostcode}" data-maTelno="${list.maTelno}"
													        data-maNation="${list.maNation}" data-userNo="${list.userNo}" data-maNumber="${list.maNumber}">수정</button>
        												  <button type="button" class="deleteButton" style="flex: 1; margin-right: 8px;">삭제</button>
        												  <sec:csrfInput/>
												    </form>
												    <form action="" method="post" style="flex-grow: 2;">
												     <input type="hidden" class="maNumber" value="${list.maNumber}" />
												     <input type="hidden" class="userNo" value="${list.userNo}" />
												        <button type="submit" class="defaultButton" style="width: 100%;">기본배송지로 설정</button>
												        <sec:csrfInput/>
												    </form>
												</div>

											</c:otherwise>

								        </c:choose>
								    </div>
								</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div style="text-align: right; margin-top: 40px;">
                   <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#shippingAddressModal">배송지 등록</a>
                </div>
        </div>
    </div>
		<div class="modal fade" id="shippingAddressModal" tabindex="-1" role="dialog" aria-labelledby="shippingAddressModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="shippingAddressModalLabel">배송지 등록</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<form>
				    <div class="form-group">
				        <label for="maPlace">배송지명</label>
				        <input type="text" class="form-control" id="maPlace" value="${list.maPlace }">
				        <input type="hidden" class="form-control" id="maNumber" value="${list.maNumber }">
				    </div>
				    <div class="form-group">
				        <label for="maReciever">받는사람</label>
				        <input type="text" class="form-control" id="maReciever" value="">
				    </div>
				    <div class="form-group">
				        <label for="maAddress1">주소</label>
				        <input type="text" class="form-control" id="maAddress1">
				        <button type="button" id="findAddress" class="btn btn-primary">주소 검색</button>
				    </div>
				    <div class="form-group">
				        <label for="maPostcode">우편번호</label>
				        <input type="text" class="form-control" id="maPostcode">
				    </div>
				    <div class="form-group">
				        <label for="maAddress2">상세주소</label>
				        <input type="text" class="form-control" id="maAddress2">
				    </div>
				    <div class="form-group">
				        <label for="maTelno">연락처</label>
				        <input type="text" class="form-control" id="maTelno">
				    </div>
				    <div class="form-group">
				        <label for="maNation">국적</label>
				        <select class="form-control maNation" id="maNation">
						  <option value="">국가 선택</option>
						  <c:forEach var="list" items="${nationList }">
						  <option value="${list.nationName }">${list.nationName }</option>
						  </c:forEach>
						</select>
				        <input type="hidden" class="form-control" id="userNo" value="${userNo}">
				    </div>
				    <sec:csrfInput/>
				</form>

		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn cancel" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" id="saveButton">저장</button>
		      </div>
		    </div>
		  </div>
		</div>
<!-- </body> -->
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/main.min.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/userincr.js"></script> --%>
<!-- 	<script src="js/script.js"></script> -->
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		document.getElementById('findAddress').addEventListener('click', function() {
			new daum.Postcode({
		        oncomplete: function(data) {
		            document.getElementById('maPostcode').value = data.zonecode;
		            document.getElementById('maAddress1').value = data.address;
		            document.getElementById('maAddress2').focus();
		        }
		    }).open();
		});
	
	    $('#saveButton').click(function() {
	    	  var action = $('#shippingAddressModal').attr('data-action');
	    	    if (action === 'edit') {
	        	  var maPlace = $('#maPlace').val();
	        	  var maNumber = $('#maNumber').val();
	              var maReciever = $('#maReciever').val();
	              var maAddress1 = $('#maAddress1').val();
	              var maAddress2 = $('#maAddress2').val();
	              var maPostcode = $('#maPostcode').val();
	              var maTelno = $('#maTelno').val();
	              var maNation = $('#maNation').val();
	              var userNo = $('#userNo').val();
	             
	              console.log("maNumber123",maNumber);
	              
	            var formData = {
	            	maNumber:maNumber,
	                maPlace: maPlace,
	                maReciever: maReciever,
	                maAddress1: maAddress1,
	                maAddress2: maAddress2,
	                maPostcode: maPostcode,
	                maTelno: maTelno,
	                maNation: maNation,
	                userNo: userNo
	            };
	            
	            console.log("formData",formData);
	            
	            $.ajax({
	                url: '/goods/address/addressUpdate.do',
	                type: 'POST',
	                contentType: "application/json",
	                data: JSON.stringify(formData),
	                beforeSend: function(xhr){
	                	xhr.setRequestHeader(header, token);
	                },
	                success: function(response) {
	                	$('#shippingAddressModal').modal('hide');
	                    Swal.fire({
	                        icon: "success",
	                        title: "수정이 완료되었습니다.",
	                        showConfirmButton: false,
	                        timer: 1500
	                    }).then((value) => { 
	                        
	                        location.reload();
	                    });
	                },
	                error: function(xhr, status, error) {
	                    swal.fire("실패!", "수정 실패: " + error, "error");
	                }
	            });


	        } else {
	        	
	            var data = {
	                maPlace: $('#maPlace').val(),
	                maReciever: $('#maReciever').val(),
	                maPostcode: $('#maPostcode').val(),
	                maAddress1: $('#maAddress1').val(),
	                maAddress2: $('#maAddress2').val(),
	                maTelno: $('#maTelno').val(),
	                maNation: $('#maNation').val(),
	                userNo: $('#userNo').val()
	            };
	            console.log("data??", data);
	            $.ajax({
	                type: "POST",
	                url: "/goods/address/addressInsert.do",
	                contentType: "application/json",
	                beforeSend: function(xhr){
	                	xhr.setRequestHeader(header, token);
	                },
	                data: JSON.stringify(data),
	                success: function(response) {
	                	 $('#shippingAddressModal').modal('hide');
	                	  Swal.fire({
		                        icon: "success",
		                        title: "등록이 완료되었습니다.",
		                        showConfirmButton: false,
		                        timer: 1500
		                    }).then((value) => { 
		                        location.reload();
		                    });
		                },
	                error: function(xhr, status, error) {
	                    alert("데이터 저장에 실패했습니다.");
	                }
	            });
	        }
	    }); 
	}); 
</script>

<script type="text/javascript">
$(document).ready(function() {
	 var maNumber = '${maNumber}'; 

	    if (maNumber) {
	        $("tr[data-maNumber='" + maNumber + "']").css('border', '2px solid red'); 
	    }
    $('.editButton').click(function(e) {
        e.preventDefault(); 
        
        var action = 'edit'; 
        $('#shippingAddressModal').attr('data-action', action);
        
        if (action === 'edit') {
            $('#shippingAddressModalLabel').text('배송지 수정');
        }
        
        var maPlace = $(this).data('maplace');
        var maNumber = $(this).data('manumber');
        var maReciever = $(this).data('mareciever');
        var maAddress1 = $(this).data('maaddress1');
        var maAddress2 = $(this).data('maaddress2');
        var maPostcode = $(this).data('mapostcode');
        var maTelno = $(this).data('matelno');
        var maNation = $(this).data('manation');
        var userNo = $(this).data('userno');

        // 모달의 입력 필드에 값 설정
        $('#maPlace').val(maPlace);
        $('#maNumber').val(maNumber);
        $('#maReciever').val(maReciever);
        $('#maAddress1').val(maAddress1);
        $('#maAddress2').val(maAddress2);
        $('#maPostcode').val(maPostcode);
        $('#maTelno').val(maTelno);
//         $('.maNation').prop("selected", true);
		let options = $('#maNation option');

		for(let i = 0; i < options.length; i++) {
		    if(options[i].textContent == maNation) {
		        options[i].selected = true;
		        break;
		    }
		}
		
		// Chosen select 업데이트
		$('#maNation').trigger('chosen:updated');

        $('#userNo').val(userNo);
        console.log("maNation",maNation);
    }); 

    $('.deleteButton').click(function(e) {
        e.preventDefault(); 

        Swal.fire({
            title: '삭제하시겠습니까?',
            text: "이 작업은 되돌릴 수 없습니다!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예, 삭제합니다!',
            cancelButtonText: '아니오, 취소합니다!'
        }).then((result) => {
            if (result.isConfirmed) {
                var maNumber = $(this).closest('form').find('.maNumber').val();
                console.log("maNumber2313?", maNumber);
                $.ajax({
                    url: '/goods/address/addressDelete.do',
                    type: 'POST',
                    contentType: "application/json",
                    data: JSON.stringify({maNumber: maNumber}),
                    beforeSend: function(xhr){
                    	xhr.setRequestHeader(header, token);
                    },
                    success: function(response) {
                        Swal.fire({
                            icon: "success",
                            title: "성공적으로 삭제 하였습니다.",
                            showConfirmButton: false,
                            timer: 1500
                        }).then((value) => { 
                            location.reload();
                        });
                    },
                    error: function(xhr, status, error) {
                        Swal.fire({
                            icon: "error",
                            title: "삭제 실패!",
                            text: "문제가 발생했습니다. 다시 시도해 주세요.",
                            confirmButtonText: '확인'
                        });
                    }
                }); 
            }
        });
    });


    
    $('.defaultButton').click(function(e) {
        e.preventDefault(); 

        var maNumber = $(this).closest('form').find('.maNumber').val();
        var userNo = $(this).closest('form').find('.userNo').val();
        console.log("userNo?", userNo);
        $.ajax({
            url: '/goods/address/addressDefault.do',
            type: 'POST',
            contentType: "application/json",
            beforeSend: function(xhr){
            	xhr.setRequestHeader(header, token);
            },
            data: JSON.stringify({maNumber: maNumber, userNo : userNo}),
            success: function(response) {
            	  Swal.fire({
                      icon: "success",
                      title: "기본 배송지로 설정되었습니다.",
                      showConfirmButton: false,
                      timer: 1500
                  }).then((value) => { 
                      location.reload();
                  });
              },
            error: function(xhr, status, error) {
                
            }
        }); 
    }); 

    $(".cancel").click(function(){
        // 모든 입력 필드 초기화
        $("#shippingAddressModal input[type='text']").val('');
        $('#shippingAddressModalLabel').text('배송지 등록');
        // 또는 특정 입력 필드 초기화
        $("#shippingAddressModal .maPlace").val('');
        $("#shippingAddressModal .maReciever").val('');
        $("#shippingAddressModal .maAddress1").val('');
        $("#shippingAddressModal .maAddress2").val('');
        $("#shippingAddressModal .maPostcode").val('');
        $("#shippingAddressModal .maTelno").val('');
        $("#shippingAddressModal .maNation").val('').trigger('chosen:updated'); 
        
        $("#shippingAddressModal").modal('hide');
    }); // cancel click 이벤트 끝

    $('#shippingAddressModal').on('hidden.bs.modal', function (e) {
        $(this).find("input[type='text']").val('');
        $('#shippingAddressModalLabel').text('배송지 등록');
        $(this).find(".maNation").val('').trigger('chosen:updated'); 
    });
}); 
</script>


<!-- </html> -->

	
	
	