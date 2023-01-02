<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<title>여행지도 | 대한민국 구석구석</title>
	<link rel="shortcut icon" type="image/x-icon" href="/resources/images/favicon.ico"><!-- 0904 파비콘 추가 -->
	<link rel="stylesheet" type="text/css" href="/resources/css/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css?v=20190404001" />
	<link rel="stylesheet" type="text/css" href="/resources/css/location.css?v=20221028001" />
	<link rel="stylesheet" type="text/css" href="../resources/css/rangeslider.css">
	<script src="/resources/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=44732c3ca5b90a4f1f49c6b38df023d1&libraries=services,clusterer,drawing"></script>
	<script src="/resources/js/common.js?v=20190404001"></script>
	<script src="/resources/js/global.js?v=20221028001"></script>
	<script src="/resources/js/cupertino-pane.min.js"></script>
	<script src="/resources/js/textsvg.js"></script>
	<script src="/resources/js/mylocation/location_default.js?v=20221028001"></script>
	<script src="/resources/js/mylocation/location_content.js?v=20220623001"></script>
	<script src="/resources/js/mylocation/location_course.js?v=20220623001"></script>
	<script src="/resources/js/mylocation/location_theme.js?v=20220623001"></script>
	<script src="/resources/js/mylocation/location_mytravel.js?v=20220623001"></script>
	<script src="/resources/js/mylocation/location_coord.js?v=20220623001"></script>
	<script src="/resources/js/swiper.min.js"></script>
	<script src="../resources/js/jquery.cookie.js"></script>
	<script src="../resources/js/rangeslider.min.js"></script>
	<script src="../resources/js/sigunguCode.js"></script>
	<script src="../resources/js/travelcastdata.js"></script>

	<script src="../resources/js/kakao.min.js"></script>
	<!--[if lt IE 9]>
	<script src="/resources/js/html5shiv.js"></script>
	<![endif]-->
	


<script src="https://www.googleoptimize.com/optimize.js?id=OPT-5JVS3BG"></script>
<script src="https://www.googleoptimize.com/optimize.js?id=OPT-NQVD2Q2"></script>
<script src="https://cdn.visitkorea.or.kr/resources/js/cdp/web/sphereAnalytics.min.js?v=1c693f70-f00f-4656-b7f7-581fce084ac8"></script>

<script type="text/javascript">
   SphereAnalytics.setLogLevel("info");
   let sphereAs_options  = new Object();
   sphereAs_options.webMsg = true; 

   SphereAnalytics.init(
		   'qsJfZhE2Ft85SvZnBo2KSL', sphereAs_options
   );
</script>

<script type="text/javascript">

var otd_nm = "";
if( appYn == 'N') {
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-92880258-1', 'auto');
		ga('require', 'displayfeatures');

        otd_nm = "";
        ga('set', 'dimension5', otd_nm);
} else {
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-92878657-1', 'auto');
		ga('require', 'displayfeatures');
		ga('send', 'pageview');
        otd_nm = "";
        ga('set', 'dimension5', otd_nm);
}
var custInfo = {
		uuid : null, //SNS_ID
		loginYn : 'N', //로그인여부
		firstYn : 'N', //최초로그인여부
		gender : 'null', //성별
		grade : 'null', //여행구독레벨
		birthYr : 0, //생년월일
		rsdeNm : 'null', //거주지명
		favoriteCnt : null, //즐겨찾기수
		commentCnt : null, //댓글수
		joinYmd : null, //가입일
	    channel : null, //SNS채널구분
	    device : appYn == 'Y' ? device : mobileYn == 'Y' ? 'mobileweb' : 'pcweb', //device 구분
	    cardAreaNm : null //digitcard area Name
}
</script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-LYY1LJZCC4"></script>
<script type="text/javascript" charset="UTF-8">
  window.dataLayer = window.dataLayer || [];
 
  dataLayer.push({
	 'event': 'login',
	 'user_id': custInfo.uuid,         //기본페이지뷰 시 호출되는 uuid값 활용
	 'first_login': custInfo.firstYn,  //기본페이지뷰 시 호출되는 firstYn값 활용
	 'gender_div': custInfo.gender,    //기본페이지뷰 시 호출되는 gender값 활용
	 'birth_year': custInfo.birthYr,   //기본페이지뷰 시 호출되는 birthYr값 활용
	 'city_name': custInfo.rsdeNm,     //기본페이지뷰 시 호출되는 rsdeNm값 활용
	 'join_date': custInfo.joinYmd,    //기본페이지뷰 시 호출되는 joinYmd값 활용
	 'method': custInfo.channel,        //기본페이지뷰 시 호출되는 channel값 활용
	 
	 'dimension7': custInfo.uuid, 
	 'dimension8': custInfo.joinYmd, 
	 'dimension9': custInfo.loginYn, 
	 'dimension10': custInfo.channel, 
	 'dimension11': custInfo.device, 
  });
  
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

    gtag('config', 'G-LYY1LJZCC4', {
    	
     otd_nm : ""
    });


</script>

<!-- Google Tag Manager -->
<script>

 if(getParameter('cotId') == '50fbcf94-4917-489a-9c74-1b0255e2effd'
         || getParameter('cotId') == '7cf76837-65e6-47f0-a99a-e114c4cdcecf'
         || getParameter('cotId') == 'e34bd25c-5a92-43e1-9cd2-5b65974d777d'
         || getParameter('cotId') == '35b0b18a-5eb2-4bec-a0f4-2f4d91681a42') {
 } else if (appYn == null || appYn != 'Y') {
	(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-PJVBVKB');
 }
</script>
<!-- End Google Tag Manager -->








<!-- Facebook Pixel Code -->
<!--
<script>

 if(getParameter('cotId') == '50fbcf94-4917-489a-9c74-1b0255e2effd'
         || getParameter('cotId') == '7cf76837-65e6-47f0-a99a-e114c4cdcecf'
         || getParameter('cotId') == 'e34bd25c-5a92-43e1-9cd2-5b65974d777d'
         || getParameter('cotId') == '35b0b18a-5eb2-4bec-a0f4-2f4d91681a42') {
 } else{
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
          n.callMethod.apply(n,arguments):n.queue.push(arguments)};
   if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
   n.queue=[];t=b.createElement(e);t.async=!0;
   t.src=v;s=b.getElementsByTagName(e)[0];
   s.parentNode.insertBefore(t,s)}(window, document,'script',
          'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '2686987211544937');
  fbq('track', 'PageView');
 }


</script>
-->
<!-- End Facebook Pixel Code -->

<!-- Facebook Pixel Code Start 2021-02-16-->
<!--
<script>
 if(getParameter('cotId') == '50fbcf94-4917-489a-9c74-1b0255e2effd'
         || getParameter('cotId') == '7cf76837-65e6-47f0-a99a-e114c4cdcecf'
         || getParameter('cotId') == 'e34bd25c-5a92-43e1-9cd2-5b65974d777d'
         || getParameter('cotId') == '35b0b18a-5eb2-4bec-a0f4-2f4d91681a42') {
 } else{
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '748419839116592');
  fbq('track', 'PageView');
 }
</script>
-->
<!-- End Facebook Pixel Code -->
<meta name="referrer" content="unsafe-url">

<!-- End Facebook Pixel Code -->
	<style>
		.wrap_layerpop {
			z-index: 201;
		}


		body {
			overscroll-behavior: none;
			overflow: hidden;
		}

		#location_header{
			z-index: 201;
		}
	</style>
</head>
<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PJVBVKB"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Facebook Pixel Code -->



<!-- End Facebook Pixel Code -->

<!-- Facebook Pixel Code Start 2021-02-16-->



<!-- End Facebook Pixel Code -->
<script type="text/javascript">
	Kakao.init('44732c3ca5b90a4f1f49c6b38df023d1');
</script>
<!-- 0604 수정 -->
<!-- skip -->
<div id="skipToContent">
	<a href="#map">본문 바로가기</a>
	<!--<a href="#btnMenu">주메뉴 바로가기</a>-->
</div>
<!-- // skip -->
<!-- // 0604 수정 -->

<header id="location_header" class="main_gnb sub map">
</header>
<div id="contents">
	<div class="map_area" id="map" style="z-index: 0;">
	</div>

	<div class="toast_message on">
	</div>

	<div class="map_cont_wrap" style="display: none;">
		<div class="pc_cont">
			<!-- depth1 -->
			<div class="pc_depth1">
				<div class="map_menu">
					<strong class="stit_area"></strong>
					<ul class="tab">
						<li label="tour"><a href="javascript:;" onclick="CategoryChange(this,1);" class="icon1">주변 여행지</a></li>
						<li label="food"><a href="javascript:;" onclick="CategoryChange(this,2);" class="icon2">음식점</a></li>
						<li label="cafe"><a href="javascript:;" onclick="CategoryChange(this,3);" class="icon3">카페</a></li>
						<li label="hotel"><a href="javascript:;" onclick="CategoryChange(this,4);" class="icon4">숙소</a></li>
						<li label="parking"><a href="javascript:;" onclick="CategoryChange(this,5);" class="icon5">주차장</a></li>
						<li><a href="javascript:;" onclick="CategoryChange(this,7);" class="icon7">추천테마</a></li>
						<li><a href="javascript:;" onclick="CategoryChange(this,8);" class="icon8">여행코스</a></li>
						<li><a href="javascript:;" onclick="CategoryChange(this,9);" class="icon9">나의여행</a></li>
						<li><a href="javascript:;" onclick="CategoryChange(this,10);" class="icon10">설정</a></li>
					</ul>
				</div>
				<div class="menu_cont">
				</div>
			</div>
			<!-- //depth1 -->
			<!-- depth2 -->
			<div class="pc_depth2" tabindex="0">
			</div>
		</div>
		<button class="btn_fold" type="button">접기</button>
	</div>
	<div class="mo_cont">
		<div class="cupertino-pane" id="molistdiv">
			<div class="map_menu">
				<strong class="stit_area"></strong>
				<div class="tab_slide">
					<div class="swiper-container">
						<ul class="swiper-wrapper">
							<li class="swiper-slide" label="tour"><a href="javascript:;"  onclick="CategoryChange(this,1);" class="icon1"><div class="micon01"></div>주변 여행지</a></li>
							<li class="swiper-slide" label="food"><a href="javascript:;"  onclick="CategoryChange(this,2);" class="icon2"><div class="micon02"></div>음식점</a></li>
							<li class="swiper-slide" label="cafe"><a href="javascript:;"  onclick="CategoryChange(this,3);" class="icon3"><div class="micon03"></div>카페</a></li>
							<li class="swiper-slide" label="hotel"><a href="javascript:;" onclick="CategoryChange(this,4);" class="icon4"><div class="micon04"></div>숙소</a></li>
							<li class="swiper-slide" label="parking"><a href="javascript:;" onclick="CategoryChange(this,5);" class="icon5"><div class="micon05"></div>주차장</a></li>
							<li class="swiper-slide"><a href="javascript:;" onclick="CategoryChange(this,7);" class="icon7"><div class="micon07"></div>추천테마</a></li>
							<li class="swiper-slide"><a href="javascript:;" onclick="CategoryChange(this,8);" class="icon8"><div class="micon08"></div>여행코스</a></li>
							<li class="swiper-slide"><a href="javascript:;" onclick="CategoryChange(this,9);" class="icon9"><div class="micon09"></div>나의여행</a></li>
						</ul>
					</div>
				</div>
				<div class="mo_list01">
					<div class="swiper-container">
						<ul class="swiper-wrapper">
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="cupertino-pane" id="modetaildiv">
		</div>
		<div class="map_view_btn" style="display : none;"><button type="button">지도로 보기</button></div>
	</div>
	<div class="btn_list01" style="display: none;"><a href="javascript:BackStep(true);">목록보기</a></div>
	<div class="map_btn">
		<button type="button" class="location" onclick="myLocation();">현재위치이동</button>
		<button type="button" class="setup" style="display: none;" onclick="CategoryChange(this,10);">여행지도 설정을 바꿀 수 있어요.</button>
		<button type="button" class="refresh" style="display: none;" onclick="changeCenter();">현재 지도에서 검색</button>
	</div>
	<button type="button" onclick="changeCenter();" style="display: none;" class="refresh mo_refresh">현재 지도에서 검색</button>
</div>





<div id="reportPop" class="wrap_layerpop">
	<div class="layerpop">
		<div class="tit">
			<h2>신고</h2>
			<button type="button" class="btn_close3" onclick="layerPopup.layerHide('reportPop');">닫기</button>
		</div>
		<div class="box_cont">
			<div class="report_cont">
				<ul>
					<li><input type="radio" id="reportForm1" name="reportForm" value="욕설 또는 타인 비방"><label for="reportForm1">욕설 또는 타인 비방</label></li>
					<li><input type="radio" id="reportForm2" name="reportForm" value="도용 또는 저작권 위배"><label for="reportForm2">스팸, 도용 또는 저작권 위배</label></li>
					<li><input type="radio" id="reportForm3" name="reportForm" value="포르노 또는 음란물"><label for="reportForm3">포르노 또는 음란물</label></li>
					<li><input type="radio" id="reportForm4" name="reportForm" value="아동 학대"><label for="reportForm4">아동 학대</label></li>
					<li><input type="radio" id="reportForm5" name="reportForm" value="희롱, 괴롭힘 또는 노골적인 폭력"><label for="reportForm5">희롱, 괴롭힘 또는 노골적인 폭력</label></li>
					<li>
						<input type="radio" id="reportForm6" name="reportForm"  value="기타"  ><label for="reportForm6">기타</label>
						<span><input type="text" name="" title="기타 입력" id="commentreportetc" disabled="true"></span>
					</li>
				</ul>
			</div>
			<div class="btn_center">
				<a href="javascript:layerPopup.layerHide('reportPop');" class="btn01">취소</a>
				<a href="javascript:ReportCommentImage();" class="btn02">신고</a>
			</div>
		</div>
	</div>
</div>
<!-- 로그인 팝업 -->
<div id="login" class="wrap_layerpop" style="z-index: 201;">
	<div class="layerpop">
		<div class="tit">
			<h2>소셜 로그인</h2>
			<button type="button" class="btn_close3" onclick="loginClose();">닫기</button><!-- 0807 script onclick 추가 -->
		</div>
		<div class="box_cont">
			<div class="login">
				<ul class="list_sns clfix">
					<li class="naver"><a href="javascript:;" onclick="goLogin('naver');" title="새창 열림">네이버</a></li>
					<li class="kakao"><a href="javascript:;" onclick="goLogin('kakao');" title="새창 열림">카카오톡</a></li>
					<li class="facebook"><a href="javascript:;" onclick="goLogin('facebook');" title="새창 열림">페이스북</a></li>
					<li class="twitter"><a href="javascript:;" onclick="goLogin('twitter');" title="새창 열림">트위터</a></li>
					<li class="google"><a href="javascript:;" onclick="goLogin('google');" title="새창 열림">구글</a></li>
					<li class="apple"><a href="javascript:;" onclick="goLogin('apple');" title="새창 열림">애플</a></li>
				</ul>
				<div id="loginChk"></div>
				<div class="auto_login"><input type="checkbox" id="autoLogin" name="" checked="checked"><label for="autoLogin">자동 로그인</label></div>
			</div>
		</div>
	</div>
</div>
<!-- //로그인 팝업 -->
<!-- 로그인 팝업 -->
<div id="socialLogin" class="wrap_layerpop" style="z-index: 201;">
	<div class="layerpop">
		<div class="tit">
			<h2>대한민국구석구석 통합 로그인</h2>
			<button type="button" class="btn_close3" onclick="layerPopup.layerHide('socialLogin');">닫기</button>
		</div>
		<div class="box_cont">
			<span class="img">TOUR ONEPASS</span>
			<p>투어원패스는 한국관광공사 통합로그인 서비스로<br/>
				SNS인증을 통해 간편하게 이용할 수 있으며, <br/>
				한 번의 로그인으로 한국관광공사에서 운영하는<br/>
				다양한 서비스를 이용하실 수 있습니다.
			</p>
			<a href="javascript:SSOLogin();" title="새창열림" class="logo">투어원패스 로그인</a>
			<div id="loginChk"></div>
			<div class="auto_login"><input type="checkbox" id="autoLogin2" name="" checked="checked" ><label for="autoLogin2">자동 로그인</label></div>
		</div>
	</div>
</div>
<!-- //로그인 팝업 -->
<!-- 코스선택 팝업 -->
<div id="cosChoice" class="wrap_layerpop"><!-- 0807 id 추가 -->
	<div class="layerpop"><!-- 0807 class 삭제 -->
		<div class="tit">
			<h2>코스 선택</h2>
			<button type="button" class="btn_close3" onclick="layerPopup.layerHide('cosChoice');">닫기</button><!-- 0807 script onclick 추가 -->
		</div>
		<div class="box_cont">
			<div class="list_choice">
				<ul>
				</ul>
			</div>
			<!-- 0603 추가 -->
			<div class="btn_center mt10">
				<a href="javascript:goCosMakeFromList();" class="btn_ok">코스추가</a>
			</div>
			<!-- //0603 추가 -->
		</div>
	</div>
</div>
<!-- //코스선택 팝업 -->

<!-- 코스만들기 팝업 -->
<div id="cosMake" class="wrap_layerpop">
	<div class="layerpop">
		<div class="tit">
			<h2>코스만들기</h2>
			<button type="button" class="btn_close3" onclick="layerPopup.layerHide('cosMake');">닫기</button><!-- 0807 script onclick 추가 -->
		</div>
		<div class="box_cont">
			<input type="text" id="cosname" name="cosname" class="inp_cos" maxlength="30" placeholder="코스명을 입력해 주세요." title="코스명">
			<div class="btn_center">
				<a href="javascript:goCosMakeSave();" class="btn_ok">확인</a>
			</div>
		</div>
	</div>
</div>
<!-- //코스만들기 팝업 -->

<!-- 0523 코스만들기 팝업 -->
<div id="courseBuild" class="wrap_layerpop">
	<div class="layerpop">
		<div class="tit">
			<h2>코스만들기</h2>
			<button type="button" class="btn_close3" onclick="layerPopup.layerHide('courseBuild');">닫기</button>
		</div>
		<div class="box_cont">
			<input type="text" id="cosname2" name="cosname2" class="inp_cos" placeholder="코스명을 입력해 주세요." title="코스명">
			<div class="btn_center">
				<a href="javascript:goCosMakeAndcosSave();" class="btn_ok">확인</a>
			</div>
		</div>
	</div>
</div>
<!-- // 0523 코스만들기 팝업 -->

<!-- 0523 코스생성완료 팝업 -->
<div id="courseBuildFinish" class="wrap_layerpop">
	<div class="layerpop">
		<div class="tit">
			<h2>알림</h2>
			<button type="button" class="btn_close3" onclick="layerPopup.layerHide('courseBuildFinish');">닫기</button>
		</div>
		<div class="box_cont">
			<p>코스생성 및 코스 담기가 완료되었습니다.</p>
			<div class="btn_center">
				<a href="/mypage/mypage_main.do" class="btn_cancel">마이페이지 이동</a>
				<a href="javascript:layerPopup.layerHide('courseBuildFinish');" class="btn_ok">확인</a>
			</div>
		</div>
	</div>
</div>
<!-- // 0523 코스생성완료 팝업 -->

<div id="setupPop" class="wrap_layerpop">
	<div class="layerpop">
		<strong class="tit">설정</strong>
		<div class="travel">
			<strong>주변 여행지</strong>
			<ul id="spotul"><!-- button 선택시 title="선택됨" 추가, 삭제-->
				<li><button type="button" label="12">관광지</button></li>
				<li><button type="button" label="14">문화시설</button></li>
				<li><button type="button" label="28">레포츠</button></li>
			</ul>
			<strong>조회기준</strong>
			<ul id="sortul"><!-- button 선택시 title="선택됨" 추가, 삭제-->
				<li><button type="button" label="1">거리순</button></li>
				<li><button type="button" label="2">인기순</button></li>
			</ul>
		</div>
		<div class="km">
			<strong>조회거리</strong>
			<div id="slider" class="average"><!-- 0일때 .rangeslider__handle 값 : -6px로 해주세요 -->
				<input type="range" min="0" max="100" step="20" value="0" />
				<span class="start">0</span>
			</div>
			<ul>
				<li><span>500m</span></li>
				<li><span>1km</span></li>
				<li><span>2km</span></li>
				<li><span>4km</span></li>
				<li><span>8km</span></li>
			</ul>
		</div>
		<div class="btn_area"><a href="javascript:UpdateSetting();">설정완료</a></div>
		<button type="button" class="btn_close" onclick="CategoryChange(this,10)">닫기</button>
	</div>
</div>

<!-- 네비게이션 팝업 -->
<div id="popNavi" class="wrap_layerpop" style="z-index :1000;">
	<div class="layerpop">
		<div class="tit">
			<h2>내비게이션</h2>
			<button type="button" class="btn_close3" onclick="layerPopup.layerHide('popNavi');">닫기</button><!-- 0807 script onclick 추가 -->
		</div>
		<div class="box_cont">
			<ul class="list_navi clfix">
				<li class="navi_kakao"><a href="javascript:nevi('kakaomap');">카카오내비</a></li>
				<li class="navi_tmap"><a href="javascript:nevi('tmap');">T map</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- 네비게이션 팝업 -->

<div id="locationPop" class="wrap_layerpop">
	<div class="layerpop">
		<div class="location_info">
			<strong>위치 서비스 사용기능이<em>허용되어 있지 않습니다.</em></strong>
			<p>
				기본 위치인 서울시의 정보로 지도가 노출되며,<br/>
				위치 서비스를 허용하여 재 접속하시거나,<br/>
				지도 위치를 변경한 후 지도 상단의 새로고침 버튼을<br/>
				클릭하면 해당 위치 주변 여행정보를 확인할 수 있습니다.
			</p>
			<a href="javascript:;">위치 서비스 허용 방법 보기</a>
		</div>
		<button type="button" class="btn_close" onclick="layerPopup.layerHide('locationPop');">닫기</button>
	</div>
</div>
<!-- 공유하기 팝업 -->
<div id="popShare" class="wrap_layerpop" tabindex="0">
	<div class="layerpop">
		<div class="tit">
			<h2>공유하기</h2>
			<button type="button" class="btn_close3" onclick="layerPopup.layerHide('popShare');">닫기</button><!-- 0807 script onclick 추가 -->
		</div>
		<div class="box_cont">
			<div class="share">
				<ul class="list_sns clfix">
					<li class="facebook"><a href="javascript:goShare('facebook');" title="새창 열림">페이스북</a></li>
					<li class="twitter"><a href="javascript:goShare('twitter');" title="새창 열림">트위터</a></li>
					<li class="kakaostory"><a href="javascript:goShare('kakaostory');" title="새창 열림">카카오스토리</a></li>
					<li id="kakao-link-btn" class="kakao"><a href="javascript:goShare('kakaotalk');" title="새창 열림">카카오톡</a></li>
					<li class="band"><a href="javascript:goShare('band');" title="새창 열림">밴드</a></li>
				</ul>
				<div class="inp_url clfix">
					<input type="text" value="" id="foo" title="현재url정보"><button type="button" onclick="btnClipBoard();">URL복사</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //공유하기 팝업 -->
<!-- 댓글평가 팝업 -->
<div id="commentPop" class="wrap_layerpop">
	<div class="layerpop">
		<div class="tit">
			<h2><span></span> 평가</h2>
			<button type="button" class="btn_close3" onclick="layerPopup.layerHide('commentPop');">닫기</button>
		</div>
		<div class="box_cont">
			<div class="comment_estimate">
				<div class="estimate_txt">
				</div>
				<ul>
					<li>
						<input type="radio" id="estimateForm1" name="estimateForm">
						<label for="estimateForm1" class="icon1">좋아요!</label>
					</li>
					<li>
						<input type="radio" id="estimateForm2" name="estimateForm">
						<label for="estimateForm2" class="icon2">그저 그래요</label>
					</li>
				</ul>
			</div>
			<div class="btn_center">
				<a href="javascript:contentPaCheck();">확인</a>
			</div>
		</div>
	</div>
</div>
<!-- //댓글평가 팝업 -->
<div id="approachPop" class="wrap_layerpop">
	<div class="layerpop">
		<div class="approach_pop">
			<strong>안녕하세요.<br/>AI콕콕 플래너에 오신 걸 환영해요.</strong>
			<p>
				목적지, 일정, 취향만 살짝 알려주시면<br class="mo"> 자동으로 맞춤형<br class="pc">
				여행 코스를 만들어 드려요. <br class="mo">여행 코스를 만들어 보실래요?
			</p>
			<div class="btn_area">
				<a href="/main/cr_main.do?type=abc">여행코스 받아보기 </a>
				<a href="javascript:layerPopup.layerHide('approachPop');">다음에 받기</a>
			</div>
		</div>
	</div>
</div>
<!-- 1017 추가 -->
<div id="mappositionPop" class="wrap_layerpop">
	<div class="layerpop">
		<div class="positionCont">
			<strong>위치 서비스 사용기능이<em>허용되어 있지 않습니다.</em></strong>
			<p><span>기본 값인 서울시의 정보로 지도가 노출</span>되며, <br/>
				위치 서비스를 허용 하여 재 접속하시거나, <br/>
				지도 위치를 변경한 뒤 지도 하단의 버튼을 클릭하면<br/>
				해당 위치 주변 여행정보를 확인할 수 있습니다.</p>
			<div class="btn_center">
				<a href="/detail/rem_detail.do?cotid=6b3a7a2f-cffc-483e-b3c6-f74bf974dc8c">위치 서비스 허용 방법 보기</a>
			</div>
			<button type="button" class="btn_close3" onclick="layerPopup.layerHide('mappositionPop');">닫기</button>
		</div>
	</div>
</div>
<!-- //1017 추가 -->
<div id="positionPop01" class="wrap_layerpop">
	<div class="layerpop">
		<strong></strong>
		<p></p>
		<div class="btn_area">
			<a href="/curation/cr_abc_create.do?type=3" id="createcourse">코스 만들기</a>
			<a href="javascript:layerPopup.layerHide('positionPop01');">다음에 할께요</a>
		</div>
		<div class="btn_none">
			<button type="button" onclick="closepositionPop();">오늘 하루 다시 보지 않기</button>
		</div>
	</div>
</div>
<style>
	.loading.defaultloading{position:fixed;left:50%;top:50%;width:80px;height:80px;margin:-40px 0 0 -40px;}
	.loading.defaultloading:after{content:'';position:fixed;left:0;top:0;z-index:-1;width:100%;height:100%;background:rgba(0,0,0, 0.7)}
</style>
<div class="loading defaultloading" style="z-index:100000; display: none;">
	<?xml version="1.0" standalone="no"?>
	<!-- Generator: SVG Circus (http://svgcircus.com) -->
	<!--
	stroke-width 겹침 정도
	 -->
	<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
	<?xml version="1.0" standalone="no"?>
	<!-- Generator: SVG Circus (http://svgcircus.com) -->
	<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
	<svg id="SVG-Circus-1f89b6bf-a102-15b5-7285-a87df821a9eb" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid meet"><circle id="actor_4" cx="50" cy="75" r="10" opacity="1" fill="rgba(174,168,165,1)" fill-opacity="1" stroke="rgba(166,3,17,1)" stroke-width="0" stroke-opacity="1" stroke-dasharray=""></circle><circle id="actor_3" cx="50" cy="75" r="10" opacity="1" fill="rgba(220,68,5,1)" fill-opacity="1" stroke="rgba(166,3,17,1)" stroke-width="0" stroke-opacity="1" stroke-dasharray=""></circle><circle id="actor_2" cx="50" cy="75" r="10" opacity="1" fill="rgba(123,175,212,1)" fill-opacity="1" stroke="rgba(166,3,17,1)" stroke-width="0" stroke-opacity="1" stroke-dasharray=""></circle><circle id="actor_1" cx="50" cy="75" r="10" opacity="1" fill="rgba(137,168,79,1)" fill-opacity="1" stroke="rgba(166,3,17,1)" stroke-width="0" stroke-opacity="1" stroke-dasharray=""></circle>
		<script type="text/ecmascript">
			<![CDATA[(function(){var actors={};actors.actor_1={node:document.getElementById("SVG-Circus-1f89b6bf-a102-15b5-7285-a87df821a9eb").getElementById("actor_1"),type:"circle",cx:50,cy:75,dx:20,dy:20,opacity:1};actors.actor_2={node:document.getElementById("SVG-Circus-1f89b6bf-a102-15b5-7285-a87df821a9eb").getElementById("actor_2"),type:"circle",cx:50,cy:75,dx:20,dy:20,opacity:1};actors.actor_3={node:document.getElementById("SVG-Circus-1f89b6bf-a102-15b5-7285-a87df821a9eb").getElementById("actor_3"),type:"circle",cx:50,cy:75,dx:20,dy:20,opacity:1};actors.actor_4={node:document.getElementById("SVG-Circus-1f89b6bf-a102-15b5-7285-a87df821a9eb").getElementById("actor_4"),type:"circle",cx:50,cy:75,dx:20,dy:20,opacity:1};var tricks={};tricks.trick_1=(function(_,t){t=(function(n){return.5>n?2*n*n:-1+(4-2*n)*n})(t)%1,t=t*1%1,t=0>t?1+t:t;var a=(_.node,-25*Math.cos(-90*Math.PI/180)),i=25*Math.sin(-90*Math.PI/180);a+=25*Math.cos((-90-360*t*1)*Math.PI/180),i-=25*Math.sin((-90-360*t*1)*Math.PI/180),_._tMatrix[4]+=a,_._tMatrix[5]+=i});var scenarios={};scenarios.scenario_1={actors: ["actor_1","actor_2","actor_3","actor_4"],tricks: [{trick: "trick_1",start:0.00,end:1}],startAfter:0,duration:1500,actorDelay:300,repeat:0,repeatDelay:1000};var _reqAnimFrame=window.requestAnimationFrame||window.mozRequestAnimationFrame||window.webkitRequestAnimationFrame||window.oRequestAnimationFrame,fnTick=function(t){var r,a,i,e,n,o,s,c,m,f,d,k,w;for(c in actors)actors[c]._tMatrix=[1,0,0,1,0,0];for(s in scenarios)for(o=scenarios[s],m=t-o.startAfter,r=0,a=o.actors.length;a>r;r++){if(i=actors[o.actors[r]],i&&i.node&&i._tMatrix)for(f=0,m>=0&&(d=o.duration+o.repeatDelay,o.repeat>0&&m>d*o.repeat&&(f=1),f+=m%d/o.duration),e=0,n=o.tricks.length;n>e;e++)k=o.tricks[e],w=(f-k.start)*(1/(k.end-k.start)),tricks[k.trick]&&tricks[k.trick](i,Math.max(0,Math.min(1,w)));m-=o.actorDelay}for(c in actors)i=actors[c],i&&i.node&&i._tMatrix&&i.node.setAttribute("transform","matrix("+i._tMatrix.join()+")");_reqAnimFrame(fnTick)};_reqAnimFrame(fnTick);})()]]>
		</script>
	</svg>
</div>
<!-- //로딩 -->

<script>

	let cosFunctionkind = '';
	let cosContenttype = '';
	let cosContentid = '';
	let cosOriCourseid = '';
	let cosChoiceList = 'N';
	let shuturl = '';
	let abcsharecheck = false;

	$('#setupPop #slider input[type="range"]').rangeslider({
		polyfill: false,
		onSlide: function(position, value) {
			if(value == 0)
				$('#slider .rangeslider__handle').css('left','-6px');
			else if(value == 20)
				$('#slider .rangeslider__handle').css('left',(Number($('#slider .rangeslider__handle').css('left').replace('px',''))-5)+'px');
			else if(value == 80)
				$('#slider .rangeslider__handle').css('left',(Number($('#slider .rangeslider__handle').css('left').replace('px',''))+5)+'px');
			else if (value == 100)
				$('#slider .rangeslider__handle').css('left',(Number($('#slider .rangeslider__handle').css('left').replace('px',''))+6)+'px');
		}
	});

	function loginClose(){
		layerPopup.layerHide('login');
		beforeUrl = '';
		if(beforefocus != undefined){
			if($(beforefocus).closest('.pop_subMenu').attr('tabindex') == 0){
				$(beforefocus).closest('.pop_subMenu').siblings('button').addClass('on').attr('title', '닫기');
				$('body').append('<div class="dimmed2"></div>');
			}
			$(beforefocus).focus();
		}
	}

	function setFavoContent(contentid,element) {
		if( loginYn == 'N') {
			showLogin(2);
		} else {

			$.ajax({
				url: mainurl+'/call',
				dataType: 'json',
				type: "POST",
				data: {
					cmd : 'FAVO_CONTENTINFO_SAVE',
					cotid : contentid
				},
				success: function(data) {
					if( data.header.process == 'success' ) {

						alert('즐겨찾기에 추가 되었습니다.');
						$(element).addClass('on');
						$(element).attr('title','선택됨');

						if(location.href.indexOf('cr_abc_detail') != -1){
							$(element).closest('.bookmark').addClass('on');
							abcdata.items.forEach(item=>{
								let content = item.contents.find(content => content.cotId === contentid);
								if(content) {
									content.isFavorite = true;
								}
							});
							if(selectcotId){
								if(selectcotId == contentid){
									$('.pc_depth2 .bookmark').addClass('on');
								}
							}
						} else{

							let dataobj;

							let index = locationdata.viewdata.findIndex(data => data.cotId === contentid);
							dataobj = locationdata.viewdata[index];
							dataobj.useFavo = 1;
							if(service == 'contents'){
								$($($('.pc_depth1 .list_type1 ul').children().get(index)).find('.btn button')).addClass('on');
							} else if (service == 'theme'){
								godetailthemelist(selectObj.tmtsId);
							} else if(service.indexOf('course') != -1){
								goDetailCourse(selectObj.cotId,selectObj.crsId);
							}
						}
					} else if( data.header.rsFlag == 0 ) {
						goFavoContentDelete(contentid,element);
					}
					$('.btn_titview').removeClass('on');
					$('.dimmed2').remove();
				},
				complete: function() {
				},
				error: function(xhr, textStatus, errorThrown) {
				}
			});
		}
	}

	//즐겨찾기 삭제
	function goFavoContentDelete(contentid,element) {

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: {
				cmd : 'FAVO_CONTENTINFO_DELETE',
				cotid : contentid
			},
			success: function(response) {
				alert('즐겨찾기가 취소되었습니다.');
				if(location.href.indexOf('cr_abc_detail') != -1){
					$(element).closest('.bookmark').removeClass('on');
					$(element).removeClass('on');
					abcdata.items.forEach(item=>{
						let content = item.contents.find(content => content.cotId === contentid);
						if(content) {
							content.isFavorite = false;
						}
					});
					if(selectcotId){
						if(selectcotId == contentid){
							$('.pc_depth2 .bookmark').removeClass('on');
						}
					}
				} else{
					let index = locationdata.viewdata.findIndex(data => data.cotId === contentid);
					let dataobj = locationdata.viewdata[index];
					dataobj.useFavo = 0;

					if(service == 'contents'){
						$($($('.pc_depth1 .list_type1 ul').children().get(index)).find('.btn button')).removeClass('on');
					} else if (service == 'theme'){
						godetailthemelist(selectObj.tmtsId);
					} else if(service.indexOf('course') != -1){
						goDetailCourse(selectObj.cotId,selectObj.crsId);
					} else if(service == 'favo'){
						$('.bookmark').removeClass('on');
						CloseTwoDepth();
					}
				}
			},
			complete: function() {
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}

	// 좋아요
	function setLike(cotId,element) {
		if( $.cookie('content_'+cotId) == 'Y') {
			alert('이미 좋아요를 누르셨습니다.');
		} else {

			$.ajax({
				url: mainurl+'/call',
				dataType: 'json',
				type: "POST",
				data: {
					cmd : 'CONTENT_LIKE_SAVE',
					cotid : cotId
				},
				success: function(data) {
					alert('좋아요를 저장하였습니다.');
					$.cookie('content_'+cotId, 'Y', {expires: 1, path:'/'});
					$(element).addClass('on');
					if(location.href.indexOf('cr_abc_detail') != -1){
						$(element).closest('.good').addClass('on');
						$(element).siblings('em').text(Number($(element).siblings('em').text())+1);
						abcdata.items.forEach(item=>{
							let content = item.contents.find(content => content.cotId === cotId);
							if(content) {
								content.likeCount++;
								content.isLiked = true;
							}
						});
						if(selectcotId){
							if(selectcotId == cotId){
								$('.pc_depth2 .good').addClass('on');
								$('.pc_depth2 .good button').text(Number($('.pc_depth2 .good button').text()+1));
							}
						}
					}
				},
				complete: function() {
				},
				error: function(xhr, textStatus, errorThrown) {
				}
			});
		}
	}

	//코스에 담기에 필요한 내 코스 리스트
	function myCourseList(functionkind, contenttype, contentid, oriCourseid,index2) {

		cosFunctionkind = functionkind;
		cosContenttype = contenttype;
		cosContentid = contentid;
		cosOriCourseid = oriCourseid;

		if( loginYn == 'N') {
			showLogin(2);
		} else {
			if( sloginType == '10' ) {
				layerPopup.layerShow('cosConfirm4');
				return;
			} else {

				$.ajax({
					url: mainurl+'/call',
					dataType: 'json',
					type: "POST",
					data: {
						cmd : 'MY_COURSE_LIST_VIEW',
						page : 1+'',
						cnt : 2000+'',
						stampId : stampId
					},
					success: function(data) {
						if(index2 != undefined && index2 != null){
							goMyCourseListView(data, functionkind, contenttype, contentid, oriCourseid,index2);
						} else{
							goMyCourseListView(data, functionkind, contenttype, contentid, oriCourseid);
						}
					},
					complete: function() {
					},
					error: function(xhr, textStatus, errorThrown) {
					}
				});
			}
		}
	}

	function goCosMakeFromList() {
		cosChoiceList = 'Y';
		if( loginYn == 'Y' ) {
			layerPopup.layerHide('cosChoice');
			layerPopup.layerShow('cosMake');
		} else {
			showLogin(2);
		}
	}

	function goCosMakeSave() {
		if( $('#cosname').val() == '' ) {
			alert('코스명을 입력해주세요.');
			return;
		} else {
			goCourseCreate($('#cosname').val());
		}
	}

	//코스에 담기에 필요한 내 코스 리스트 보여주기
	function goMyCourseListView(data, functionkind, contenttype, contentid, oriCourseid,index2) {

		var strHtml = "";

		if( data.body.result != undefined ) {

			$.each(data.body.result, function (index, items) {

				if( items.crsId != oriCourseid ) {
					strHtml += '<li>';
					strHtml += '<span>'+items.title+'</span>';
					strHtml += '<div class="area_btn">';
					if( functionkind == 'C' ) {	//코스에 담기
						strHtml += '    <button type="button" class="btn_def" onclick=goCartCourse("'+items.crsId+'","'+contentid+'","'+contenttype+'")>선택</button>';
					} else {	//다른코스로 이동
						strHtml += '    <button type="button" class="btn_def" onclick=goCourseSubMove("'+items.crsId+'","'+contentid+'","'+contenttype+'","'+oriCourseid+'","'+index2+'")>선택</button>';
					}

					strHtml += '</div>';
					strHtml += '</li>';
				}
			});

			$('.list_choice ul').html(strHtml);

			layerPopup.layerShow('cosChoice');

		} else {
			//알림팝업
			layerPopup.layerShow('courseBuild');
		}
	}

	//다른코스로 이동
	function goCourseSubMove(targetCourseid, contentid, contenttype, oriCourseid,index) {

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: {
				cmd : 'COURSE_SUB_UPDATE',
				oriCourseid : oriCourseid,
				cotid : contentid,
				targetCourseid : targetCourseid
			},
			success: function(data) {

				if(data.header.process =='fail'){
					if(data.header.ment == 'NotInsert'){
						alert("해당 코스에 이미 담긴 콘텐츠입니다.");
						layerPopup.layerHide('cosChoice');
					}
				} else{
					var id ='#' + index;
					$(id).closest('.coslist').remove();

					alert('콘텐츠 이동이 완료되었습니다.');
					$('.dimmed2').remove();
					cossize --;
					$('.total_check strong span').html(cossize);
					layerPopup.layerHide('cosChoice');
					$('.list_choice ul').empty();
				}
			},
			complete: function() {
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}

	//코스에 담기
	function goCartCourse(courseid, contentid, contenttype) {

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: {
				cmd : 'COURSE_SUB_SAVE',
				courseid : courseid,
				cotid : contentid,
				contenttype : contenttype+''
			},
			success: function(data) {
				layerPopup.layerHide('cosChoice');

				if( cosChoiceList == 'S') {
					layerPopup.layerShow('courseBuildFinish');
				} if(data.header.process =='fail'){
					if(data.header.ment == 'NotInsert'){
						alert("해당 코스에 이미 담긴 콘텐츠입니다.");
					}
				} else {
					alert('코스에 담기가 완료되었습니다.');
				}
			},
			complete: function(data) {
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}

	//코스 생성
	function goCourseCreate(cosname) {

		var makeCrsId = '';

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: {
				cmd : 'COURSE_CONTENT_SAVE',
				title : chkword(cosname)
			},
			success: function(data) {
				$('.makecos').hide();
				makeCrsId = data.body.result[0].crsId;
			},
			complete: function() {
				if( cosChoiceList == 'N' ) {
					window.location.reload(true);
				} else if( cosChoiceList == 'Y' ) {
					layerPopup.layerHide('cosMake');
					myCourseList(cosFunctionkind, cosContenttype, cosContentid, cosOriCourseid);
				} else {
					layerPopup.layerHide('courseBuild');
					goCartCourse(makeCrsId, cosContentid, cosContenttype)
				}
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}

	function openShare(sContentId,sContentType,title,ContentImg,selector) {
		userCourseYn = 'N';
		sContentTitle = title;
		sContentImg = ContentImg;
		this.sContentId = sContentId;
		if (typeof FB == 'undefined'){
			//<![CDATA[
			window.fbAsyncInit = function() {
				FB.init({
					appId	  : facebookappid,
					xfbml	  : true,
					version	: 'v3.0'
				});
			};
			(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) return;
				js = d.createElement(s); js.id = id;
				js.src = 'https://connect.facebook.net/ko_KR/sdk.js';
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
			//]]>
		}
		if((service == 'theme' || service.indexOf('course') != -1) && !selectcotId){
			getShuturl( mainurl+'/mylocation/locationshare.do?cotid='+sContentId+'&service='+service+'&title='+sContentTitle.replace(/%/g,'%25')+'&img='+sContentImg );
		} else if (service =='abc' && !sContentType) {
			getShuturl( mainurl+'/mylocation/locationshare.do?cotid='+sContentId+'&service='+service+'&title='+sContentTitle.replace(/%/g,'%25')+'&img='+sContentImg );
		} else{
			getShuturl( mainurl+'/sns/snsShare.jsp?cotid='+sContentId+'&contenttype='+sContentType+'&title='+sContentTitle.replace(/%/g,'%25')+'&img='+sContentImg );
		}

		if(service == 'abc' && !abcsharecheck){
			sharecontent = selector;
		}

	}

	function openShare2(sContentId,title,ContentImg) {

		userCourseYn = 'Y';
		sContentTitle = title;
		sContentImg = ContentImg;
		this.sContentId = sContentId;
		if (typeof FB == 'undefined'){
			//<![CDATA[
			window.fbAsyncInit = function() {
				FB.init({
					appId	  : facebookappid,
					xfbml	  : true,
					version	: 'v3.0'
				});
			};
			(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) return;
				js = d.createElement(s); js.id = id;
				js.src = 'https://connect.facebook.net/ko_KR/sdk.js';
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
			//]]>
		}

		getShuturl( mainurl+'/mylocation/locationshare.do?crsid='+sContentId+'&service='+service+'&title='+sContentTitle.replace(/%/g,'%25')+'&img='+sContentImg );
	}

	function openShareSnsCourse(crsId) {
		sContentId = crsId;
		userCourseYn = 'Y';
		getShuturl( mainurl+'/detail/cs_detail_user.do?crsid='+crsId);
	}

	function getShuturl(rurl) {

		eventYn = 'N';
		oriUrl = rurl;

		$.ajax({
			url: mainurl + '/call',
			dataType: 'json',
			type: "POST",
			data: {
				cmd: 'GET_SHUTURL',
				longurl: rurl
			},
			success: function (data) {
				if (data.header.process == 'success') {
					var obj = JSON.parse(data.header.JsonString);
					shuturl = obj.result.url;

					$('#foo').val(shuturl);
					layerPopup.layerShow('popShare');
				} else {
					alert('서비스 준비 중입니다.');
				}
			},
			error: function (xhr, textStatus, errorThrown) {
				alert('서비스 준비 중입니다.');
			}
		});
	}

	function goShare(kind) {
		if( kind == 'facebook' ) {
			facebook();
		}else if( kind == 'twitter') {
			twitter();
		}else if( kind == 'kakaostory') {
			kakaostory();
		}else if( kind == 'kakaotalk') {
			if(getDevice() == 'iOS') {
				if (getBrowser() == 'Opera' || getBrowser() == 'OperaTouch') {
					alert("카카오톡으로 공유하시려면 다른 브라우저를 사용해주세요.");
					return;
				}
			}
			kakaotalk();
		} else if( kind == 'band') {
			band();
		}
		if( userCourseYn == 'N' ) {
			shareHistory(kind, sContentId);
		} else {
			shareHistoryUser(kind, sContentId);
		}
	}

	function band() {

		var url   = shuturl;
		var title = sContentTitle;

		var _url   = encodeURIComponent(url);
		var _title = encodeURIComponent(title);
		var _br	= encodeURIComponent('\r\n');

		var gw_schemeUrl = 'create/post';
		var ga_schemeUrl = 'bandapp://create/post';
		var schemeUrl2 = 'bandapp://create/post';
		var param = '?text=' + _title + _br + _url;
		var param2 = '?text=' + _title + _br + _url + '&route=' + mainurl;
		var a_store = 'itms-apps://itunes.apple.com/app/id542613198';
		var g_store = 'market://details?id=com.nhn.android.band';
		var a_proto = 'bandapp://';
		var g_proto = 'scheme=bandapp;package=com.nhn.android.band';
		var ga_proto = 'package=com.nhn.android.band';

		var url2 = '';

		if (navigator.userAgent.match(/android/i) ) 	{
			var chkband = false;

			if( appYn == "Y" ) {
				var invisible_div = document.getElementById("invisible_div");
				invisible_div.innerHTML = "<iframe src=" + ga_schemeUrl  + param + " onload='goMarket();'></iframe>";
			}

			if( appYn == "Y" ) {
				url2 = "intent:" + ga_schemeUrl + param + "#Intent;" + g_proto + ";end;";
			} else {
				url2 = "intent://" + gw_schemeUrl + param+  "#Intent;" + g_proto + ";end;";
			}

			if( appYn == "N") {
				var startTime = new Date();
				setTimeout(function () {
					var endTime = new Date();
					if(endTime - startTime < 4000) {
						window.location.href = g_store;
					}
				}, 2000) ;
			}

			setTimeout(function(){ window.location.href = url2; }, 100);

		} else if (navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i) || navigator.userAgent.match(/ios/i)) {

			url2 = schemeUrl2+param2;

			var startTime = new Date();
			setTimeout(function () {
				var endTime = new Date();
				if(endTime - startTime < 4000) {
					window.location.href = a_store;

				}
			}, 2000) ;

			//setTimeout(function(){ location.href = a_store; }, 500);
			if(getBrowser() == 'Opera' || getBrowser() == 'OperaTouch'){
				setTimeout(function(){ location.href = 'http://band.us/plugin/share?body=' + _title + _br + _url + '&route=' + _url; }, 300);
			} else{
				setTimeout(function(){ location.href = url2; }, 300);
			}
		} else {
			var url = 'http://band.us/plugin/share?body=' + _title + _br + _url + '&route=' + _url;
			window.open(url, "share_band", "width=600, height=700, resizable=no");
		}
	}

	function goMarket() {
		window.location.href = 'market://details?id=com.nhn.android.band';
		return true;
	}

	function facebook(sContentTitle){

		if (eventYn == 'Y' && getBrowserPopup()) {
			w.location.href = 'https://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(shuturl);
		} else if (device == 'iOS') {
			if( appYn == 'Y') {
				location.href = 'https://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(shuturl);
			} else {
				window.open('https://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(shuturl),'_system');
			}
		} else {
			FB.ui({
				method: 'feed',
				link: shuturl,
				title:sContentTitle,
				display:'popup'
			}, function(response){
				if (typeof response != 'undefined') {
				}
			});
		}
	};

	function twitter() {
		var msg = encodeURIComponent(sContentTitle);
		var url = encodeURIComponent(shuturl);
		if (eventYn == 'Y' && getBrowserPopup()) {
			w.location.href = "https://twitter.com/intent/tweet?text="+msg+"&url="+url;
		} else {
			w=window.open("https://twitter.com/intent/tweet?text="+msg+"&url="+url, '_system', 'width=450,height=400');
		}
	}

	function kakaostory(){
		Kakao.Story.share({
			url: shuturl,
			text: sContentTitle
		});
	}

	function kakaotalk(){

		var kakaoshareimage = mainimgurl+sContentImg;
		if(sContentImg.indexOf('visitkorea') != -1)
			kakaoshareimage = sContentImg;

		//<![CDATA[
		Kakao.Link.createDefaultButton({
			container: '#kakao-link-btn',
			objectType: 'feed',
			content: {
				title: sContentTitle,
				description: '',
				imageUrl: kakaoshareimage,
				link: {
					mobileWebUrl: oriUrl,
					webUrl: oriUrl
				}
			},
			buttons: [
				{
					title: '웹으로 보기',
					link: {
						mobileWebUrl: oriUrl,
						webUrl: oriUrl
					}
				}
			]
		});
		//]]>

		$('#kakao-link-btn').trigger("click");
		Kakao.Link.cleanup();
	}

	function shareHistory(kind, shareCotid) {
		var sharekind;

		if( kind == 'facebook' ) {
			sharekind = 0;
		}else if( kind == 'twitter') {
			sharekind = 1;
		}else if( kind == 'kakaostory') {
			sharekind = 2
		}else if( kind == 'kakaotalk') {
			sharekind = 3
		}else if( kind == 'band') {
			sharekind = 4
		}

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: {
				cmd : 'SHARE_HISTORY_SAVE',
				sharekind : sharekind+'',
				cotid : shareCotid,
				service : abcsharecheck ? service : ''
			},
			success: function(data) {
				if(service == 'abc' && !abcsharecheck){
					if(sharecontent)
						$(sharecontent).siblings('em').text(Number($(sharecontent).siblings('em').text())+1);
					abcdata.items.forEach(item=>{
						let content = item.contents.find(content => content.cotId === sContentId);
						if(content)
							content.shareCount++;
					});
				}
				abcsharecheck = false;
			},
			complete: function() {
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}

	function btnClipBoard() {

		var URL_link = $('#foo').val();

		//$('.pop_share').hide();

		function selectElementText(element) {
			if (document.selection) {
				var range = document.body.createTextRange();
				range.moveToElementText(element);
				range.select();
				document.execCommand('copy');

				alert("주소가 복사 되었습니다.");

			} else if(window.getSelection){
				var brw = getBrowser();
				if( brw == "Chrome") {
					var copyText = document.getElementById("foo");
					copyText.select();
					document.execCommand('copy');

					alert("주소가 복사 되었습니다.");
				} else {
					var range = document.createRange();
					range.selectNode(element);
					window.getSelection().removeAllRanges();
					window.getSelection().addRange(range);
					document.execCommand('copy');

					alert("주소가 복사 되었습니다.");
				}
			}
		}

		var element = document.createElement('DIV');
		element.textContent = URL_link;
		document.body.appendChild(element);
		selectElementText(element);
		element.remove();
	}

	function closepositionPop(){
		layerPopup.layerHide('positionPop01');
		$.cookie('positionPop01', 'Y', {expires: 1, path:'/'});
	}

</script>




<!-- 스피어 태깅관련 -->

<script src="https://cdn.visitkorea.or.kr/resources/js/spearjs/all.js?v=202301020d58f5bd-557d-42c4-8a81-135606fae4ac"></script>
<script src="https://cdn.visitkorea.or.kr/resources/js/spearjs/all_callback.js?v=202301020d58f5bd-557d-42c4-8a81-135606fae4ac"></script>
<script src='https://cdn.visitkorea.or.kr/resources/js/spearjs/mylocation_mylocation.js?v=202301020d58f5bd-557d-42c4-8a81-135606fae4ac'></script>

<script>
	var he_oMonth = new Date();
	he_oMonth.setDate(1);
	
	if( (he_oMonth.getMonth()+1) == 1 || (he_oMonth.getMonth()+1) == 2 || (he_oMonth.getMonth()+1) == 12 ) {
		$('link[rel="shortcut icon"]').attr('href', '/resources/images/favicon04.ico');
		$('.winter').css('display','block');
	} else if( (he_oMonth.getMonth()+1) == 3 || (he_oMonth.getMonth()+1) == 4 || (he_oMonth.getMonth()+1) == 5 ) {
		$('link[rel="shortcut icon"]').attr('href', '/resources/images/favicon01.ico');
		$('.spring').css('display','block');
	} else if( (he_oMonth.getMonth()+1) == 6 || (he_oMonth.getMonth()+1) == 7 || (he_oMonth.getMonth()+1) == 8 ) {
		$('link[rel="shortcut icon"]').attr('href', '/resources/images/favicon02.ico');
		$('.summer').css('display','block');
	} else {
		$('link[rel="shortcut icon"]').attr('href', '/resources/images/favicon03.ico');
		$('.autumn').css('display','block');
	}

	function nextLogin(){
		if(navigator.userAgent.indexOf("Trident") > 0){
			alert("원활한 사용을 위해 Chrome, Microsoft Edge 브라우저를 권장합니다. \n 확인버튼을 누르면 Microsoft Edge 브라우저로 자동 이동됩니다.")
			window.location = "microsoft-edge:" + window.location.href;
			return;
		}
		else if(/MSIE \d |Trident.*rv:/.test(navigator.userAgent)){
			alert("원활한 사용을 위해 Chrome, Microsoft Edge 브라우저를 권장합니다. \n 확인버튼을 누르면 Microsoft Edge 브라우저로 자동 이동됩니다.")
			window.location = "microsoft-edge:" + window.location.href;
			return;
		}



		try {
			geocoder = new kakao.maps.services.Geocoder();
		} catch (e) {
			mapStat = 'N';
			alert('현재 지도 서비스가 원활하지 않습니다. \n' +
					'서비스 이용에 불편을 드려 죄송합니다.\n' +
					'최대한 빠르게 복구 될 수 있도록 최선을 다하겠습니다.');
			history.back();
			// showLoding();
			// setTimeout(function () {
			// 	alert('현재 원활한 서비스를 제공하기 위해 서비스 점검중입니다.\r\n잠시 후 이용 부탁드립니다.');
			// 	location.href = '/main/main.do';
			// }, 200) ;
		}

		if (mobileYn == 'Y') $('.mapPosition').hide();
		getLocation();

		let recentMonth = nowDate.getMonth() + 1;

		switch (recentMonth) {
			case 3: case 4: case 5:
				$('.logoSpring').show();
				break;
			case 6: case 7: case 8:
				$('.logoSummer').show();
				break;
			case 9: case 10: case 11:
				$('.logoAutumn').show();
				break;
			case 12: case 1: case 2:
				$('.logoWinter').show();
				break;
		}
	}

	function showPosition(x, y) {

		locationx = x;
		locationy = y;
		mylocationx = x;
		mylocationy = y;
		mapCenterlocationx = x;
		mapCenterlocationy = y;
		getAddress(locationx, locationy);
	}

	function showPositionNot(x, y) {
		if (x == 0) x = 37.566470;
		if (y == 0) y = 126.977963;

		locationx = x;
		locationy = y;
		mylocationx = x;
		mylocationy = y;
		mapCenterlocationx = x;
		mapCenterlocationy = y;
		getAddress(locationx, locationy);
	}

	function getAddress(x,y) {

		if( x == 0 ) {
			searchAddrFromCoords(new kakao.maps.LatLng(37.600000, 127.000000), displayCenterInfo);
		} else {
			searchAddrFromCoords(new kakao.maps.LatLng(x, y), displayCenterInfo);
		}

		getSetting();
	}

	function searchAddrFromCoords(coords, callback) {
		// 좌표로 행정동 주소 정보를 요청합니다
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
	}

	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}

	function goSettingAreaCode(gaddress, gaddress2) {
		setTimeout(function () {
			goConnectLocationLogSave(gaddress, gaddress2);
		}, 200) ;
		setTimeout(function () {
			setLocationMap();
		}, 200) ;

		let address = '';
		if(gaddress)
			address += gaddress;
		if(gaddress2)
			address += ' ' + gaddress2;
		$('.stit_area').text(address);

		if( $.cookie('positionPop01') == 'Y' || location.href.indexOf('korean.visitkorea.or.kr') != -1) {
			return;
		}




		if(mobileYn == 'Y' && loginYn == 'Y' && gaddress){
			let areacode = getAreacode(gaddress);
			let siguguncode = getsiguguncode(areacode,gaddress2);

			$('#positionPop01 strong').html(`현재 <em>${address}</em> 여행 중이십니까?`);
			$('#positionPop01 p').html(`현재 내 위치인 ${address} 주변에 가볼 핫한<br/>여행코스를 만들어 보시겠습니까?`);
			layerPopup.layerShow('positionPop01');
			$('#createcourse').attr('href',`/curation/cr_abc_create.do?type=3&areacode=${areacode}&siguguncode=${siguguncode}`);
		}
	}

	function setLocationMap() {

		if (mapStat == 'N') return;

		var container = document.getElementById('map');

		var options = {
			center: new kakao.maps.LatLng(locationx, locationy),
			level: 5
		};

		map = new kakao.maps.Map(container,options);

		// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'center_changed', function() {

			// 지도의  레벨을 얻어옵니다
			var level = map.getLevel();

			// 지도의 중심좌표를 얻어옵니다
			var latlng = map.getCenter();

			mapCenterlocationx = latlng.getLat();
			mapCenterlocationy = latlng.getLng();


		});

		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var	markerImage = new kakao.maps.MarkerImage('/resources/images/sub/ico_marker_pos.png',  new kakao.maps.Size(30, 30),  new kakao.maps.LatLng(locationx, locationy)),
				markerPosition = new kakao.maps.LatLng(locationx, locationy); // 마커가 표시될 위치입니다

// 			마커를 생성합니다
		var mymarker = new kakao.maps.Marker({
			position: markerPosition,
			image: markerImage // 마커이미지 설정
		});

		mymarker.setMap(map);

		kakao.maps.event.addListener(map, 'idle', function() {
			getDigtCardToastMessage();
			getToastMessage();
		});

		locationdata['contentdata'] = new Object();
		locationdata['themedata'] = new Object();
		locationdata['coursedata'] = new Object();
		locationdata['myfavodata'] = new Object();
		locationdata['mycoursedata'] = new Object();
		locationdata['commentdata'] = new Object();
		locationdata['stampdata'] = new Object();
		locationdata['searchdata'] = new Object();
		locationdata['viewdata'] = new Array();
		locationdata['toast'] = new Array();

		$('.btn_search').attr('href',`javascript:getSearchList(0,'search');`);
		TrssMissionCheck();
		// 최초 데이터 로딩
		defaultCheck();

	}


	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {

		var gaddress = '';
		var gaddress2 = '';

		if (status === kakao.maps.services.Status.OK) {

			for(var i = 0; i < result.length; i++) {
				// 행정동의 region_type 값은 'H' 이므로
				if (result[i].region_type === 'H') {
					gaddress = result[i].region_1depth_name;
					gaddress2 = result[i].region_2depth_name;
					break;
				}
			}
		}
		goSettingAreaCode(gaddress, gaddress2);
	}



	$('.map_cont_wrap .btn_fold').click(function(){
		var contW = $('.map_cont_wrap');
		if(!contW.hasClass('close')){
			$('.map_cont_wrap').addClass('close');
			$(this).text('펼치기');

		}else{
			$('.map_cont_wrap').removeClass('close');
			$(this).text('접기');
		}
	});

	const kakaoMapLink = document.querySelector('#map')
	const observer = new MutationObserver(function(mutations) {
		const kakaoLinkElement = document.querySelector('a[href="http://map.kakao.com/"]')
		kakaoLinkElement.setAttribute('tabindex', "-1")
		observer.disconnect()
	});
	observer.observe(kakaoMapLink, { attributes: true, childList: true, characterData: true });
	

</script>
</body>
</html>