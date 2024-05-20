<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content-area">
                <div class="sub-bar">
                  <div class="sub-title">
                    <h4>Dashboard:</h4>
                    <span>Welcome To web Admin Panel!</span>
                  </div>
                  <ul class="bread-crumb">
                    <li><a href="#" title="">Home</a></li>
                    <li>Dashbord</li>
                  </ul>
                </div>
                <div class="gap no-gap">
                  <div class="inner-bg">
                    <div class="element-title">
                      <h4>Your Cart (4 items) <span>Project Management System!</span></h4>
                    </div>
                    <div class="cart-page">
                      <table class="cart-table table table-responsive">
                     
                        <tbody>
                          <tr>
                            <td>그룹명</td>
                            <td>${profile.agName}</td>
                          </tr>
                          <tr>
                            <td>데뷔일</td>
                            <td>${profile.agDate}</td>
                          </tr>
                    
						  <tr>
						    <td>멤버</td>
						    <td>
						    <c:forEach var="list" items="${artistList}">
						    페이크네임: ${list.artistFakename}, 데뷔일: ${list.artistBirth}<br/>
						  </c:forEach>  
						    </td>
						  </tr>
                          <tr>
                            <td>그룹소개</td>
                            <td>${profile.agIntro}</td>
                          </tr>
                             <tr>
                           <td>그룹 이미지</td>
							    <td>
							      <div class="prodthumimg-box">
							        <c:choose>
							          <c:when test="${fn:contains(profile.agProfile, 'http')}">
							            <img id="thumimg" src="${profile.agProfile}" alt="" class="profile-img">
							          </c:when>
							          <c:otherwise>
							            <img id="thumimg" src="${pageContext.request.contextPath}/resources/upload/group/${artist.agProfile}" alt="" class="profile-img">
							          </c:otherwise>
							        </c:choose>
							      </div>
							    </td>
							  </tr>
							 <tr>
								  <td>멤버 이미지</td>
								  <td>
								    <div class="prodthumimg-box" style="display: flex;">
								      <c:forEach var="list" items="${artistList}">
								        <c:choose>
								          <c:when test="${fn:contains(list.userProfile, 'http')}">
								            <!-- 외부 URL인 경우 -->
								            <img src="${list.userProfile}" alt="" class="profile-img" style="margin-right: 55px;">
								          </c:when>
								          <c:otherwise>
								            <!-- 내부 경로인 경우 -->
								            <img src="${pageContext.request.contextPath}/resources/upload/group/${list.userProfile}" alt="" class="profile-img" style="margin-right: 5px;">
								          </c:otherwise>
								        </c:choose>
								      </c:forEach>
								    </div>
								  </td>
								</tr>
							</tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
                <div class="buttonz">
				  <form action="/entertain/artist/profile/updateForm.do" method="get">
				    <input type="hidden" name="agId" id="agId" value="${profile.agId}">
				    <button type="submit" id="modBtn" name="modBtn" value="${name}">수정하기</button>
				    <sec:csrfInput/>
				  </form>
				</div>
</body>


</html>