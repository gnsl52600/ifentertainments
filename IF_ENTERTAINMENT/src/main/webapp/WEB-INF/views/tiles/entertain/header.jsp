<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">		

/* 호버 동그라미 */
.top-area > ul > li > a::before, .top-area .main-menu:before {
   background: rgba(100, 100, 100, 0.15) none repeat scroll 0 0;
   border-radius: 100%;
   content: "";
   height: 40px;
   left: 50%;
   position: absolute;
   top: 50%;
   transition: all 0.2s linear 0s;
   width: 40px;
   z-index: -1;
}

@font-face {
    font-family: 'LOTTERIACHAB';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/LOTTERIACHAB.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
	font-family: 'GmarketSansMedium', sans-serif;
}

.top_headerbar {
	position: relative;
	height: 90px;
	background-color: #fff;
}

* {
	cursor: url(https://cur.cursors-4u.net/symbols/sym-7/sym646.ani),
		url(https://cur.cursors-4u.net/symbols/sym-7/sym646.gif), auto
		!important;
}

.nav_menu_bar .nav_menu span {
	color: #b9b9b9;
	width: 100%;
	font-size: 21px;
	transition: color 0.3s;
}

.nav_menu_bar .nav_menu span:hover, .nav_menu_bar .nav_menu span:focus {
	color: black;
}

.topbar {
    box-shadow: none;
}

.detailFooterbar {
    height: 100px;
    color: #000;
    background-color: #fff; 
}

/* 번역부분 */
 .VIpgJd-ZVi9od-ORHb {
        display: none;
} 
.goog-te-gadget {
/* 텍스트 숨기기 */
color: transparent !important;
}
.VIpgJd-ZVi9od-l4eHX-hSRGPd {
    display: none;
}
.skiptranslate{
	display: flex;
}
#goog-gt-tt{
	display: none;
}
.goog-te-combo {
	padding-top: 9px !important;
 	border: none;
 	font-size: 22px;
 	color: #b9b9b9;
 	font-weight: 600;
}
.VIpgJd-ZVi9od-ORHb {
    display: none !important; /* 툴바를 숨깁니다 */
}
</style>	

<!-- topbar 시작 -->
		<div class="topbar stick top_headerbar">
<!-- 			<div class="logo top_logo">
				<a title="" href="/"><img src="images/main/폰트동일 로고.png" alt="logo"></a>
			</div> -->
			<div class="top-area" style="width:100%;">
				<ul class="setting-area float-left nav_menu_bar" style="width:100%; margin-left: 210px;">
					
				<a title="" href="/">
				<span class="notranslate" style="font-family: 'GmarketSansMedium'; color: black; font-size: 30px; font-weight: bold; letter-spacing: 1.5px;">
				If entertainment
				</span>
				</a>
					
					<li style="margin-left: 80px;">
						<a href="/entertain/company/info.do" title="Home" data-ripple="" class="nav_menu">
							<span class="notranslate">COMPANY</span>
						</a>
						<div class="dropdowns nav_2depth">
							<ul class="drops-menu nav_2depth_menu">
								<li>
									<div class="mesg-meta">
										<h6><a href="/entertain/company/info.do" title="">기업소개</a></h6>
									</div>
								</li>
								<li>
									<div class="mesg-meta">
										<h6><a href="/entertain/company/history.do" title="">연혁</a></h6>
									</div>
								</li>
								<li>
									<div class="mesg-meta">
										<h6><a href="/entertain/company/news/userlist.do" title="">기업소식</a></h6>
									</div>
								</li>
								<li>
									<div class="mesg-meta">
										<h6><a href="/entertain/company/visit.do" title="">찾아오는 길</a></h6>
									</div>
								</li>
							</ul>
						</div>
					</li>
					<li style="margin-left: 40px;">
						<a href="" title="INVESTORS" data-ripple="" class="nav_menu">
							<span class="notranslate">INVESTORS</span>
						</a>
						<div class="dropdowns nav_2depth">
							<ul class="drops-menu nav_2depth_menu">
								<li>
									<div class="mesg-meta">
										<h6><a href="/entertain/irFile/list.do" title="">IR 자료실</a></h6>
									</div>
								</li>
								<li>
									<div class="mesg-meta">
										<h6><a href="/entertain/ir/userlist.do" title="">IR 행사일정</a></h6>
									</div>
								</li>
								<li>
									<div class="mesg-meta">
										<h6><a href="/entertain/stock/info.do" title="">주가 정보</a></h6>
									</div>
								</li>
								<li>
									<div class="mesg-meta">
										<h6><a href="/entertain/finance/finance.do" title="">재무정보</a></h6>
									</div>
								</li>
							</ul>
						</div>
					</li>
					<li style="margin-left: 40px;">
						<a href="#" data-ripple="" class="nav_menu">
							<span onclick="javascript:location.href='/entertain/artist/profile/artistList.do'" class="notranslate">ARTISTS</span>
						</a>
					</li>
					<li style="margin-left: 40px;">
						<a href="#" title="NOTICE" data-ripple="" class="nav_menu">
							<span onclick="javascript:location.href='/entertain/company/notice/userlist.do'" class="notranslate">NOTICE</span>
						</a>
					</li>
					<li style="margin-left: 40px;">
						<a href="#" title="AUDITION" data-ripple="" class="nav_menu">
							<span class="notranslate">AUDITION</span>
						</a>
						<div class="dropdowns nav_2depth">
							<ul class="drops-menu nav_2depth_menu">
								<li>
									<div class="mesg-meta">
										<h6><a href="/entertain/audition/scheduleList.do" title="">오디션일정확인</a></h6>
									</div>
								</li>
								<li>
									<div class="mesg-meta">
										<h6><a href="/entertain/audition/auditionSupportGuide.do" title="">지원하기</a></h6>
									</div>
								</li>
								<li>
									<div class="mesg-meta">
										<h6><a href="/entertain/audition/auditionSupportCheckForm.do" title="">지원내역확인</a></h6>
									</div>
								</li>
							</ul>
						</div>
					</li>
				</ul>
				<ul class="setting-area float-left nav_menu_bar nav_language">
					<li class="">
						<!-- <div id="google_translate_element" class="hd_lang">
							<a href="#" title="LANGUAGE" data-ripple="" class="nav_menu nav_menu_language">
								<span>KOR</span>
							</a>
							<div class="dropdowns nav_2depth">
								<ul class="drops-menu nav_2depth_menu">
									<li>
										<div class="mesg-meta">
											<h6><a href="#" title="">ENG</a></h6>
										</div>
									</li>
									<li>
										<div class="mesg-meta">
											<h6><a href="#" title="">CHN</a></h6>
										</div>
									</li>
									<li>
										<div class="mesg-meta">
											<h6><a href="#" title="">JPN</a></h6>
										</div>
									</li>
								</ul>
							</div>
						</div> -->	
						<div id="google_translate_element" class="hd_lang"></div>
					</li>
				</ul>
			</div>
		</div>
		<!-- topbar 끝 -->
		
<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    // 페이지가 로드되면 실행될 코드
    var googleTranslateElement = document.querySelector('.VIpgJd-ZVi9od-ORHb');
    if (googleTranslateElement) {
        googleTranslateElement.style.display = 'none';
    }
});
//번역부분
function hideGoogleTranslateToolbar() {
    var googleTranslateElement = document.querySelector('.goog-te-banner-frame.skiptranslate');
    if (googleTranslateElement) {
        googleTranslateElement.style.display = 'none';
    }
}
function googleTranslateElementInit() {
    new google.translate.TranslateElement({
        pageLanguage: 'ko',
        includedLanguages: 'en,ja,ko,zh-CN,zh-TW',
        //layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
        autoDisplay: false
    }, 'google_translate_element');
}


//<![CDATA[
var colour="random"; // in addition to "random" can be set to any valid colour eg "#f0f" or "red"
var sparkles=50;

/****************************
*  Tinkerbell Magic Sparkle *
*(c)2005-13 mf2fm web-design*
*  http://www.mf2fm.com/rv  *
* DON'T EDIT BELOW THIS BOX *
****************************/
var x=ox=400;
var y=oy=300;
var swide=800;
var shigh=600;
var sleft=sdown=0;
var tiny=new Array();
var star=new Array();
var starv=new Array();
var starx=new Array();
var stary=new Array();
var tinyx=new Array();
var tinyy=new Array();
var tinyv=new Array();

window.onload=function() { if (document.getElementById) {
  var i, rats, rlef, rdow;
  for (var i=0; i<sparkles; i++) {
    var rats=createDiv(3, 3);
    rats.style.visibility="hidden";
    rats.style.zIndex="999";
    document.body.appendChild(tiny[i]=rats);
    starv[i]=0;
    tinyv[i]=0;
    var rats=createDiv(5, 5);
    rats.style.backgroundColor="transparent";
    rats.style.visibility="hidden";
    rats.style.zIndex="999";
    var rlef=createDiv(1, 5);
    var rdow=createDiv(5, 1);
    rats.appendChild(rlef);
    rats.appendChild(rdow);
    rlef.style.top="2px";
    rlef.style.left="0px";
    rdow.style.top="0px";
    rdow.style.left="2px";
    document.body.appendChild(star[i]=rats);
  }
  set_width();
  sparkle();
}}

function sparkle() {
  var c;
  if (Math.abs(x-ox)>1 || Math.abs(y-oy)>1) {
    ox=x;
    oy=y;
    for (c=0; c<sparkles; c++) if (!starv[c]) {
      star[c].style.left=(starx[c]=x)+"px";
      star[c].style.top=(stary[c]=y+1)+"px";
      star[c].style.clip="rect(0px, 5px, 5px, 0px)";
      star[c].childNodes[0].style.backgroundColor=star[c].childNodes[1].style.backgroundColor=(colour=="random")?newColour():colour;
      star[c].style.visibility="visible";
      starv[c]=50;
      break;
    }
  }
  for (c=0; c<sparkles; c++) {
    if (starv[c]) update_star(c);
    if (tinyv[c]) update_tiny(c);
  }
  setTimeout("sparkle()", 40);
}

function update_star(i) {
  if (--starv[i]==25) star[i].style.clip="rect(1px, 4px, 4px, 1px)";
  if (starv[i]) {
    stary[i]+=1+Math.random()*3;
    starx[i]+=(i%5-2)/5;
    if (stary[i]<shigh+sdown) {
      star[i].style.top=stary[i]+"px";
      star[i].style.left=starx[i]+"px";
    }
    else {
      star[i].style.visibility="hidden";
      starv[i]=0;
      return;
    }
  }
  else {
    tinyv[i]=50;
    tiny[i].style.top=(tinyy[i]=stary[i])+"px";
    tiny[i].style.left=(tinyx[i]=starx[i])+"px";
    tiny[i].style.width="2px";
    tiny[i].style.height="2px";
    tiny[i].style.backgroundColor=star[i].childNodes[0].style.backgroundColor;
    star[i].style.visibility="hidden";
    tiny[i].style.visibility="visible"
  }
}

function update_tiny(i) {
  if (--tinyv[i]==25) {
    tiny[i].style.width="1px";
    tiny[i].style.height="1px";
  }
  if (tinyv[i]) {
    tinyy[i]+=1+Math.random()*3;
    tinyx[i]+=(i%5-2)/5;
    if (tinyy[i]<shigh+sdown) {
      tiny[i].style.top=tinyy[i]+"px";
      tiny[i].style.left=tinyx[i]+"px";
    }
    else {
      tiny[i].style.visibility="hidden";
      tinyv[i]=0;
      return;
    }
  }
  else tiny[i].style.visibility="hidden";
}

document.onmousemove=mouse;
function mouse(e) {
  if (e) {
    y=e.pageY;
    x=e.pageX;
  }
  else {
    set_scroll();
    y=event.y+sdown;
    x=event.x+sleft;
  }
}

window.onscroll=set_scroll;
function set_scroll() {
  if (typeof(self.pageYOffset)=='number') {
    sdown=self.pageYOffset;
    sleft=self.pageXOffset;
  }
  else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
    sdown=document.body.scrollTop;
    sleft=document.body.scrollLeft;
  }
  else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
    sleft=document.documentElement.scrollLeft;
    sdown=document.documentElement.scrollTop;
  }
  else {
    sdown=0;
    sleft=0;
  }
}

window.onresize=set_width;
function set_width() {
  var sw_min=999999;
  var sh_min=999999;
  if (document.documentElement && document.documentElement.clientWidth) {
    if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
    if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
  }
  if (typeof(self.innerWidth)=='number' && self.innerWidth) {
    if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
    if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
  }
  if (document.body.clientWidth) {
    if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
    if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
  }
  if (sw_min==999999 || sh_min==999999) {
    sw_min=800;
    sh_min=600;
  }
  swide=sw_min;
  shigh=sh_min;
}

function createDiv(height, width) {
  var div=document.createElement("div");
  div.style.position="absolute";
  div.style.height=height+"px";
  div.style.width=width+"px";
  div.style.overflow="hidden";
  return (div);
}

function newColour() {
  var c=new Array();
  c[0]=255;
  c[1]=Math.floor(Math.random()*256);
  c[2]=Math.floor(Math.random()*(256-c[1]/2));
  c.sort(function(){return (0.5 - Math.random());});
  return ("rgb("+c[0]+", "+c[1]+", "+c[2]+")");
}
// ]]>

// $(function () {
// 	setTimeout(() => {
// 		$(".VIpgJd-ZVi9od-ORHb").css("visibility", "hidden");
// 	}, 500);
// });
</script>