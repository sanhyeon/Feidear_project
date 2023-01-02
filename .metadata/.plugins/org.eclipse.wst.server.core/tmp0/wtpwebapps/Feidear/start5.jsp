<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html lang="ko"><head><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><title>카테고리별 장소 검색하기 - Kakao 지도 Web API</title><link href="https://apis.map.kakao.com/favicon.ico" rel="shortcut icon"><meta name="viewport" content="width=720"><meta property="og:type" content="website"><meta property="og:title" content="Kakao 지도 API"><meta property="og:description" content="Kakao 지도 API를 이용해보세요. 다양한 샘플과 상세한 매뉴얼로 개발자분들의 시간을 아껴드리겠습니다!"><meta property="og:image" content="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/daumMapsApi.png"><meta property="og:url" content="https://apis.map.kakao.com"><meta name="twitter:card" content="summary_large_image"><meta name="twitter:title" content="Kakao 지도 API"><meta name="twitter:description" content="Kakao 지도 API를 이용해보세요. 다양한 샘플과 상세한 매뉴얼로 개발자분들의 시간을 아껴드리겠습니다!"><meta name="twitter:image" content="https://apis.map.kakao.com/images/daumMapsApiThumb.png"><meta name="twitter:url" content="https://apis.map.kakao.com"><link rel="stylesheet" type="text/css" href="//t1.daumcdn.net/mapapisdoc/cssjs/1657160418816/css/service.min.css"><script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f54e5fa70f300c6bceae2d75423344ec&libraries=services,clusterer,drawing"></script><script type="text/javascript" src="//s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.11.0.js"></script><script type="text/javascript" src="//s1.daumcdn.net/svc/original/U0301/cssjs/JSON-js/fc535e9cc8/json2.min.js"></script><style>.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}</style></head><body class="web sample_snippet" data-page_section="web" data-page_type="sample_snippet" data-title="카테고리별 장소 검색하기"><div id="daumGnb"><h1 id="logo"><a href="/"><div class="kakao">Kakao</div>Maps API</a></h1><ul id="gnbMenu"><li id="menuAbout" class=""><a href="/web/"><svg viewbox="0 0 86 42"><path fill="#302A24" d="M54.6,26.3l-10.8-11c-0.2-0.2-0.5-0.2-0.8-0.1c-0.2-0.1-0.6-0.1-0.8,0.1l-10.8,11c-0.3,0.3-0.3,0.7,0,1c0.3,0.3,0.7,0.3,0.9,0L43,16.5l10.7,10.8c0.3,0.3,0.7,0.3,0.9,0C54.9,27,54.9,26.6,54.6,26.3z M36,26.1c-0.4,0-0.7,0.3-0.7,0.7v9.4c0,0.4,0.3,0.7,0.7,0.7s0.7-0.3,0.7-0.7v-9.4C36.6,26.4,36.3,26.1,36,26.1z M50,26.1c-0.4,0-0.7,0.3-0.7,0.7v9.4c0,0.4,0.3,0.7,0.7,0.7s0.7-0.3,0.7-0.7v-9.4C50.7,26.4,50.4,26.1,50,26.1z M40.7,28.1c-0.4,0-0.7,0.3-0.7,0.7v6.7h-2.7c-0.4,0-0.7,0.3-0.7,0.7c0,0.4,0.3,0.7,0.7,0.7h3.4c0.4,0,0.7-0.3,0.7-0.7v-7.3C41.3,28.4,41,28.1,40.7,28.1z M48.7,35.5H46v-6.7c0-0.4-0.3-0.7-0.7-0.7H42c-0.4,0-0.7,0.3-0.7,0.7c0,0.4,0.3,0.7,0.7,0.7h2.7v6.7c0,0.4,0.3,0.7,0.7,0.7h3.4c0.4,0,0.7-0.3,0.7-0.7C49.4,35.8,49.1,35.5,48.7,35.5z"></path></svg> About</a></li><li id="menuGuide" class=""><a href="/web/guide"><svg viewbox="0 0 86 42"><path fill="#302A24" d="M52.5,19.4l-6-2.4c-0.3,0-0.5,0.1-0.8,0.2C45.5,17.1,45.3,17,45,17l-6,2.4c-0.3,0-0.5,0.1-0.8,0.2c-0.2-0.1-0.5-0.2-0.7-0.2l-6-2.4c-0.8,0-1.5,0.7-1.5,1.6v15.5c0,0.9,0.7,1.6,1.5,1.6l6,2.4c0.3,0,0.5-0.1,0.7-0.2c0.2,0.1,0.5,0.2,0.8,0.2l6-2.4c0.3,0,0.5-0.1,0.7-0.2c0.2,0.1,0.5,0.2,0.8,0.2l6,2.4c0.8,0,1.5-0.7,1.5-1.6V20.9C54,20.1,53.3,19.4,52.5,19.4z M37.5,36.4l-6-2.4V18.6l6,2.4V36.4z M45,34.1l-6,2.4V20.9l6-2.4V34.1z M52.5,36.4l-6-2.4V18.6l6,2.4V36.4z"></path></svg> Guide</a></li><li id="menuSample" class="selected"><a href="/web/sample"><svg viewbox="0 0 86 42"><path fill="#302A24" d="M40.1,32.5l1-1.1l-3.5-4h0.1c-1.5-1.4-2.5-3.3-2.5-5.6c0-4.1,3.3-7.4,7.4-7.4c4.1,0,7.4,3.3,7.4,7.4c0,2.2-1,4.2-2.5,5.6h0.1L42.5,33l0,0l-1,1.1l1,1.2l6.5-7.6c1.4-1.6,2.2-3.6,2.2-5.9c0-4.9-3.9-8.8-8.7-8.8c-4.8,0-8.7,3.9-8.7,8.8c0,2.3,0.9,4.4,2.3,5.9L40.1,32.5z M50.3,32H48l-1,1.4h2.4l2.3,4.2H33.3l2.3-4.2H38L37,32h-2.3L31,39h23L50.3,32z M46.2,21.8c0-2-1.6-3.7-3.7-3.7c-2,0-3.7,1.7-3.7,3.7s1.6,3.7,3.7,3.7C44.5,25.5,46.2,23.9,46.2,21.8z M40.2,21.8c0-1.3,1-2.3,2.3-2.3c1.3,0,2.3,1,2.3,2.3c0,1.3-1,2.3-2.3,2.3C41.2,24.1,40.2,23.1,40.2,21.8z"></path></svg> Sample</a></li><li id="menuDocs" class=""><a href="/web/documentation"><svg viewbox="0 0 86 42"><path fill="#302A24" d="M52.2,16H37c-0.5,0-0.8,0.4-0.8,0.8c0,0.5,0.4,0.8,0.8,0.8h14.3V32c0,0.5,0.4,0.8,0.8,0.8c0.5,0,0.8-0.4,0.8-0.8V16.8C53,16.4,52.6,16,52.2,16z M48.8,19.4H33.7c-0.2,0-0.3,0.1-0.4,0.1c-0.1-0.1-0.3-0.1-0.4-0.1c-0.5,0-0.8,0.4-0.8,0.8v16c0,0.5,0.4,0.8,0.8,0.8h16c0.5,0,0.8-0.4,0.8-0.8v-16C49.6,19.7,49.3,19.4,48.8,19.4z M48,35.3H33.7V21H48V35.3z M37,25.2h7.6c0.5,0,0.8-0.4,0.8-0.8c0-0.5-0.4-0.8-0.8-0.8H37c-0.5,0-0.8,0.4-0.8,0.8C36.2,24.9,36.6,25.2,37,25.2zM37,28.6h7.6c0.5,0,0.8-0.4,0.8-0.8c0-0.5-0.4-0.8-0.8-0.8H37c-0.5,0-0.8,0.4-0.8,0.8C36.2,28.2,36.6,28.6,37,28.6z M37,32h7.6c0.5,0,0.8-0.4,0.8-0.8s-0.4-0.8-0.8-0.8H37c-0.5,0-0.8,0.4-0.8,0.8S36.6,32,37,32z"></path></svg> Docs</a></li><li id="menuWizard" class=""><a href="/web/wizard"><svg viewbox="0 0 86 42"><path fill="#302A24" d="M55.1,39.8c-0.4,0.4-0.9,0.4-1.3,0.1L43.9,30c-0.3-0.3-0.3-0.9,0.1-1.3c0.4-0.4,0.9-0.4,1.3-0.1l9.9,9.9C55.5,38.9,55.5,39.5,55.1,39.8zM52.3,26.8l-7.8,2.4L42,37.1l-4.7-6.7l-8.2,0.1l4.9-6.6l-2.6-7.8l7.8,2.6l6.6-4.9l-0.1,8.2L52.3,26.8zM43.4,28.2l5.9-1.8l-5.1-3.6l0.1-6.2l-5,3.7l-5.9-2l2,5.9l-3.7,5L38,29l3.6,5.1L43.4,28.2z"></path></svg> Wizard</a></li><li id="menuNews" class=""><a href="/web/news"><svg viewbox="0 0 86 42"><path fill="#302A24" d="M45.9,38.5c-0.2,0-0.4-0.1-0.5-0.2l-3.7-3.6h-6.3c-3.6,0-6.5-2.8-6.5-6.2v-6.8c0-3.4,2.9-6.2,6.5-6.2h13.2c3.6,0,6.5,2.8,6.5,6.2v6.8c0,3.3-2.7,6-6.1,6.2l-2.5,3.5C46.4,38.3,46.2,38.4,45.9,38.5C46,38.4,45.9,38.5,45.9,38.5z M35.4,16.8c-2.8,0-5.1,2.1-5.1,4.8v6.8c0,2.6,2.3,4.8,5.1,4.8H42c0.2,0,0.4,0.1,0.5,0.2l3.2,3.1l2.2-3.1c0.1-0.2,0.4-0.3,0.6-0.3c2.8,0,5.1-2.1,5.1-4.8v-6.8c0-2.6-2.3-4.8-5.1-4.8L35.4,16.8L35.4,16.8zM39.2,20.4h1.5l3.7,6l0,0v-6h1.4v8.1h-1.5l-3.7-6l0,0v6h-1.4V20.4z"></path></svg> News</a></li></ul><ul id="gnbLink"><li id="linkQna"><a href="https://devtalk.kakao.com/c/map-api" target="_blank"><svg viewbox="0 0 34.4 31.5"><path fill="#EF4136" d="M21,16.6c-0.6-0.5-0.9-0.8-0.9-0.8s-3.9,2.5-6.6,2.5c-2.6,0-6.6-2.5-6.6-2.5s-2.6,2.5-5.3,3.7c-1.7,0.8-1.8,3.1-1.6,4.7c0,0.1,0,0.2,0,0.3c0,0.4,0.1,0.7,0.3,1.1c0,0.1,0,0.2,0,0.2h0C0.8,26.5,1.6,27,2.6,27H18c-0.3-0.9-0.5-2-0.5-3C17.5,21,18.9,18.4,21,16.6zM8.1,12.1c1.1,1.9,3,3.7,5.4,3.7c2.4,0,4.2-1.8,5.4-3.7h1.2l1.3-3.7l-1.3-1.2c0-0.3,0-0.4-0.1-0.5c0,0,0-0.1,0-0.1c0-0.2,0-0.4-0.1-0.6h0.1c0,0,0.1-2.7-1.3-3.7c-0.2-0.1-0.4-0.2-0.6-0.3C16.9,0.7,15.3,0,13.5,0C11.7,0,10,0.7,8.9,1.9C8.6,2,8.4,2.1,8.2,2.2C7.4,3,7,4.5,6.9,5.9c0,0.4,0,1.1,0,1.2L5.6,8.4l1.3,3.7H8.1z"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M27,16.6c4.1,0,7.4,3.3,7.4,7.4s-3.3,7.4-7.4,7.4s-7.4-3.3-7.4-7.4S22.9,16.6,27,16.6z M26.9,29.6c-0.6,0-1.1-0.5-1.1-1.1c0-0.6,0.5-1.1,1.1-1.1s1.1,0.5,1.1,1.1C28,29.1,27.5,29.6,26.9,29.6zM27.9,26.8h-2v-0.1c0-0.9,0.1-1.5,0.3-2c0.2-0.4,0.5-0.8,1.1-1.4l0.5-0.5c0.2-0.2,0.3-0.4,0.4-0.6c0.1-0.2,0.1-0.5,0.1-0.6c0-0.4-0.1-0.8-0.3-1.1c-0.2-0.3-0.6-0.4-1-0.4c-1,0-1.5,0.7-1.5,2.1l0,0.1h-1.9v-0.1c0-1.1,0.3-2.1,0.9-2.7c0.6-0.7,1.5-1,2.5-1c1.1,0,1.9,0.3,2.5,0.9c0.6,0.6,0.8,1.3,0.8,2.2c0,0.6-0.2,1.1-0.5,1.6c-0.2,0.3-0.6,0.7-1.1,1.2c-0.6,0.6-0.9,1.4-0.9,2.4V26.8z"></path></svg> 문의하기</a></li><li id="linkKey"><a href="https://developers.kakao.com/console/app" target="_blank"><svg viewbox="0 0 35 35"><path fill-rule="evenodd" clip-rule="evenodd" fill="#EF4136" d="M17.5,0C27.2,0,35,7.8,35,17.5S27.2,35,17.5,35C7.8,35,0,27.2,0,17.5S7.8,0,17.5,0z M19.1,19.6L15.7,23h-2.2v2.2h-2.2v2.2H7.6v-3.7l7.8-7.9c-0.3-0.7-0.4-1.4-0.4-2.2c0-3.5,2.8-6.3,6.3-6.3s6.3,2.8,6.3,6.3S24.8,20,21.3,20C20.5,20,19.8,19.8,19.1,19.6L19.1,19.6L19.1,19.6z M25.4,11.8c0-1.2-1-2.2-2.2-2.2c-1.2,0-2.2,1-2.2,2.2s1,2.2,2.2,2.2C24.4,14,25.4,13,25.4,11.8L25.4,11.8z"></path></svg> 키발급</a></li><li id="linkWeb" class="selected"><a href="/web/"><svg viewbox="0 0 23.7 14.7"><path d="M8.3,12.3L0,8.2V6.2l8.3-4v2.6L3,7.2l5.3,2.6V12.3z M14.5,0L11,14.7H9.1L12.6,0L14.5,0z M23.7,8.2l-8.3,4.1V9.9l5.5-2.7l-5.5-2.8V2.1l8.3,4.1V8.2z"></path></svg> Web</a></li><li id="linkAndroid" class=""><a href="/android/"><svg viewbox="0 0 546.1 644.6"><path fill="#25B2DA" d="M546.1,417.1c-0.3,1.3-0.7,2.5-0.9,3.8c-3.2,20.8-21,34.6-43,33.3c-19.1-1.1-35.6-18.1-36-37.7c-0.4-23.5-0.2-47-0.2-70.5c0-32.8-0.2-65.6,0.1-98.4c0.2-19.1,13.5-34.9,31.7-38.6c21.9-4.4,42.7,9.4,47.1,31.2c0.3,1.6,0.8,3.2,1.2,4.8C546.1,302.4,546.1,359.7,546.1,417.1z M273.2,215.9c57.2,0,114.3,0,171.5,0c7.5,0,7.5,0,7.5,7.5c0,82.6,0,165.3,0,247.9c0,23.5-14.6,42.3-36.3,45.3c-9.3,1.3-19,0.5-28.4,0.5c-8.2,0.1-8.2,0-8.2,8.2c0,26.5,0.1,53,0,79.5c-0.1,16.6-9.8,30.5-25.4,36.7c-14.8,5.9-32.1,2.1-43.2-9.6c-7-7.5-10.7-16.3-10.7-26.7c0.1-27,0-54,0-81c0-7-0.2-7.1-6.9-7.1c-13.7,0-27.3,0.2-41-0.1c-4.7-0.1-6,1.6-6,6.1c0.2,27,0.3,54,0,81c-0.2,15.9-7.5,28.3-21.8,35.6c-13.8,7.1-27.8,6.2-40.7-2.6c-12-8.2-17.4-20.3-17.4-34.7c-0.1-25.8,0-51.7,0-77.5c0-7.8,0-7.8-8.1-7.8c-7.2,0-14.3,0-21.5,0c-23.5-0.1-42.5-18.6-42.5-42.1c-0.1-84.3,0-168.6-0.2-252.9c0-5.3,2.1-6.3,6.8-6.3C158.2,216,215.7,215.9,273.2,215.9z M272.6,202c-57,0-113.9,0-170.9,0c-8.6,0-8.3,0-7.9-8.7c1.9-34.5,14.4-64.8,36.4-91.2c13.8-16.5,29.9-30.4,48.9-40.6c5.8-3.1,5.9-3.2,2.7-9.1c-7.4-13.6-14.9-27.1-22.3-40.7c-3.2-5.9-3-9.3,0.1-11.1c3.4-1.8,6-0.1,9.3,5.8c7.8,14.3,15.8,28.6,23.4,43c2.1,4,4.5,3.4,7.8,2.1c23.5-9.8,48.2-14.3,73.6-14.2c24,0.1,47.4,4.4,69.7,13.3c7.7,3.1,7.6,3,11.7-4.5c7.4-13.6,14.9-27.2,22.3-40.7c0.3-0.6,0.6-1.2,1-1.8c1.8-3.2,4.5-4.6,7.9-2.8c3.3,1.8,3.2,4.8,1.6,7.8c-4.8,8.8-9.5,17.6-14.3,26.3c-3.5,6.4-6.9,12.9-10.6,19.2c-1.8,3-1.3,4.6,1.7,6.3c12.2,6.9,23.6,14.8,34.1,24.3c22.8,20.6,38.7,45.5,47.4,75c3.3,11.1,4.8,22.4,5.9,33.9c0.7,7.8,0.3,8.3-7.5,8.3C387.2,202,329.9,202,272.6,202z M339.3,121.7c0,9.3,6,15.4,15.2,15.4c8.6-0.1,15.4-6.7,15.4-15c0-8.3-7.4-15.8-15.6-15.7C345.9,106.5,339.3,113.3,339.3,121.7z M191.2,107.1c-9,0.1-15,6.1-15,15c0,8.6,6.7,15.1,15.3,14.9c8.5-0.2,14.7-6.4,14.7-15C206.2,113,200.2,107,191.2,107.1z M79.3,331.7c0,27.6,0,55.3,0,82.9c0,22.5-17.1,39.6-39.4,39.6c-22.4,0-39.8-17.1-39.8-39.4C0,359.3,0,303.7,0.1,248c0-21.1,15.2-37.6,36.5-39.8c19.3-2.1,38.1,12.3,42.1,32.1c0.6,2.7,0.6,5.6,0.6,8.4C79.3,276.4,79.3,304,79.3,331.7z"></path></svg> Android</a></li><li id="linkIos" class=""><a href="/ios/"><svg viewbox="0 0 284 334"><path fill="#25B2DA" d="M209,334c-2.7,0-5.3,0-8,0c-9.5-3.6-19-7.1-28.4-11c-14.7-6.1-29.6-4.9-44.3-0.9c-11,3-21.6,7.8-32.3,11.8c-2.7,0-5.3,0-8,0c-16-3.4-27.8-13.1-37.5-25.4c-7.5-9.5-14.3-19.6-20.4-30.1C8.3,240.6-2.6,200.3,4,156.3c3.6-23.7,13.8-44,32.1-59.7c13-11.2,28.4-16.6,45.5-17.8c15.9-1.1,30.5,3.5,45,9.1c12.4,4.8,24.6,5.7,37.2,0.4c5.8-2.4,11.9-4,17.9-5.9c22.6-7.2,44.8-6.5,66.2,4.4c10.7,5.5,19.1,13.5,26.4,23c-55.8,41.3-44.2,112.9,8.8,133.9c-7.7,19.3-16.4,38.1-28.2,55.3C243.3,315.6,230.1,329.9,209,334z M141.4,80.9c-2.3-43.3,30.4-76.2,66.2-77.6C212.5,40.8,177.3,82.8,141.4,80.9z"></path></svg> ios</a></li></ul></div><div id="daumBody" class="divided"><div class="panel_search"><div id="boxSearch"><input type="text" id="query" class="tf_query" title="검색어 입력" placeholder="sample name.." name="" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false"> <button type="button" class="btn_reset"><span class="ico_del">검색어 지우기</span></button><div type="button" class="btn_dummy_search"><span class="ico_sch">검색하기</span></div></div></div><div id="daumSubmenu"><div data-depth1="지도" class="first"><strong>지도</strong><ul><li data-depth2="지도 생성하기"><a href="/web/sample/basicMap/">지도 생성하기</a></li><li data-depth2="지도 이동시키기"><a href="/web/sample/moveMap/">지도 이동시키기</a></li><li data-depth2="지도 레벨 바꾸기"><a href="/web/sample/changeLevel/">지도 레벨 바꾸기</a></li><li data-depth2="지도 정보 얻어오기"><a href="/web/sample/mapInfo/">지도 정보 얻어오기</a></li><li data-depth2="지도에 컨트롤 올리기"><a href="/web/sample/addMapControl/">지도에 컨트롤 올리기</a></li><li data-depth2="지도에 사용자 컨트롤 올리기"><a href="/web/sample/addMapCustomControl/">지도에 사용자 컨트롤 올리기</a></li><li data-depth2="지도 이동 막기"><a href="/web/sample/disableMapDragMove/">지도 이동 막기</a></li><li data-depth2="지도 확대 축소 막기"><a href="/web/sample/enableDisableZoomInOut/">지도 확대 축소 막기</a></li><li data-depth2="지도에 교통정보 표시하기"><a href="/web/sample/addTrafficOverlay/">지도에 교통정보 표시하기</a></li><li data-depth2="지도에 로드뷰 도로 표시하기"><a href="/web/sample/addRoadviewOverlay/">지도에 로드뷰 도로 표시하기</a></li><li data-depth2="지도에 지형도 표시하기"><a href="/web/sample/addTerrainOverlay/">지도에 지형도 표시하기</a></li><li data-depth2="지도 타입 바꾸기1"><a href="/web/sample/changeOverlay1/">지도 타입 바꾸기1</a></li><li data-depth2="지도 타입 바꾸기2"><a href="/web/sample/changeOverlay2/">지도 타입 바꾸기2</a></li><li data-depth2="지도 범위 재설정 하기"><a href="/web/sample/setBounds/">지도 범위 재설정 하기</a></li><li data-depth2="지도 영역 크기 동적 변경하기"><a href="/web/sample/mapRelayout/">지도 영역 크기 동적 변경하기</a></li><li data-depth2="클릭 이벤트 등록하기"><a href="/web/sample/addMapClickEvent/">클릭 이벤트 등록하기</a></li><li data-depth2="클릭한 위치에 마커 표시하기"><a href="/web/sample/addMapClickEventWithMarker/">클릭한 위치에 마커 표시하기</a></li><li data-depth2="이동 이벤트 등록하기"><a href="/web/sample/addMapDragendEvent/">이동 이벤트 등록하기</a></li><li data-depth2="확대, 축소 이벤트 등록하기"><a href="/web/sample/addMapZoomChangedEvent/">확대, 축소 이벤트 등록하기</a></li><li data-depth2="중심좌표 변경 이벤트 등록하기"><a href="/web/sample/addMapCenterChangedEvent/">중심좌표 변경 이벤트 등록하기</a></li><li data-depth2="영역 변경 이벤트 등록하기"><a href="/web/sample/addMapBoundsChangedEvent/">영역 변경 이벤트 등록하기</a></li><li data-depth2="타일로드 이벤트 등록하기"><a href="/web/sample/addTilesloadedEvent/">타일로드 이벤트 등록하기</a></li><li data-depth2="커스텀 타일셋1"><a href="/web/sample/customTileset/">커스텀 타일셋1</a></li><li data-depth2="커스텀 타일셋2"><a href="/web/sample/getTile/">커스텀 타일셋2</a></li></ul></div><div data-depth1="오버레이" class=""><strong>오버레이</strong><ul><li data-depth2="마커 생성하기"><a href="/web/sample/basicMarker/">마커 생성하기</a></li><li data-depth2="드래그 가능한 마커 생성하기"><a href="/web/sample/draggableMarker/">드래그 가능한 마커 생성하기</a></li><li data-depth2="다른 이미지로 마커 생성하기"><a href="/web/sample/basicMarkerImage/">다른 이미지로 마커 생성하기</a></li><li data-depth2="인포윈도우 생성하기"><a href="/web/sample/basicInfoWindow/">인포윈도우 생성하기</a></li><li data-depth2="마커에 인포윈도우 표시하기"><a href="/web/sample/markerWithInfoWindow/">마커에 인포윈도우 표시하기</a></li><li data-depth2="마커에 클릭 이벤트 등록하기"><a href="/web/sample/addMarkerClickEvent/">마커에 클릭 이벤트 등록하기</a></li><li data-depth2="마커에 마우스 이벤트 등록하기"><a href="/web/sample/addMarkerMouseEvent/">마커에 마우스 이벤트 등록하기</a></li><li data-depth2="draggable 마커 이벤트 적용하기"><a href="/web/sample/addDraggableMarkerDragEvent/">draggable 마커 이벤트 적용하기</a></li><li data-depth2="geolocation으로 마커 표시하기"><a href="/web/sample/geolocationMarker/">geolocation으로 마커 표시하기</a></li><li data-depth2="여러개 마커 표시하기"><a href="/web/sample/multipleMarkerImage/">여러개 마커 표시하기</a></li><li data-depth2="여러개 마커 제어하기"><a href="/web/sample/multipleMarkerControl/">여러개 마커 제어하기</a></li><li data-depth2="여러개 마커에 이벤트 등록하기1"><a href="/web/sample/multipleMarkerEvent/">여러개 마커에 이벤트 등록하기1</a></li><li data-depth2="여러개 마커에 이벤트 등록하기2"><a href="/web/sample/multipleMarkerEvent2/">여러개 마커에 이벤트 등록하기2</a></li><li data-depth2="다양한 이미지 마커 표시하기"><a href="/web/sample/categoryMarker/">다양한 이미지 마커 표시하기</a></li><li data-depth2="원, 선, 사각형, 다각형 표시하기"><a href="/web/sample/drawShape/">원, 선, 사각형, 다각형 표시하기</a></li><li data-depth2="선의 거리 계산하기"><a href="/web/sample/calculatePolylineDistance/">선의 거리 계산하기</a></li><li data-depth2="다각형의 면적 계산하기"><a href="/web/sample/calculatePolygonArea/">다각형의 면적 계산하기</a></li><li data-depth2="다각형에 이벤트 등록하기1"><a href="/web/sample/addPolygonMouseEvent1/">다각형에 이벤트 등록하기1</a></li><li data-depth2="다각형에 이벤트 등록하기2"><a href="/web/sample/addPolygonMouseEvent2/">다각형에 이벤트 등록하기2</a></li><li data-depth2="원의 반경 계산하기"><a href="/web/sample/calculateCircleRadius/">원의 반경 계산하기</a></li><li data-depth2="커스텀 오버레이 생성하기1"><a href="/web/sample/customOverlay1/">커스텀 오버레이 생성하기1</a></li><li data-depth2="커스텀 오버레이 생성하기2"><a href="/web/sample/customOverlay2/">커스텀 오버레이 생성하기2</a></li><li data-depth2="닫기가 가능한 커스텀 오버레이"><a href="/web/sample/removableCustomOverlay/">닫기가 가능한 커스텀 오버레이</a></li><li data-depth2="이미지 마커와 커스텀 오버레이"><a href="/web/sample/markerWithCustomOverlay/">이미지 마커와 커스텀 오버레이</a></li><li data-depth2="커스텀오버레이를 드래그 하기"><a href="/web/sample/dragCustomOverlay/">커스텀오버레이를 드래그 하기</a></li><li data-depth2="지도 영역 밖의 마커위치 추적하기"><a href="/web/sample/markerTracker/">지도 영역 밖의 마커위치 추적하기</a></li><li data-depth2="구멍난 다각형 만들기"><a href="/web/sample/donut/">구멍난 다각형 만들기</a></li></ul></div><div data-depth1="로드뷰" class=""><strong>로드뷰</strong><ul><li data-depth2="로드뷰 생성하기"><a href="/web/sample/basicRoadview/">로드뷰 생성하기</a></li><li data-depth2="로드뷰 도로를 이용하여 로드뷰 생성하기"><a href="/web/sample/basicRoadview2/">로드뷰 도로를 이용하여 로드뷰 생성하기</a></li><li data-depth2="동동이를 이용하여 로드뷰와 지도 연동하기"><a href="/web/sample/moveRoadview/">동동이를 이용하여 로드뷰와 지도 연동하기</a></li><li data-depth2="로드뷰에 마커와 인포윈도우 올리기"><a href="/web/sample/roadviewOverlay1/">로드뷰에 마커와 인포윈도우 올리기</a></li><li data-depth2="마커의 고도와 반경 조절하기"><a href="/web/sample/roadviewOverlay2/">마커의 고도와 반경 조절하기</a></li><li data-depth2="로드뷰에 커스텀오버레이 올리기"><a href="/web/sample/roadviewCustomOverlay/">로드뷰에 커스텀오버레이 올리기</a></li><li data-depth2="로드뷰에 이미지 올리기"><a href="/web/sample/roadviewImageOverlay/">로드뷰에 이미지 올리기</a></li><li data-depth2="지도 위 버튼으로 로드뷰 표시하기"><a href="/web/sample/roadviewWithMapButton/">지도 위 버튼으로 로드뷰 표시하기</a></li><li data-depth2="로드뷰와 지도 토글하기"><a href="/web/sample/roadviewToggle/">로드뷰와 지도 토글하기</a></li></ul></div><div data-depth1="정적지도" class=""><strong>정적지도</strong><ul><li data-depth2="이미지 지도 생성하기"><a href="/web/sample/staticMap/">이미지 지도 생성하기</a></li><li data-depth2="이미지 지도에 마커 표시하기"><a href="/web/sample/staticMapWithMarker/">이미지 지도에 마커 표시하기</a></li><li data-depth2="마커와 텍스트 표시하기"><a href="/web/sample/staticMapWithMarkerText/">마커와 텍스트 표시하기</a></li></ul></div><div data-depth1="라이브러리" class=""><strong>라이브러리</strong><ul><li data-depth2="키워드로 장소검색하기"><a href="/web/sample/keywordBasic/">키워드로 장소검색하기</a></li><li data-depth2="키워드로 장소검색하고 목록으로 표출하기"><a href="/web/sample/keywordList/">키워드로 장소검색하고 목록으로 표출하기</a></li><li data-depth2="카테고리로 장소 검색하기"><a href="/web/sample/categoryBasic/">카테고리로 장소 검색하기</a></li><li data-depth2="카테고리별 장소 검색하기"><a class="on" href="/web/sample/categoryFromBounds/">카테고리별 장소 검색하기</a></li><li data-depth2="주소로 장소 표시하기"><a href="/web/sample/addr2coord/">주소로 장소 표시하기</a></li><li data-depth2="좌표로 주소를 얻어내기"><a href="/web/sample/coord2addr/">좌표로 주소를 얻어내기</a></li><li data-depth2="WTM 좌표를 WGS84 좌표로 변환하기"><a href="/web/sample/transCoord/">WTM 좌표를 WGS84 좌표로 변환하기</a></li><li data-depth2="마커 클러스터러 사용하기"><a href="/web/sample/basicClusterer/">마커 클러스터러 사용하기</a></li><li data-depth2="마커 클러스터러에 클릭이벤트 추가하기"><a href="/web/sample/addClustererClickEvent/">마커 클러스터러에 클릭이벤트 추가하기</a></li><li data-depth2="클러스터 마커에 텍스트 표시하기"><a href="/web/sample/chickenClusterer/">클러스터 마커에 텍스트 표시하기</a></li><li data-depth2="Drawing Library 사용하기"><a href="/web/sample/basicDrawingLibrary/">Drawing Library 사용하기</a></li><li data-depth2="Drawing Library에서 데이터 얻기"><a href="/web/sample/drawingGetData/">Drawing Library에서 데이터 얻기</a></li><li data-depth2="Toolbox 사용하기"><a href="/web/sample/drawingToolbox/">Toolbox 사용하기</a></li><li data-depth2="Drawing undo, redo"><a href="/web/sample/drawingUndo/">Drawing undo, redo</a></li></ul></div></div><div id="daumContent"><h2>카테고리별 장소 검색하기</h2><p>지도에 'idle' 이벤트를 등록해서 지도의 중심이나 확대수준이 변경되었을 때 마다 사용자가 선택한 카테고리에 해당하는 장소를 검색하여 검색결과를 마커로 표시합니다. 마커를 클릭하면 장소정보를 커스텀 오버레이로 표시합니다.</p><p style="margin-top:-12px"><em class="link"><a href="/web/documentation/#CategoryCode" target="_blank">카테고리 코드목록을 보시려면 여기를 클릭하세요!</a></em></p><div class="map_wrap"><div id="map" style="width:100%;height:100%;position:relative;overflow:hidden"></div><ul id="category"><li id="AD5" data-order="0"><span class="category_bg hotel"></span> 숙박</li><li id="FD6" data-order="1"><span class="category_bg restaurant"></span> 맛집</li><li id="PK6" data-order="2"><span class="category_bg parking"></span> 주차장</li><li id="OL7" data-order="3"><span class="category_bg oil"></span> 주유소</li><li id="AT4" data-order="4"><span class="category_bg tourslist spoy"></span> 관광지</li><li id="CS2" data-order="5"><span class="category_bg trip"></span> 편의점</li></ul></div><div class="wrap_tab"><![if gt ie 9]><a id="showLive" href="#" target="_blank" data-appkey="326e38503f420e1f0088dab1f46dc0c7" data-name="categoryFromBounds">직접 해보기</a> <![endif]><h4 class="tab">Javascript</h4><div class="tabbody"><figure class="highlight"><pre><code class="language-js" data-lang="js"><span></span><span class="c1">// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다</span>
<span class="kd">var</span> <span class="nx">placeOverlay</span> <span class="o">=</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">CustomOverlay</span><span class="p">({</span><span class="nx">zIndex</span><span class="o">:</span><span class="mf">1</span><span class="p">}),</span> 
    <span class="nx">contentNode</span> <span class="o">=</span> <span class="nb">document</span><span class="p">.</span><span class="nx">createElement</span><span class="p">(</span><span class="s1">&#39;div&#39;</span><span class="p">),</span> <span class="c1">// 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 </span>
    <span class="nx">markers</span> <span class="o">=</span> <span class="p">[],</span> <span class="c1">// 마커를 담을 배열입니다</span>
    <span class="nx">currCategory</span> <span class="o">=</span> <span class="s1">&#39;&#39;</span><span class="p">;</span> <span class="c1">// 현재 선택된 카테고리를 가지고 있을 변수입니다</span>
 
<span class="kd">var</span> <span class="nx">mapContainer</span> <span class="o">=</span> <span class="nb">document</span><span class="p">.</span><span class="nx">getElementById</span><span class="p">(</span><span class="s1">&#39;map&#39;</span><span class="p">),</span> <span class="c1">// 지도를 표시할 div </span>
    <span class="nx">mapOption</span> <span class="o">=</span> <span class="p">{</span>
        <span class="nx">center</span><span class="o">:</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">LatLng</span><span class="p">(</span><span class="mf">37.566826</span><span class="p">,</span> <span class="mf">126.9786567</span><span class="p">),</span> <span class="c1">// 지도의 중심좌표</span>
        <span class="nx">level</span><span class="o">:</span> <span class="mf">5</span> <span class="c1">// 지도의 확대 레벨</span>
    <span class="p">};</span>  

<span class="c1">// 지도를 생성합니다    </span>
<span class="kd">var</span> <span class="nx">map</span> <span class="o">=</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nb">Map</span><span class="p">(</span><span class="nx">mapContainer</span><span class="p">,</span> <span class="nx">mapOption</span><span class="p">);</span> 

<span class="c1">// 장소 검색 객체를 생성합니다</span>
<span class="kd">var</span> <span class="nx">ps</span> <span class="o">=</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">services</span><span class="p">.</span><span class="nx">Places</span><span class="p">(</span><span class="nx">map</span><span class="p">);</span> 

<span class="c1">// 지도에 idle 이벤트를 등록합니다</span>
<span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">event</span><span class="p">.</span><span class="nx">addListener</span><span class="p">(</span><span class="nx">map</span><span class="p">,</span> <span class="s1">&#39;idle&#39;</span><span class="p">,</span> <span class="nx">searchPlaces</span><span class="p">);</span>

<span class="c1">// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 </span>
<span class="nx">contentNode</span><span class="p">.</span><span class="nx">className</span> <span class="o">=</span> <span class="s1">&#39;placeinfo_wrap&#39;</span><span class="p">;</span>

<span class="c1">// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때</span>
<span class="c1">// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 </span>
<span class="nx">addEventHandle</span><span class="p">(</span><span class="nx">contentNode</span><span class="p">,</span> <span class="s1">&#39;mousedown&#39;</span><span class="p">,</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">event</span><span class="p">.</span><span class="nx">preventMap</span><span class="p">);</span>
<span class="nx">addEventHandle</span><span class="p">(</span><span class="nx">contentNode</span><span class="p">,</span> <span class="s1">&#39;touchstart&#39;</span><span class="p">,</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">event</span><span class="p">.</span><span class="nx">preventMap</span><span class="p">);</span>

<span class="c1">// 커스텀 오버레이 컨텐츠를 설정합니다</span>
<span class="nx">placeOverlay</span><span class="p">.</span><span class="nx">setContent</span><span class="p">(</span><span class="nx">contentNode</span><span class="p">);</span>  

<span class="c1">// 각 카테고리에 클릭 이벤트를 등록합니다</span>
<span class="nx">addCategoryClickEvent</span><span class="p">();</span>

<span class="c1">// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다</span>
<span class="kd">function</span> <span class="nx">addEventHandle</span><span class="p">(</span><span class="nx">target</span><span class="p">,</span> <span class="nx">type</span><span class="p">,</span> <span class="nx">callback</span><span class="p">)</span> <span class="p">{</span>
    <span class="k">if</span> <span class="p">(</span><span class="nx">target</span><span class="p">.</span><span class="nx">addEventListener</span><span class="p">)</span> <span class="p">{</span>
        <span class="nx">target</span><span class="p">.</span><span class="nx">addEventListener</span><span class="p">(</span><span class="nx">type</span><span class="p">,</span> <span class="nx">callback</span><span class="p">);</span>
    <span class="p">}</span> <span class="k">else</span> <span class="p">{</span>
        <span class="nx">target</span><span class="p">.</span><span class="nx">attachEvent</span><span class="p">(</span><span class="s1">&#39;on&#39;</span> <span class="o">+</span> <span class="nx">type</span><span class="p">,</span> <span class="nx">callback</span><span class="p">);</span>
    <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 카테고리 검색을 요청하는 함수입니다</span>
<span class="kd">function</span> <span class="nx">searchPlaces</span><span class="p">()</span> <span class="p">{</span>
    <span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="nx">currCategory</span><span class="p">)</span> <span class="p">{</span>
        <span class="k">return</span><span class="p">;</span>
    <span class="p">}</span>
    
    <span class="c1">// 커스텀 오버레이를 숨깁니다 </span>
    <span class="nx">placeOverlay</span><span class="p">.</span><span class="nx">setMap</span><span class="p">(</span><span class="kc">null</span><span class="p">);</span>

    <span class="c1">// 지도에 표시되고 있는 마커를 제거합니다</span>
    <span class="nx">removeMarker</span><span class="p">();</span>
    
    <span class="nx">ps</span><span class="p">.</span><span class="nx">categorySearch</span><span class="p">(</span><span class="nx">currCategory</span><span class="p">,</span> <span class="nx">placesSearchCB</span><span class="p">,</span> <span class="p">{</span><span class="nx">useMapBounds</span><span class="o">:</span><span class="kc">true</span><span class="p">});</span> 
<span class="p">}</span>

<span class="c1">// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다</span>
<span class="kd">function</span> <span class="nx">placesSearchCB</span><span class="p">(</span><span class="nx">data</span><span class="p">,</span> <span class="nx">status</span><span class="p">,</span> <span class="nx">pagination</span><span class="p">)</span> <span class="p">{</span>
    <span class="k">if</span> <span class="p">(</span><span class="nx">status</span> <span class="o">===</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">services</span><span class="p">.</span><span class="nx">Status</span><span class="p">.</span><span class="nx">OK</span><span class="p">)</span> <span class="p">{</span>

        <span class="c1">// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다</span>
        <span class="nx">displayPlaces</span><span class="p">(</span><span class="nx">data</span><span class="p">);</span>
    <span class="p">}</span> <span class="k">else</span> <span class="k">if</span> <span class="p">(</span><span class="nx">status</span> <span class="o">===</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">services</span><span class="p">.</span><span class="nx">Status</span><span class="p">.</span><span class="nx">ZERO_RESULT</span><span class="p">)</span> <span class="p">{</span>
        <span class="c1">// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요</span>

    <span class="p">}</span> <span class="k">else</span> <span class="k">if</span> <span class="p">(</span><span class="nx">status</span> <span class="o">===</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">services</span><span class="p">.</span><span class="nx">Status</span><span class="p">.</span><span class="nx">ERROR</span><span class="p">)</span> <span class="p">{</span>
        <span class="c1">// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요</span>
        
    <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 지도에 마커를 표출하는 함수입니다</span>
<span class="kd">function</span> <span class="nx">displayPlaces</span><span class="p">(</span><span class="nx">places</span><span class="p">)</span> <span class="p">{</span>

    <span class="c1">// 몇번째 카테고리가 선택되어 있는지 얻어옵니다</span>
    <span class="c1">// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다</span>
    <span class="kd">var</span> <span class="nx">order</span> <span class="o">=</span> <span class="nb">document</span><span class="p">.</span><span class="nx">getElementById</span><span class="p">(</span><span class="nx">currCategory</span><span class="p">).</span><span class="nx">getAttribute</span><span class="p">(</span><span class="s1">&#39;data-order&#39;</span><span class="p">);</span>

    

    <span class="k">for</span> <span class="p">(</span> <span class="kd">var</span> <span class="nx">i</span><span class="o">=</span><span class="mf">0</span><span class="p">;</span> <span class="nx">i</span><span class="o">&lt;</span><span class="nx">places</span><span class="p">.</span><span class="nx">length</span><span class="p">;</span> <span class="nx">i</span><span class="o">++</span> <span class="p">)</span> <span class="p">{</span>

            <span class="c1">// 마커를 생성하고 지도에 표시합니다</span>
            <span class="kd">var</span> <span class="nx">marker</span> <span class="o">=</span> <span class="nx">addMarker</span><span class="p">(</span><span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">LatLng</span><span class="p">(</span><span class="nx">places</span><span class="p">[</span><span class="nx">i</span><span class="p">].</span><span class="nx">y</span><span class="p">,</span> <span class="nx">places</span><span class="p">[</span><span class="nx">i</span><span class="p">].</span><span class="nx">x</span><span class="p">),</span> <span class="nx">order</span><span class="p">);</span>

            <span class="c1">// 마커와 검색결과 항목을 클릭 했을 때</span>
            <span class="c1">// 장소정보를 표출하도록 클릭 이벤트를 등록합니다</span>
            <span class="p">(</span><span class="kd">function</span><span class="p">(</span><span class="nx">marker</span><span class="p">,</span> <span class="nx">place</span><span class="p">)</span> <span class="p">{</span>
                <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">event</span><span class="p">.</span><span class="nx">addListener</span><span class="p">(</span><span class="nx">marker</span><span class="p">,</span> <span class="s1">&#39;click&#39;</span><span class="p">,</span> <span class="kd">function</span><span class="p">()</span> <span class="p">{</span>
                    <span class="nx">displayPlaceInfo</span><span class="p">(</span><span class="nx">place</span><span class="p">);</span>
                <span class="p">});</span>
            <span class="p">})(</span><span class="nx">marker</span><span class="p">,</span> <span class="nx">places</span><span class="p">[</span><span class="nx">i</span><span class="p">]);</span>
    <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다</span>
<span class="kd">function</span> <span class="nx">addMarker</span><span class="p">(</span><span class="nx">position</span><span class="p">,</span> <span class="nx">order</span><span class="p">)</span> <span class="p">{</span>
    <span class="kd">var</span> <span class="nx">imageSrc</span> <span class="o">=</span> <span class="s1">&#39;https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png&#39;</span><span class="p">,</span> <span class="c1">// 마커 이미지 url, 스프라이트 이미지를 씁니다</span>
        <span class="nx">imageSize</span> <span class="o">=</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">Size</span><span class="p">(</span><span class="mf">27</span><span class="p">,</span> <span class="mf">28</span><span class="p">),</span>  <span class="c1">// 마커 이미지의 크기</span>
        <span class="nx">imgOptions</span> <span class="o">=</span>  <span class="p">{</span>
            <span class="nx">spriteSize</span> <span class="o">:</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">Size</span><span class="p">(</span><span class="mf">72</span><span class="p">,</span> <span class="mf">208</span><span class="p">),</span> <span class="c1">// 스프라이트 이미지의 크기</span>
            <span class="nx">spriteOrigin</span> <span class="o">:</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">Point</span><span class="p">(</span><span class="mf">46</span><span class="p">,</span> <span class="p">(</span><span class="nx">order</span><span class="o">*</span><span class="mf">36</span><span class="p">)),</span> <span class="c1">// 스프라이트 이미지 중 사용할 영역의 좌상단 좌표</span>
            <span class="nx">offset</span><span class="o">:</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">Point</span><span class="p">(</span><span class="mf">11</span><span class="p">,</span> <span class="mf">28</span><span class="p">)</span> <span class="c1">// 마커 좌표에 일치시킬 이미지 내에서의 좌표</span>
        <span class="p">},</span>
        <span class="nx">markerImage</span> <span class="o">=</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">MarkerImage</span><span class="p">(</span><span class="nx">imageSrc</span><span class="p">,</span> <span class="nx">imageSize</span><span class="p">,</span> <span class="nx">imgOptions</span><span class="p">),</span>
            <span class="nx">marker</span> <span class="o">=</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">Marker</span><span class="p">({</span>
            <span class="nx">position</span><span class="o">:</span> <span class="nx">position</span><span class="p">,</span> <span class="c1">// 마커의 위치</span>
            <span class="nx">image</span><span class="o">:</span> <span class="nx">markerImage</span> 
        <span class="p">});</span>

    <span class="nx">marker</span><span class="p">.</span><span class="nx">setMap</span><span class="p">(</span><span class="nx">map</span><span class="p">);</span> <span class="c1">// 지도 위에 마커를 표출합니다</span>
    <span class="nx">markers</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="nx">marker</span><span class="p">);</span>  <span class="c1">// 배열에 생성된 마커를 추가합니다</span>

    <span class="k">return</span> <span class="nx">marker</span><span class="p">;</span>
<span class="p">}</span>

<span class="c1">// 지도 위에 표시되고 있는 마커를 모두 제거합니다</span>
<span class="kd">function</span> <span class="nx">removeMarker</span><span class="p">()</span> <span class="p">{</span>
    <span class="k">for</span> <span class="p">(</span> <span class="kd">var</span> <span class="nx">i</span> <span class="o">=</span> <span class="mf">0</span><span class="p">;</span> <span class="nx">i</span> <span class="o">&lt;</span> <span class="nx">markers</span><span class="p">.</span><span class="nx">length</span><span class="p">;</span> <span class="nx">i</span><span class="o">++</span> <span class="p">)</span> <span class="p">{</span>
        <span class="nx">markers</span><span class="p">[</span><span class="nx">i</span><span class="p">].</span><span class="nx">setMap</span><span class="p">(</span><span class="kc">null</span><span class="p">);</span>
    <span class="p">}</span>   
    <span class="nx">markers</span> <span class="o">=</span> <span class="p">[];</span>
<span class="p">}</span>

<span class="c1">// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다</span>
<span class="kd">function</span> <span class="nx">displayPlaceInfo</span> <span class="p">(</span><span class="nx">place</span><span class="p">)</span> <span class="p">{</span>
    <span class="kd">var</span> <span class="nx">content</span> <span class="o">=</span> <span class="s1">&#39;&lt;div class=&quot;placeinfo&quot;&gt;&#39;</span> <span class="o">+</span>
                    <span class="s1">&#39;   &lt;a class=&quot;title&quot; href=&quot;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">place_url</span> <span class="o">+</span> <span class="s1">&#39;&quot; target=&quot;_blank&quot; title=&quot;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">place_name</span> <span class="o">+</span> <span class="s1">&#39;&quot;&gt;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">place_name</span> <span class="o">+</span> <span class="s1">&#39;&lt;/a&gt;&#39;</span><span class="p">;</span>   

    <span class="k">if</span> <span class="p">(</span><span class="nx">place</span><span class="p">.</span><span class="nx">road_address_name</span><span class="p">)</span> <span class="p">{</span>
        <span class="nx">content</span> <span class="o">+=</span> <span class="s1">&#39;    &lt;span title=&quot;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">road_address_name</span> <span class="o">+</span> <span class="s1">&#39;&quot;&gt;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">road_address_name</span> <span class="o">+</span> <span class="s1">&#39;&lt;/span&gt;&#39;</span> <span class="o">+</span>
                    <span class="s1">&#39;  &lt;span class=&quot;jibun&quot; title=&quot;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">address_name</span> <span class="o">+</span> <span class="s1">&#39;&quot;&gt;(지번 : &#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">address_name</span> <span class="o">+</span> <span class="s1">&#39;)&lt;/span&gt;&#39;</span><span class="p">;</span>
    <span class="p">}</span>  <span class="k">else</span> <span class="p">{</span>
        <span class="nx">content</span> <span class="o">+=</span> <span class="s1">&#39;    &lt;span title=&quot;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">address_name</span> <span class="o">+</span> <span class="s1">&#39;&quot;&gt;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">address_name</span> <span class="o">+</span> <span class="s1">&#39;&lt;/span&gt;&#39;</span><span class="p">;</span>
    <span class="p">}</span>                
   
    <span class="nx">content</span> <span class="o">+=</span> <span class="s1">&#39;    &lt;span class=&quot;tel&quot;&gt;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">phone</span> <span class="o">+</span> <span class="s1">&#39;&lt;/span&gt;&#39;</span> <span class="o">+</span> 
                <span class="s1">&#39;&lt;/div&gt;&#39;</span> <span class="o">+</span> 
                <span class="s1">&#39;&lt;div class=&quot;after&quot;&gt;&lt;/div&gt;&#39;</span><span class="p">;</span>

    <span class="nx">contentNode</span><span class="p">.</span><span class="nx">innerHTML</span> <span class="o">=</span> <span class="nx">content</span><span class="p">;</span>
    <span class="nx">placeOverlay</span><span class="p">.</span><span class="nx">setPosition</span><span class="p">(</span><span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">LatLng</span><span class="p">(</span><span class="nx">place</span><span class="p">.</span><span class="nx">y</span><span class="p">,</span> <span class="nx">place</span><span class="p">.</span><span class="nx">x</span><span class="p">));</span>
    <span class="nx">placeOverlay</span><span class="p">.</span><span class="nx">setMap</span><span class="p">(</span><span class="nx">map</span><span class="p">);</span>  
<span class="p">}</span>


<span class="c1">// 각 카테고리에 클릭 이벤트를 등록합니다</span>
<span class="kd">function</span> <span class="nx">addCategoryClickEvent</span><span class="p">()</span> <span class="p">{</span>
    <span class="kd">var</span> <span class="nx">category</span> <span class="o">=</span> <span class="nb">document</span><span class="p">.</span><span class="nx">getElementById</span><span class="p">(</span><span class="s1">&#39;category&#39;</span><span class="p">),</span>
        <span class="nx">children</span> <span class="o">=</span> <span class="nx">category</span><span class="p">.</span><span class="nx">children</span><span class="p">;</span>

    <span class="k">for</span> <span class="p">(</span><span class="kd">var</span> <span class="nx">i</span><span class="o">=</span><span class="mf">0</span><span class="p">;</span> <span class="nx">i</span><span class="o">&lt;</span><span class="nx">children</span><span class="p">.</span><span class="nx">length</span><span class="p">;</span> <span class="nx">i</span><span class="o">++</span><span class="p">)</span> <span class="p">{</span>
        <span class="nx">children</span><span class="p">[</span><span class="nx">i</span><span class="p">].</span><span class="nx">onclick</span> <span class="o">=</span> <span class="nx">onClickCategory</span><span class="p">;</span>
    <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 카테고리를 클릭했을 때 호출되는 함수입니다</span>
<span class="kd">function</span> <span class="nx">onClickCategory</span><span class="p">()</span> <span class="p">{</span>
    <span class="kd">var</span> <span class="nx">id</span> <span class="o">=</span> <span class="k">this</span><span class="p">.</span><span class="nx">id</span><span class="p">,</span>
        <span class="nx">className</span> <span class="o">=</span> <span class="k">this</span><span class="p">.</span><span class="nx">className</span><span class="p">;</span>

    <span class="nx">placeOverlay</span><span class="p">.</span><span class="nx">setMap</span><span class="p">(</span><span class="kc">null</span><span class="p">);</span>

    <span class="k">if</span> <span class="p">(</span><span class="nx">className</span> <span class="o">===</span> <span class="s1">&#39;on&#39;</span><span class="p">)</span> <span class="p">{</span>
        <span class="nx">currCategory</span> <span class="o">=</span> <span class="s1">&#39;&#39;</span><span class="p">;</span>
        <span class="nx">changeCategoryClass</span><span class="p">();</span>
        <span class="nx">removeMarker</span><span class="p">();</span>
    <span class="p">}</span> <span class="k">else</span> <span class="p">{</span>
        <span class="nx">currCategory</span> <span class="o">=</span> <span class="nx">id</span><span class="p">;</span>
        <span class="nx">changeCategoryClass</span><span class="p">(</span><span class="k">this</span><span class="p">);</span>
        <span class="nx">searchPlaces</span><span class="p">();</span>
    <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다</span>
<span class="kd">function</span> <span class="nx">changeCategoryClass</span><span class="p">(</span><span class="nx">el</span><span class="p">)</span> <span class="p">{</span>
    <span class="kd">var</span> <span class="nx">category</span> <span class="o">=</span> <span class="nb">document</span><span class="p">.</span><span class="nx">getElementById</span><span class="p">(</span><span class="s1">&#39;category&#39;</span><span class="p">),</span>
        <span class="nx">children</span> <span class="o">=</span> <span class="nx">category</span><span class="p">.</span><span class="nx">children</span><span class="p">,</span>
        <span class="nx">i</span><span class="p">;</span>

    <span class="k">for</span> <span class="p">(</span> <span class="nx">i</span><span class="o">=</span><span class="mf">0</span><span class="p">;</span> <span class="nx">i</span><span class="o">&lt;</span><span class="nx">children</span><span class="p">.</span><span class="nx">length</span><span class="p">;</span> <span class="nx">i</span><span class="o">++</span> <span class="p">)</span> <span class="p">{</span>
        <span class="nx">children</span><span class="p">[</span><span class="nx">i</span><span class="p">].</span><span class="nx">className</span> <span class="o">=</span> <span class="s1">&#39;&#39;</span><span class="p">;</span>
    <span class="p">}</span>

    <span class="k">if</span> <span class="p">(</span><span class="nx">el</span><span class="p">)</span> <span class="p">{</span>
        <span class="nx">el</span><span class="p">.</span><span class="nx">className</span> <span class="o">=</span> <span class="s1">&#39;on&#39;</span><span class="p">;</span>
    <span class="p">}</span> 
<span class="p">}</span> </code></pre></figure></div><h4 class="tab off">Javascript + HTML</h4><div class="tabbody off"><figure class="highlight"><pre><code class="language-html" data-lang="html"><span></span><span class="cp">&lt;!DOCTYPE html&gt;</span>
<span class="p">&lt;</span><span class="nt">html</span><span class="p">&gt;</span>
<span class="p">&lt;</span><span class="nt">head</span><span class="p">&gt;</span>
    <span class="p">&lt;</span><span class="nt">meta</span> <span class="na">charset</span><span class="o">=</span><span class="s">&quot;utf-8&quot;</span><span class="p">&gt;</span>
    <span class="p">&lt;</span><span class="nt">title</span><span class="p">&gt;</span>카테고리별 장소 검색하기<span class="p">&lt;/</span><span class="nt">title</span><span class="p">&gt;</span>
    <span class="p">&lt;</span><span class="nt">style</span><span class="p">&gt;</span>
<span class="p">.</span><span class="nc">map_wrap</span><span class="o">,</span> <span class="p">.</span><span class="nc">map_wrap</span> <span class="o">*</span> <span class="p">{</span><span class="k">margin</span><span class="p">:</span><span class="mi">0</span><span class="p">;</span> <span class="k">padding</span><span class="p">:</span><span class="mi">0</span><span class="p">;</span><span class="k">font-family</span><span class="p">:</span><span class="s1">&#39;Malgun Gothic&#39;</span><span class="p">,</span><span class="n">dotum</span><span class="p">,</span><span class="s1">&#39;돋움&#39;</span><span class="p">,</span><span class="kc">sans-serif</span><span class="p">;</span><span class="k">font-size</span><span class="p">:</span><span class="mi">12</span><span class="kt">px</span><span class="p">;}</span>
<span class="p">.</span><span class="nc">map_wrap</span> <span class="p">{</span><span class="k">position</span><span class="p">:</span><span class="kc">relative</span><span class="p">;</span><span class="k">width</span><span class="p">:</span><span class="mi">100</span><span class="kt">%</span><span class="p">;</span><span class="k">height</span><span class="p">:</span><span class="mi">350</span><span class="kt">px</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="p">{</span><span class="k">position</span><span class="p">:</span><span class="kc">absolute</span><span class="p">;</span><span class="k">top</span><span class="p">:</span><span class="mi">10</span><span class="kt">px</span><span class="p">;</span><span class="k">left</span><span class="p">:</span><span class="mi">10</span><span class="kt">px</span><span class="p">;</span><span class="k">border-radius</span><span class="p">:</span> <span class="mi">5</span><span class="kt">px</span><span class="p">;</span> <span class="k">border</span><span class="p">:</span><span class="mi">1</span><span class="kt">px</span> <span class="kc">solid</span> <span class="mh">#909090</span><span class="p">;</span><span class="k">box-shadow</span><span class="p">:</span> <span class="mi">0</span> <span class="mi">1</span><span class="kt">px</span> <span class="mi">1</span><span class="kt">px</span> <span class="nb">rgba</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mf">0.4</span><span class="p">);</span><span class="k">background</span><span class="p">:</span> <span class="mh">#fff</span><span class="p">;</span><span class="k">overflow</span><span class="p">:</span> <span class="kc">hidden</span><span class="p">;</span><span class="k">z-index</span><span class="p">:</span> <span class="mi">2</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="nt">li</span> <span class="p">{</span><span class="k">float</span><span class="p">:</span><span class="kc">left</span><span class="p">;</span><span class="k">list-style</span><span class="p">:</span> <span class="kc">none</span><span class="p">;</span><span class="k">width</span><span class="p">:</span><span class="mi">50</span><span class="kt">px</span><span class="p">;</span><span class="err">px</span><span class="p">;</span><span class="k">border-right</span><span class="p">:</span><span class="mi">1</span><span class="kt">px</span> <span class="kc">solid</span> <span class="mh">#acacac</span><span class="p">;</span><span class="k">padding</span><span class="p">:</span><span class="mi">6</span><span class="kt">px</span> <span class="mi">0</span><span class="p">;</span><span class="k">text-align</span><span class="p">:</span> <span class="kc">center</span><span class="p">;</span> <span class="k">cursor</span><span class="p">:</span> <span class="kc">pointer</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="nt">li</span><span class="p">.</span><span class="nc">on</span> <span class="p">{</span><span class="k">background</span><span class="p">:</span> <span class="mh">#eee</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="nt">li</span><span class="p">:</span><span class="nd">hover</span> <span class="p">{</span><span class="k">background</span><span class="p">:</span> <span class="mh">#ffe6e6</span><span class="p">;</span><span class="k">border-left</span><span class="p">:</span><span class="mi">1</span><span class="kt">px</span> <span class="kc">solid</span> <span class="mh">#acacac</span><span class="p">;</span><span class="k">margin-left</span><span class="p">:</span> <span class="mi">-1</span><span class="kt">px</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="nt">li</span><span class="p">:</span><span class="nd">last-child</span><span class="p">{</span><span class="k">margin-right</span><span class="p">:</span><span class="mi">0</span><span class="p">;</span><span class="k">border-right</span><span class="p">:</span><span class="mi">0</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="nt">li</span> <span class="nt">span</span> <span class="p">{</span><span class="k">display</span><span class="p">:</span> <span class="kc">block</span><span class="p">;</span><span class="k">margin</span><span class="p">:</span><span class="mi">0</span> <span class="kc">auto</span> <span class="mi">3</span><span class="kt">px</span><span class="p">;</span><span class="k">width</span><span class="p">:</span><span class="mi">27</span><span class="kt">px</span><span class="p">;</span><span class="k">height</span><span class="p">:</span> <span class="mi">28</span><span class="kt">px</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="nt">li</span> <span class="p">.</span><span class="nc">category_bg</span> <span class="p">{</span><span class="k">background</span><span class="p">:</span><span class="nb">url</span><span class="p">(</span><span class="sx">https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png</span><span class="p">)</span> <span class="kc">no-repeat</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="nt">li</span> <span class="p">.</span><span class="nc">bank</span> <span class="p">{</span><span class="k">background-position</span><span class="p">:</span> <span class="mi">-10</span><span class="kt">px</span> <span class="mi">0</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="nt">li</span> <span class="p">.</span><span class="nc">mart</span> <span class="p">{</span><span class="k">background-position</span><span class="p">:</span> <span class="mi">-10</span><span class="kt">px</span> <span class="mi">-36</span><span class="kt">px</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="nt">li</span> <span class="p">.</span><span class="nc">pharmacy</span> <span class="p">{</span><span class="k">background-position</span><span class="p">:</span> <span class="mi">-10</span><span class="kt">px</span> <span class="mi">-72</span><span class="kt">px</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="nt">li</span> <span class="p">.</span><span class="nc">oil</span> <span class="p">{</span><span class="k">background-position</span><span class="p">:</span> <span class="mi">-10</span><span class="kt">px</span> <span class="mi">-108</span><span class="kt">px</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="nt">li</span> <span class="p">.</span><span class="nc">cafe</span> <span class="p">{</span><span class="k">background-position</span><span class="p">:</span> <span class="mi">-10</span><span class="kt">px</span> <span class="mi">-144</span><span class="kt">px</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="nt">li</span> <span class="p">.</span><span class="nc">store</span> <span class="p">{</span><span class="k">background-position</span><span class="p">:</span> <span class="mi">-10</span><span class="kt">px</span> <span class="mi">-180</span><span class="kt">px</span><span class="p">;}</span>
<span class="p">#</span><span class="nn">category</span> <span class="nt">li</span><span class="p">.</span><span class="nc">on</span> <span class="p">.</span><span class="nc">category_bg</span> <span class="p">{</span><span class="n">background-position-x</span><span class="p">:</span><span class="mi">-46</span><span class="kt">px</span><span class="p">;}</span>
<span class="p">.</span><span class="nc">placeinfo_wrap</span> <span class="p">{</span><span class="k">position</span><span class="p">:</span><span class="kc">absolute</span><span class="p">;</span><span class="k">bottom</span><span class="p">:</span><span class="mi">28</span><span class="kt">px</span><span class="p">;</span><span class="k">left</span><span class="p">:</span><span class="mi">-150</span><span class="kt">px</span><span class="p">;</span><span class="k">width</span><span class="p">:</span><span class="mi">300</span><span class="kt">px</span><span class="p">;}</span>
<span class="p">.</span><span class="nc">placeinfo</span> <span class="p">{</span><span class="k">position</span><span class="p">:</span><span class="kc">relative</span><span class="p">;</span><span class="k">width</span><span class="p">:</span><span class="mi">100</span><span class="kt">%</span><span class="p">;</span><span class="k">border-radius</span><span class="p">:</span><span class="mi">6</span><span class="kt">px</span><span class="p">;</span><span class="k">border</span><span class="p">:</span> <span class="mi">1</span><span class="kt">px</span> <span class="kc">solid</span> <span class="mh">#ccc</span><span class="p">;</span><span class="k">border-bottom</span><span class="p">:</span><span class="mi">2</span><span class="kt">px</span> <span class="kc">solid</span> <span class="mh">#ddd</span><span class="p">;</span><span class="k">padding-bottom</span><span class="p">:</span> <span class="mi">10</span><span class="kt">px</span><span class="p">;</span><span class="k">background</span><span class="p">:</span> <span class="mh">#fff</span><span class="p">;}</span>
<span class="p">.</span><span class="nc">placeinfo</span><span class="p">:</span><span class="nd">nth-of-type</span><span class="o">(</span><span class="nt">n</span><span class="o">)</span> <span class="p">{</span><span class="k">border</span><span class="p">:</span><span class="mi">0</span><span class="p">;</span> <span class="k">box-shadow</span><span class="p">:</span><span class="mi">0</span><span class="kt">px</span> <span class="mi">1</span><span class="kt">px</span> <span class="mi">2</span><span class="kt">px</span> <span class="mh">#888</span><span class="p">;}</span>
<span class="p">.</span><span class="nc">placeinfo_wrap</span> <span class="p">.</span><span class="nc">after</span> <span class="p">{</span><span class="k">content</span><span class="p">:</span><span class="s1">&#39;&#39;</span><span class="p">;</span><span class="k">position</span><span class="p">:</span><span class="kc">relative</span><span class="p">;</span><span class="k">margin-left</span><span class="p">:</span><span class="mi">-12</span><span class="kt">px</span><span class="p">;</span><span class="k">left</span><span class="p">:</span><span class="mi">50</span><span class="kt">%</span><span class="p">;</span><span class="k">width</span><span class="p">:</span><span class="mi">22</span><span class="kt">px</span><span class="p">;</span><span class="k">height</span><span class="p">:</span><span class="mi">12</span><span class="kt">px</span><span class="p">;</span><span class="k">background</span><span class="p">:</span><span class="nb">url</span><span class="p">(</span><span class="s1">&#39;https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png&#39;</span><span class="p">)}</span>
<span class="p">.</span><span class="nc">placeinfo</span> <span class="nt">a</span><span class="o">,</span> <span class="p">.</span><span class="nc">placeinfo</span> <span class="nt">a</span><span class="p">:</span><span class="nd">hover</span><span class="o">,</span> <span class="p">.</span><span class="nc">placeinfo</span> <span class="nt">a</span><span class="p">:</span><span class="nd">active</span><span class="p">{</span><span class="k">color</span><span class="p">:</span><span class="mh">#fff</span><span class="p">;</span><span class="k">text-decoration</span><span class="p">:</span> <span class="kc">none</span><span class="p">;}</span>
<span class="p">.</span><span class="nc">placeinfo</span> <span class="nt">a</span><span class="o">,</span> <span class="p">.</span><span class="nc">placeinfo</span> <span class="nt">span</span> <span class="p">{</span><span class="k">display</span><span class="p">:</span> <span class="kc">block</span><span class="p">;</span><span class="k">text-overflow</span><span class="p">:</span> <span class="kc">ellipsis</span><span class="p">;</span><span class="k">overflow</span><span class="p">:</span> <span class="kc">hidden</span><span class="p">;</span><span class="k">white-space</span><span class="p">:</span> <span class="kc">nowrap</span><span class="p">;}</span>
<span class="p">.</span><span class="nc">placeinfo</span> <span class="nt">span</span> <span class="p">{</span><span class="k">margin</span><span class="p">:</span><span class="mi">5</span><span class="kt">px</span> <span class="mi">5</span><span class="kt">px</span> <span class="mi">0</span> <span class="mi">5</span><span class="kt">px</span><span class="p">;</span><span class="k">cursor</span><span class="p">:</span> <span class="kc">default</span><span class="p">;</span><span class="k">font-size</span><span class="p">:</span><span class="mi">13</span><span class="kt">px</span><span class="p">;}</span>
<span class="p">.</span><span class="nc">placeinfo</span> <span class="p">.</span><span class="nc">title</span> <span class="p">{</span><span class="k">font-weight</span><span class="p">:</span> <span class="kc">bold</span><span class="p">;</span> <span class="k">font-size</span><span class="p">:</span><span class="mi">14</span><span class="kt">px</span><span class="p">;</span><span class="k">border-radius</span><span class="p">:</span> <span class="mi">6</span><span class="kt">px</span> <span class="mi">6</span><span class="kt">px</span> <span class="mi">0</span> <span class="mi">0</span><span class="p">;</span><span class="k">margin</span><span class="p">:</span> <span class="mi">-1</span><span class="kt">px</span> <span class="mi">-1</span><span class="kt">px</span> <span class="mi">0</span> <span class="mi">-1</span><span class="kt">px</span><span class="p">;</span><span class="k">padding</span><span class="p">:</span><span class="mi">10</span><span class="kt">px</span><span class="p">;</span> <span class="k">color</span><span class="p">:</span> <span class="mh">#fff</span><span class="p">;</span><span class="k">background</span><span class="p">:</span> <span class="mh">#d95050</span><span class="p">;</span><span class="k">background</span><span class="p">:</span> <span class="mh">#d95050</span> <span class="nb">url</span><span class="p">(</span><span class="sx">https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png</span><span class="p">)</span> <span class="kc">no-repeat</span> <span class="kc">right</span> <span class="mi">14</span><span class="kt">px</span> <span class="kc">center</span><span class="p">;}</span>
<span class="p">.</span><span class="nc">placeinfo</span> <span class="p">.</span><span class="nc">tel</span> <span class="p">{</span><span class="k">color</span><span class="p">:</span><span class="mh">#0f7833</span><span class="p">;}</span>
<span class="p">.</span><span class="nc">placeinfo</span> <span class="p">.</span><span class="nc">jibun</span> <span class="p">{</span><span class="k">color</span><span class="p">:</span><span class="mh">#999</span><span class="p">;</span><span class="k">font-size</span><span class="p">:</span><span class="mi">11</span><span class="kt">px</span><span class="p">;</span><span class="k">margin-top</span><span class="p">:</span><span class="mi">0</span><span class="p">;}</span>
<span class="p">&lt;/</span><span class="nt">style</span><span class="p">&gt;</span>
<span class="p">&lt;/</span><span class="nt">head</span><span class="p">&gt;</span>
<span class="p">&lt;</span><span class="nt">body</span><span class="p">&gt;</span>
<span class="p">&lt;</span><span class="nt">p</span> <span class="na">style</span><span class="o">=</span><span class="s">&quot;margin-top:-12px&quot;</span><span class="p">&gt;</span>
    <span class="p">&lt;</span><span class="nt">em</span> <span class="na">class</span><span class="o">=</span><span class="s">&quot;link&quot;</span><span class="p">&gt;</span>
        <span class="p">&lt;</span><span class="nt">a</span> <span class="na">href</span><span class="o">=</span><span class="s">&quot;/web/documentation/#CategoryCode&quot;</span> <span class="na">target</span><span class="o">=</span><span class="s">&quot;_blank&quot;</span><span class="p">&gt;</span>카테고리 코드목록을 보시려면 여기를 클릭하세요!<span class="p">&lt;/</span><span class="nt">a</span><span class="p">&gt;</span>
    <span class="p">&lt;/</span><span class="nt">em</span><span class="p">&gt;</span>
<span class="p">&lt;/</span><span class="nt">p</span><span class="p">&gt;</span>
<span class="p">&lt;</span><span class="nt">div</span> <span class="na">class</span><span class="o">=</span><span class="s">&quot;map_wrap&quot;</span><span class="p">&gt;</span>
    <span class="p">&lt;</span><span class="nt">div</span> <span class="na">id</span><span class="o">=</span><span class="s">&quot;map&quot;</span> <span class="na">style</span><span class="o">=</span><span class="s">&quot;width:100%;height:100%;position:relative;overflow:hidden;&quot;</span><span class="p">&gt;&lt;/</span><span class="nt">div</span><span class="p">&gt;</span>
    <span class="p">&lt;</span><span class="nt">ul</span> <span class="na">id</span><span class="o">=</span><span class="s">&quot;category&quot;</span><span class="p">&gt;</span>
        <span class="p">&lt;</span><span class="nt">li</span> <span class="na">id</span><span class="o">=</span><span class="s">&quot;BK9&quot;</span> <span class="na">data-order</span><span class="o">=</span><span class="s">&quot;0&quot;</span><span class="p">&gt;</span> 
            <span class="p">&lt;</span><span class="nt">span</span> <span class="na">class</span><span class="o">=</span><span class="s">&quot;category_bg bank&quot;</span><span class="p">&gt;&lt;/</span><span class="nt">span</span><span class="p">&gt;</span>
            은행
        <span class="p">&lt;/</span><span class="nt">li</span><span class="p">&gt;</span>       
        <span class="p">&lt;</span><span class="nt">li</span> <span class="na">id</span><span class="o">=</span><span class="s">&quot;MT1&quot;</span> <span class="na">data-order</span><span class="o">=</span><span class="s">&quot;1&quot;</span><span class="p">&gt;</span> 
            <span class="p">&lt;</span><span class="nt">span</span> <span class="na">class</span><span class="o">=</span><span class="s">&quot;category_bg mart&quot;</span><span class="p">&gt;&lt;/</span><span class="nt">span</span><span class="p">&gt;</span>
            마트
        <span class="p">&lt;/</span><span class="nt">li</span><span class="p">&gt;</span>  
        <span class="p">&lt;</span><span class="nt">li</span> <span class="na">id</span><span class="o">=</span><span class="s">&quot;PM9&quot;</span> <span class="na">data-order</span><span class="o">=</span><span class="s">&quot;2&quot;</span><span class="p">&gt;</span> 
            <span class="p">&lt;</span><span class="nt">span</span> <span class="na">class</span><span class="o">=</span><span class="s">&quot;category_bg pharmacy&quot;</span><span class="p">&gt;&lt;/</span><span class="nt">span</span><span class="p">&gt;</span>
            약국
        <span class="p">&lt;/</span><span class="nt">li</span><span class="p">&gt;</span>  
        <span class="p">&lt;</span><span class="nt">li</span> <span class="na">id</span><span class="o">=</span><span class="s">&quot;OL7&quot;</span> <span class="na">data-order</span><span class="o">=</span><span class="s">&quot;3&quot;</span><span class="p">&gt;</span> 
            <span class="p">&lt;</span><span class="nt">span</span> <span class="na">class</span><span class="o">=</span><span class="s">&quot;category_bg oil&quot;</span><span class="p">&gt;&lt;/</span><span class="nt">span</span><span class="p">&gt;</span>
            주유소
        <span class="p">&lt;/</span><span class="nt">li</span><span class="p">&gt;</span>  
        <span class="p">&lt;</span><span class="nt">li</span> <span class="na">id</span><span class="o">=</span><span class="s">&quot;CE7&quot;</span> <span class="na">data-order</span><span class="o">=</span><span class="s">&quot;4&quot;</span><span class="p">&gt;</span> 
            <span class="p">&lt;</span><span class="nt">span</span> <span class="na">class</span><span class="o">=</span><span class="s">&quot;category_bg cafe&quot;</span><span class="p">&gt;&lt;/</span><span class="nt">span</span><span class="p">&gt;</span>
            카페
        <span class="p">&lt;/</span><span class="nt">li</span><span class="p">&gt;</span>  
        <span class="p">&lt;</span><span class="nt">li</span> <span class="na">id</span><span class="o">=</span><span class="s">&quot;CS2&quot;</span> <span class="na">data-order</span><span class="o">=</span><span class="s">&quot;5&quot;</span><span class="p">&gt;</span> 
            <span class="p">&lt;</span><span class="nt">span</span> <span class="na">class</span><span class="o">=</span><span class="s">&quot;category_bg store&quot;</span><span class="p">&gt;&lt;/</span><span class="nt">span</span><span class="p">&gt;</span>
            편의점
        <span class="p">&lt;/</span><span class="nt">li</span><span class="p">&gt;</span>      
    <span class="p">&lt;/</span><span class="nt">ul</span><span class="p">&gt;</span>
<span class="p">&lt;/</span><span class="nt">div</span><span class="p">&gt;</span>

<span class="p">&lt;</span><span class="nt">script</span> <span class="na">type</span><span class="o">=</span><span class="s">&quot;text/javascript&quot;</span> <span class="na">src</span><span class="o">=</span><span class="s">&quot;//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 사용하세요&amp;libraries=services&quot;</span><span class="p">&gt;&lt;/</span><span class="nt">script</span><span class="p">&gt;</span>
<span class="p">&lt;</span><span class="nt">script</span><span class="p">&gt;</span>
<span class="c1">// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다</span>
<span class="kd">var</span> <span class="nx">placeOverlay</span> <span class="o">=</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">CustomOverlay</span><span class="p">({</span><span class="nx">zIndex</span><span class="o">:</span><span class="mf">1</span><span class="p">}),</span> 
    <span class="nx">contentNode</span> <span class="o">=</span> <span class="nb">document</span><span class="p">.</span><span class="nx">createElement</span><span class="p">(</span><span class="s1">&#39;div&#39;</span><span class="p">),</span> <span class="c1">// 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 </span>
    <span class="nx">markers</span> <span class="o">=</span> <span class="p">[],</span> <span class="c1">// 마커를 담을 배열입니다</span>
    <span class="nx">currCategory</span> <span class="o">=</span> <span class="s1">&#39;&#39;</span><span class="p">;</span> <span class="c1">// 현재 선택된 카테고리를 가지고 있을 변수입니다</span>
 
<span class="kd">var</span> <span class="nx">mapContainer</span> <span class="o">=</span> <span class="nb">document</span><span class="p">.</span><span class="nx">getElementById</span><span class="p">(</span><span class="s1">&#39;map&#39;</span><span class="p">),</span> <span class="c1">// 지도를 표시할 div </span>
    <span class="nx">mapOption</span> <span class="o">=</span> <span class="p">{</span>
        <span class="nx">center</span><span class="o">:</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">LatLng</span><span class="p">(</span><span class="mf">37.566826</span><span class="p">,</span> <span class="mf">126.9786567</span><span class="p">),</span> <span class="c1">// 지도의 중심좌표</span>
        <span class="nx">level</span><span class="o">:</span> <span class="mf">5</span> <span class="c1">// 지도의 확대 레벨</span>
    <span class="p">};</span>  

<span class="c1">// 지도를 생성합니다    </span>
<span class="kd">var</span> <span class="nx">map</span> <span class="o">=</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nb">Map</span><span class="p">(</span><span class="nx">mapContainer</span><span class="p">,</span> <span class="nx">mapOption</span><span class="p">);</span> 

<span class="c1">// 장소 검색 객체를 생성합니다</span>
<span class="kd">var</span> <span class="nx">ps</span> <span class="o">=</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">services</span><span class="p">.</span><span class="nx">Places</span><span class="p">(</span><span class="nx">map</span><span class="p">);</span> 

<span class="c1">// 지도에 idle 이벤트를 등록합니다</span>
<span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">event</span><span class="p">.</span><span class="nx">addListener</span><span class="p">(</span><span class="nx">map</span><span class="p">,</span> <span class="s1">&#39;idle&#39;</span><span class="p">,</span> <span class="nx">searchPlaces</span><span class="p">);</span>

<span class="c1">// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 </span>
<span class="nx">contentNode</span><span class="p">.</span><span class="nx">className</span> <span class="o">=</span> <span class="s1">&#39;placeinfo_wrap&#39;</span><span class="p">;</span>

<span class="c1">// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때</span>
<span class="c1">// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 </span>
<span class="nx">addEventHandle</span><span class="p">(</span><span class="nx">contentNode</span><span class="p">,</span> <span class="s1">&#39;mousedown&#39;</span><span class="p">,</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">event</span><span class="p">.</span><span class="nx">preventMap</span><span class="p">);</span>
<span class="nx">addEventHandle</span><span class="p">(</span><span class="nx">contentNode</span><span class="p">,</span> <span class="s1">&#39;touchstart&#39;</span><span class="p">,</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">event</span><span class="p">.</span><span class="nx">preventMap</span><span class="p">);</span>

<span class="c1">// 커스텀 오버레이 컨텐츠를 설정합니다</span>
<span class="nx">placeOverlay</span><span class="p">.</span><span class="nx">setContent</span><span class="p">(</span><span class="nx">contentNode</span><span class="p">);</span>  

<span class="c1">// 각 카테고리에 클릭 이벤트를 등록합니다</span>
<span class="nx">addCategoryClickEvent</span><span class="p">();</span>

<span class="c1">// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다</span>
<span class="kd">function</span> <span class="nx">addEventHandle</span><span class="p">(</span><span class="nx">target</span><span class="p">,</span> <span class="nx">type</span><span class="p">,</span> <span class="nx">callback</span><span class="p">)</span> <span class="p">{</span>
    <span class="k">if</span> <span class="p">(</span><span class="nx">target</span><span class="p">.</span><span class="nx">addEventListener</span><span class="p">)</span> <span class="p">{</span>
        <span class="nx">target</span><span class="p">.</span><span class="nx">addEventListener</span><span class="p">(</span><span class="nx">type</span><span class="p">,</span> <span class="nx">callback</span><span class="p">);</span>
    <span class="p">}</span> <span class="k">else</span> <span class="p">{</span>
        <span class="nx">target</span><span class="p">.</span><span class="nx">attachEvent</span><span class="p">(</span><span class="s1">&#39;on&#39;</span> <span class="o">+</span> <span class="nx">type</span><span class="p">,</span> <span class="nx">callback</span><span class="p">);</span>
    <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 카테고리 검색을 요청하는 함수입니다</span>
<span class="kd">function</span> <span class="nx">searchPlaces</span><span class="p">()</span> <span class="p">{</span>
    <span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="nx">currCategory</span><span class="p">)</span> <span class="p">{</span>
        <span class="k">return</span><span class="p">;</span>
    <span class="p">}</span>
    
    <span class="c1">// 커스텀 오버레이를 숨깁니다 </span>
    <span class="nx">placeOverlay</span><span class="p">.</span><span class="nx">setMap</span><span class="p">(</span><span class="kc">null</span><span class="p">);</span>

    <span class="c1">// 지도에 표시되고 있는 마커를 제거합니다</span>
    <span class="nx">removeMarker</span><span class="p">();</span>
    
    <span class="nx">ps</span><span class="p">.</span><span class="nx">categorySearch</span><span class="p">(</span><span class="nx">currCategory</span><span class="p">,</span> <span class="nx">placesSearchCB</span><span class="p">,</span> <span class="p">{</span><span class="nx">useMapBounds</span><span class="o">:</span><span class="kc">true</span><span class="p">});</span> 
<span class="p">}</span>

<span class="c1">// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다</span>
<span class="kd">function</span> <span class="nx">placesSearchCB</span><span class="p">(</span><span class="nx">data</span><span class="p">,</span> <span class="nx">status</span><span class="p">,</span> <span class="nx">pagination</span><span class="p">)</span> <span class="p">{</span>
    <span class="k">if</span> <span class="p">(</span><span class="nx">status</span> <span class="o">===</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">services</span><span class="p">.</span><span class="nx">Status</span><span class="p">.</span><span class="nx">OK</span><span class="p">)</span> <span class="p">{</span>

        <span class="c1">// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다</span>
        <span class="nx">displayPlaces</span><span class="p">(</span><span class="nx">data</span><span class="p">);</span>
    <span class="p">}</span> <span class="k">else</span> <span class="k">if</span> <span class="p">(</span><span class="nx">status</span> <span class="o">===</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">services</span><span class="p">.</span><span class="nx">Status</span><span class="p">.</span><span class="nx">ZERO_RESULT</span><span class="p">)</span> <span class="p">{</span>
        <span class="c1">// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요</span>

    <span class="p">}</span> <span class="k">else</span> <span class="k">if</span> <span class="p">(</span><span class="nx">status</span> <span class="o">===</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">services</span><span class="p">.</span><span class="nx">Status</span><span class="p">.</span><span class="nx">ERROR</span><span class="p">)</span> <span class="p">{</span>
        <span class="c1">// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요</span>
        
    <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 지도에 마커를 표출하는 함수입니다</span>
<span class="kd">function</span> <span class="nx">displayPlaces</span><span class="p">(</span><span class="nx">places</span><span class="p">)</span> <span class="p">{</span>

    <span class="c1">// 몇번째 카테고리가 선택되어 있는지 얻어옵니다</span>
    <span class="c1">// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다</span>
    <span class="kd">var</span> <span class="nx">order</span> <span class="o">=</span> <span class="nb">document</span><span class="p">.</span><span class="nx">getElementById</span><span class="p">(</span><span class="nx">currCategory</span><span class="p">).</span><span class="nx">getAttribute</span><span class="p">(</span><span class="s1">&#39;data-order&#39;</span><span class="p">);</span>

    

    <span class="k">for</span> <span class="p">(</span> <span class="kd">var</span> <span class="nx">i</span><span class="o">=</span><span class="mf">0</span><span class="p">;</span> <span class="nx">i</span><span class="o">&lt;</span><span class="nx">places</span><span class="p">.</span><span class="nx">length</span><span class="p">;</span> <span class="nx">i</span><span class="o">++</span> <span class="p">)</span> <span class="p">{</span>

            <span class="c1">// 마커를 생성하고 지도에 표시합니다</span>
            <span class="kd">var</span> <span class="nx">marker</span> <span class="o">=</span> <span class="nx">addMarker</span><span class="p">(</span><span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">LatLng</span><span class="p">(</span><span class="nx">places</span><span class="p">[</span><span class="nx">i</span><span class="p">].</span><span class="nx">y</span><span class="p">,</span> <span class="nx">places</span><span class="p">[</span><span class="nx">i</span><span class="p">].</span><span class="nx">x</span><span class="p">),</span> <span class="nx">order</span><span class="p">);</span>

            <span class="c1">// 마커와 검색결과 항목을 클릭 했을 때</span>
            <span class="c1">// 장소정보를 표출하도록 클릭 이벤트를 등록합니다</span>
            <span class="p">(</span><span class="kd">function</span><span class="p">(</span><span class="nx">marker</span><span class="p">,</span> <span class="nx">place</span><span class="p">)</span> <span class="p">{</span>
                <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">event</span><span class="p">.</span><span class="nx">addListener</span><span class="p">(</span><span class="nx">marker</span><span class="p">,</span> <span class="s1">&#39;click&#39;</span><span class="p">,</span> <span class="kd">function</span><span class="p">()</span> <span class="p">{</span>
                    <span class="nx">displayPlaceInfo</span><span class="p">(</span><span class="nx">place</span><span class="p">);</span>
                <span class="p">});</span>
            <span class="p">})(</span><span class="nx">marker</span><span class="p">,</span> <span class="nx">places</span><span class="p">[</span><span class="nx">i</span><span class="p">]);</span>
    <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다</span>
<span class="kd">function</span> <span class="nx">addMarker</span><span class="p">(</span><span class="nx">position</span><span class="p">,</span> <span class="nx">order</span><span class="p">)</span> <span class="p">{</span>
    <span class="kd">var</span> <span class="nx">imageSrc</span> <span class="o">=</span> <span class="s1">&#39;https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png&#39;</span><span class="p">,</span> <span class="c1">// 마커 이미지 url, 스프라이트 이미지를 씁니다</span>
        <span class="nx">imageSize</span> <span class="o">=</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">Size</span><span class="p">(</span><span class="mf">27</span><span class="p">,</span> <span class="mf">28</span><span class="p">),</span>  <span class="c1">// 마커 이미지의 크기</span>
        <span class="nx">imgOptions</span> <span class="o">=</span>  <span class="p">{</span>
            <span class="nx">spriteSize</span> <span class="o">:</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">Size</span><span class="p">(</span><span class="mf">72</span><span class="p">,</span> <span class="mf">208</span><span class="p">),</span> <span class="c1">// 스프라이트 이미지의 크기</span>
            <span class="nx">spriteOrigin</span> <span class="o">:</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">Point</span><span class="p">(</span><span class="mf">46</span><span class="p">,</span> <span class="p">(</span><span class="nx">order</span><span class="o">*</span><span class="mf">36</span><span class="p">)),</span> <span class="c1">// 스프라이트 이미지 중 사용할 영역의 좌상단 좌표</span>
            <span class="nx">offset</span><span class="o">:</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">Point</span><span class="p">(</span><span class="mf">11</span><span class="p">,</span> <span class="mf">28</span><span class="p">)</span> <span class="c1">// 마커 좌표에 일치시킬 이미지 내에서의 좌표</span>
        <span class="p">},</span>
        <span class="nx">markerImage</span> <span class="o">=</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">MarkerImage</span><span class="p">(</span><span class="nx">imageSrc</span><span class="p">,</span> <span class="nx">imageSize</span><span class="p">,</span> <span class="nx">imgOptions</span><span class="p">),</span>
            <span class="nx">marker</span> <span class="o">=</span> <span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">Marker</span><span class="p">({</span>
            <span class="nx">position</span><span class="o">:</span> <span class="nx">position</span><span class="p">,</span> <span class="c1">// 마커의 위치</span>
            <span class="nx">image</span><span class="o">:</span> <span class="nx">markerImage</span> 
        <span class="p">});</span>

    <span class="nx">marker</span><span class="p">.</span><span class="nx">setMap</span><span class="p">(</span><span class="nx">map</span><span class="p">);</span> <span class="c1">// 지도 위에 마커를 표출합니다</span>
    <span class="nx">markers</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="nx">marker</span><span class="p">);</span>  <span class="c1">// 배열에 생성된 마커를 추가합니다</span>

    <span class="k">return</span> <span class="nx">marker</span><span class="p">;</span>
<span class="p">}</span>

<span class="c1">// 지도 위에 표시되고 있는 마커를 모두 제거합니다</span>
<span class="kd">function</span> <span class="nx">removeMarker</span><span class="p">()</span> <span class="p">{</span>
    <span class="k">for</span> <span class="p">(</span> <span class="kd">var</span> <span class="nx">i</span> <span class="o">=</span> <span class="mf">0</span><span class="p">;</span> <span class="nx">i</span> <span class="o">&lt;</span> <span class="nx">markers</span><span class="p">.</span><span class="nx">length</span><span class="p">;</span> <span class="nx">i</span><span class="o">++</span> <span class="p">)</span> <span class="p">{</span>
        <span class="nx">markers</span><span class="p">[</span><span class="nx">i</span><span class="p">].</span><span class="nx">setMap</span><span class="p">(</span><span class="kc">null</span><span class="p">);</span>
    <span class="p">}</span>   
    <span class="nx">markers</span> <span class="o">=</span> <span class="p">[];</span>
<span class="p">}</span>

<span class="c1">// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다</span>
<span class="kd">function</span> <span class="nx">displayPlaceInfo</span> <span class="p">(</span><span class="nx">place</span><span class="p">)</span> <span class="p">{</span>
    <span class="kd">var</span> <span class="nx">content</span> <span class="o">=</span> <span class="s1">&#39;&lt;div class=&quot;placeinfo&quot;&gt;&#39;</span> <span class="o">+</span>
                    <span class="s1">&#39;   &lt;a class=&quot;title&quot; href=&quot;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">place_url</span> <span class="o">+</span> <span class="s1">&#39;&quot; target=&quot;_blank&quot; title=&quot;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">place_name</span> <span class="o">+</span> <span class="s1">&#39;&quot;&gt;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">place_name</span> <span class="o">+</span> <span class="s1">&#39;&lt;/a&gt;&#39;</span><span class="p">;</span>   

    <span class="k">if</span> <span class="p">(</span><span class="nx">place</span><span class="p">.</span><span class="nx">road_address_name</span><span class="p">)</span> <span class="p">{</span>
        <span class="nx">content</span> <span class="o">+=</span> <span class="s1">&#39;    &lt;span title=&quot;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">road_address_name</span> <span class="o">+</span> <span class="s1">&#39;&quot;&gt;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">road_address_name</span> <span class="o">+</span> <span class="s1">&#39;&lt;/span&gt;&#39;</span> <span class="o">+</span>
                    <span class="s1">&#39;  &lt;span class=&quot;jibun&quot; title=&quot;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">address_name</span> <span class="o">+</span> <span class="s1">&#39;&quot;&gt;(지번 : &#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">address_name</span> <span class="o">+</span> <span class="s1">&#39;)&lt;/span&gt;&#39;</span><span class="p">;</span>
    <span class="p">}</span>  <span class="k">else</span> <span class="p">{</span>
        <span class="nx">content</span> <span class="o">+=</span> <span class="s1">&#39;    &lt;span title=&quot;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">address_name</span> <span class="o">+</span> <span class="s1">&#39;&quot;&gt;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">address_name</span> <span class="o">+</span> <span class="s1">&#39;&lt;/span&gt;&#39;</span><span class="p">;</span>
    <span class="p">}</span>                
   
    <span class="nx">content</span> <span class="o">+=</span> <span class="s1">&#39;    &lt;span class=&quot;tel&quot;&gt;&#39;</span> <span class="o">+</span> <span class="nx">place</span><span class="p">.</span><span class="nx">phone</span> <span class="o">+</span> <span class="s1">&#39;&lt;/span&gt;&#39;</span> <span class="o">+</span> 
                <span class="s1">&#39;&lt;/div&gt;&#39;</span> <span class="o">+</span> 
                <span class="s1">&#39;&lt;div class=&quot;after&quot;&gt;&lt;/div&gt;&#39;</span><span class="p">;</span>

    <span class="nx">contentNode</span><span class="p">.</span><span class="nx">innerHTML</span> <span class="o">=</span> <span class="nx">content</span><span class="p">;</span>
    <span class="nx">placeOverlay</span><span class="p">.</span><span class="nx">setPosition</span><span class="p">(</span><span class="ow">new</span> <span class="nx">kakao</span><span class="p">.</span><span class="nx">maps</span><span class="p">.</span><span class="nx">LatLng</span><span class="p">(</span><span class="nx">place</span><span class="p">.</span><span class="nx">y</span><span class="p">,</span> <span class="nx">place</span><span class="p">.</span><span class="nx">x</span><span class="p">));</span>
    <span class="nx">placeOverlay</span><span class="p">.</span><span class="nx">setMap</span><span class="p">(</span><span class="nx">map</span><span class="p">);</span>  
<span class="p">}</span>


<span class="c1">// 각 카테고리에 클릭 이벤트를 등록합니다</span>
<span class="kd">function</span> <span class="nx">addCategoryClickEvent</span><span class="p">()</span> <span class="p">{</span>
    <span class="kd">var</span> <span class="nx">category</span> <span class="o">=</span> <span class="nb">document</span><span class="p">.</span><span class="nx">getElementById</span><span class="p">(</span><span class="s1">&#39;category&#39;</span><span class="p">),</span>
        <span class="nx">children</span> <span class="o">=</span> <span class="nx">category</span><span class="p">.</span><span class="nx">children</span><span class="p">;</span>

    <span class="k">for</span> <span class="p">(</span><span class="kd">var</span> <span class="nx">i</span><span class="o">=</span><span class="mf">0</span><span class="p">;</span> <span class="nx">i</span><span class="o">&lt;</span><span class="nx">children</span><span class="p">.</span><span class="nx">length</span><span class="p">;</span> <span class="nx">i</span><span class="o">++</span><span class="p">)</span> <span class="p">{</span>
        <span class="nx">children</span><span class="p">[</span><span class="nx">i</span><span class="p">].</span><span class="nx">onclick</span> <span class="o">=</span> <span class="nx">onClickCategory</span><span class="p">;</span>
    <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 카테고리를 클릭했을 때 호출되는 함수입니다</span>
<span class="kd">function</span> <span class="nx">onClickCategory</span><span class="p">()</span> <span class="p">{</span>
    <span class="kd">var</span> <span class="nx">id</span> <span class="o">=</span> <span class="k">this</span><span class="p">.</span><span class="nx">id</span><span class="p">,</span>
        <span class="nx">className</span> <span class="o">=</span> <span class="k">this</span><span class="p">.</span><span class="nx">className</span><span class="p">;</span>

    <span class="nx">placeOverlay</span><span class="p">.</span><span class="nx">setMap</span><span class="p">(</span><span class="kc">null</span><span class="p">);</span>

    <span class="k">if</span> <span class="p">(</span><span class="nx">className</span> <span class="o">===</span> <span class="s1">&#39;on&#39;</span><span class="p">)</span> <span class="p">{</span>
        <span class="nx">currCategory</span> <span class="o">=</span> <span class="s1">&#39;&#39;</span><span class="p">;</span>
        <span class="nx">changeCategoryClass</span><span class="p">();</span>
        <span class="nx">removeMarker</span><span class="p">();</span>
    <span class="p">}</span> <span class="k">else</span> <span class="p">{</span>
        <span class="nx">currCategory</span> <span class="o">=</span> <span class="nx">id</span><span class="p">;</span>
        <span class="nx">changeCategoryClass</span><span class="p">(</span><span class="k">this</span><span class="p">);</span>
        <span class="nx">searchPlaces</span><span class="p">();</span>
    <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다</span>
<span class="kd">function</span> <span class="nx">changeCategoryClass</span><span class="p">(</span><span class="nx">el</span><span class="p">)</span> <span class="p">{</span>
    <span class="kd">var</span> <span class="nx">category</span> <span class="o">=</span> <span class="nb">document</span><span class="p">.</span><span class="nx">getElementById</span><span class="p">(</span><span class="s1">&#39;category&#39;</span><span class="p">),</span>
        <span class="nx">children</span> <span class="o">=</span> <span class="nx">category</span><span class="p">.</span><span class="nx">children</span><span class="p">,</span>
        <span class="nx">i</span><span class="p">;</span>

    <span class="k">for</span> <span class="p">(</span> <span class="nx">i</span><span class="o">=</span><span class="mf">0</span><span class="p">;</span> <span class="nx">i</span><span class="o">&lt;</span><span class="nx">children</span><span class="p">.</span><span class="nx">length</span><span class="p">;</span> <span class="nx">i</span><span class="o">++</span> <span class="p">)</span> <span class="p">{</span>
        <span class="nx">children</span><span class="p">[</span><span class="nx">i</span><span class="p">].</span><span class="nx">className</span> <span class="o">=</span> <span class="s1">&#39;&#39;</span><span class="p">;</span>
    <span class="p">}</span>

    <span class="k">if</span> <span class="p">(</span><span class="nx">el</span><span class="p">)</span> <span class="p">{</span>
        <span class="nx">el</span><span class="p">.</span><span class="nx">className</span> <span class="o">=</span> <span class="s1">&#39;on&#39;</span><span class="p">;</span>
    <span class="p">}</span> 
<span class="p">}</span> 
<span class="p">&lt;/</span><span class="nt">script</span><span class="p">&gt;</span>
<span class="p">&lt;/</span><span class="nt">body</span><span class="p">&gt;</span>
<span class="p">&lt;/</span><span class="nt">html</span><span class="p">&gt;</span></code></pre></figure></div></div></div></div><div id="liveWrap"><div class="close"></div><iframe id="liveFrame"></iframe></div><div id="dimmedLayer" style="height:0"></div><script type="text/javascript" src="//m1.daumcdn.net/tiara/js/td.min.js"></script><script type="text/javascript">var _tiq = 'undefined' !== typeof _tiq ? _tiq : [];
    window._tiq = _tiq;
    _tiq.push(['__trackPageview']);</script><script type="text/javascript" src="//t1.daumcdn.net/mapapisdoc/cssjs/1657160418816/js/service.min.js"></script><script>// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
}</script></body></html>