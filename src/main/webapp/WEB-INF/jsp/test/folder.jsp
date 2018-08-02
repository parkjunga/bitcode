<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<script src="//static.codepen.io/assets/editor/live/console_runner-ce3034e6bde3912cc25f83cccb7caa2b0f976196f2f2d52303a462c826d54a73.js"></script>
<script src="//static.codepen.io/assets/editor/live/css_live_reload_init-890dc39bb89183d4642d58b1ae5376a0193342f9aed88ea04330dc14c8d52f55.js"></script>
<meta charset="UTF-8">
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico">
<link rel="mask-icon" type="" href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111">
<link rel="canonical" href="https://codepen.io/MohamedElGhandour/pen/GEbwEW">

<link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style class="cp-pen-styles">

body {
    overflow: hidden;
}

.windows {
    background-image: url('http://res.cloudinary.com/dr5ei3rt1/image/upload/v1500514809/windows_10_nuam7e.jpg');
    color: white;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    overflow: hidden;
}

footer.footer i {
    font-size: 1.4em;
}

footer.footer {
    background-color: rgba(1, 1, 1, .8);
    border-color: rgba(1, 1, 1, .8);
}

footer.footer .left .col-xs-1 {
    width: 4.333%;
    text-align: left;
    padding-left: 30px;
    overflow: hidden;
}

footer.footer .left .col-xs-1-me:first-child {
    margin-left: 15px;
    border-bottom: 2px solid #76b9ed;
}

footer.footer .left .col-xs-1-me {
    float: left;
    width: 40px;
    height: 40px;
    padding-top: 10px;
    margin-right: 10px;
}

footer.footer .left .col-xs-1-me:nth-of-type(2) i {
    transform: rotate(90deg);
}

footer.footer .left .col-xs-1-me:hover {
    /*border-bottom: 3px solid #76b9ed;*/
    background-color: rgba(255, 255, 255, .15);
}

footer.footer .right .col-xs-1 {
    width: 4.333%;
    text-align: right;
    padding-right: 30px;
    overflow: hidden;
}

footer.footer .right .col-xs-1-me:first-child {
    margin-right: 15px;
    border: none;
    height: 40px;
    width: 5px;
    border-left: 1px solid #7d7d7d;
}

footer.footer .right .col-xs-1-me {
    float: right;
    width: 40px;
    height: 40px;
    padding-top: 10px;
    /*border-bottom: 3px solid #76b9ed;*/
    margin-left: 10px;
}

footer.footer .right .col-xs-1-me:hover {
    /*border-bottom: 3px solid #76b9ed;*/
    background-color: rgba(255, 255, 255, .15);
}

footer.footer .right .date {
    width: 80px;
    padding: 0;
}

footer.footer .right i {
    font-size: 1em;
}

.start-window {
    width: 960px;
    height: 530px;
    position: fixed;
    left: 0;
    bottom: 40px;
    background-color: rgba(21, 21, 21, 0.9);
    transition: all .1s ease-in-out;
}

.start-window .first-column {
    display: flex;
    flex-direction: column-reverse;
    min-height: 530px;
    justify-content: flex-start;
    text-align: center;
}

.start-window .first-column .icon-bottom {
    align-self: center;
    font-size: 17px;
    width: 100%;
}

.start-window .first-column .open-icon-list {
    margin-bottom: auto;
    padding-top: 10px;
}

.start-window .first-column .icon-bottom:hover {
    /*border-bottom: 3px solid #76b9ed;*/
    background-color: rgba(255, 255, 255, .15);
}

.start-window .first-column .icon-bottom {
    padding: 10px;
}

.start-window .second-column .head-med {
    padding: 10px;
}

.start-window .second-column {
    height: 530px;
    overflow: auto;
}

.start-window .second-column .media-heading {
    line-height: 35px;
}

.start-window .second-column .media:hover,
.start-window .second-column .head-med:hover {
    background-color: rgba(255, 255, 255, .15);
}

.start-window .second-column .media {
    margin-top: 0;
    padding: 10px;
}

.start-window .second-column .fa-chevron-down {
    float: right;
    line-height: 20px;
}

.start-window .second-column .mouse-prient {
    cursor: pointer;
}

.start-window .head-box {
    padding: 10px 10px 10px 0;
    margin-left: -5px;
}

.start-window .box {
    padding: 0;
}

.start-window .box-style {
    background-color: #0079d6;
    height: 100px;
    padding: 10px;
    margin: 10px;
}

.start-window .row {
    margin-right: -5px;
}

.start-window .mycontainer {
    line-height: 30px;
}

.start-window #number-day {
    font-size: 40px;
    font-weight: bold;
    padding: 10px;
}

.start-window .box-style:hover {
    outline: 2px solid #8dc0e7;
}

.hidden-start {
    display: none;
}

.start-window-fade {
    position: relative;
    background-color: rgba(0, 0, 0, 0);
}

.start-window .fluid-container {
    padding-top: 530px;
    -webkit-transition: all .1s ease-in-out;
    -moz-transition: all .1s ease-in-out;
    transition: all .1s ease-in-out;
}

.start-window .fluid-container.activecontainer {
    padding-top: 0;
}

mark {
    background-color: #0079d6;
    color: white;
    padding: 3px;
    margin: 2px;
}

.icon-computer {
    width: 60px;
    margin: 10px;
    cursor: pointer;
}

.icon-computer p {
    text-shadow: 3px 3px 3px #000, -3px -3px 3px #000;
    margin: 0;
}

.icon-computer:hover {
    background-color: rgba(3, 166, 255, 0.3);
    outline: 2px solid rgba(3, 166, 255, 0.9);
}

.folders:hover {
    background-color: rgba(3, 166, 255, 0.3);
    outline: 2px solid rgba(3, 166, 255, 0.9);
}

.overlay-computer {
    width: 70%;
    height: 60%;
    background: #fff;
    border: 2px solid #1883d7;
    color: black;
    overflow: auto;
    margin: auto;
    position: absolute;
    left: 15%;
    top: 20%;
    transition: transform .5s ease-in-out;
    transform: scale(0);
    min-height: 375px;
    min-width: 720px;
}

.overlay-computer .left {
    float: left;
}

.overlay-computer .right {
    float: right;
}

.overlay-computer .first-row-win .left i:after {
    content: " | ";
    margin: 0 5px
}

.overlay-computer .first-row-win .left i:last-of-type::after {
    content: "  ";
    margin: 0 5px
}

.overlay-computer i {
    padding: 5px;
}

.overlay-computer .first-row-win .right i.fa.fa-times:hover {
    color: white;
    background-color: #d40000;
}

.start-window .first-column .icon-bottom:hover {
    background-color: rgba(255, 255, 255, .15);
}

.overlay-computer .first-row-win .right i:hover {
    background-color: #ddd;
}

.overlay-computer .nav>li>a {
    position: relative;
    display: block;
    padding: 3px 15px;
}

.overlay-computer .nav-tabs>li>a {
    border-radius: 0;
}

.overlay-computer a {
    text-decoration: none;
    color: black;
}

.overlay-computer .tab-content {
    background-color: #f5f6f7;
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

.nav-tabs>li.active>a:focus {
    background-color: #f5f6f7;
}

.overlay-computer a.home-a,
.overlay-computer li.active a.home-a,
.overlay-computer li:hover a.home-a {
    background-color: #2587db;
    color: white;
    border-color: transparent;
}

.overlay-computer .div-icon-left {
    float: left;
}

.overlay-computer .second-row-win i {
    color: #808080;
}

.overlay-computer .third-row-win i {
    color: #6d6d6d;
    margin: 7.5px 0 0;
}

.overlay-computer .fa.fa-chevron-down {
    color: #c8c8c8;
}

.overlay-computer .third-row-win input {
    width: 100%;
    margin: 5px 0 0;
}

.path-icon {
    position: absolute;
    top: -2px;
    left: 17px;
}

.path-input {
    padding-left: 25px;
    width: 100%;
    margin: 5px 0 0;
    height: 24px;
    border: 1px solid #6d6d6d;
}

.path-icon-1 {
    position: absolute;
    top: 10px;
    right: 20px;
}

.path-icon-2 {
    position: absolute;
    top: -15px;
    right: 32px;
    font-size: 24px;
}

.search-input {
    width: 100%;
    margin: 5px 0 0;
    height: 24px;
    border: 1px solid #6d6d6d;
    padding-right: 25px;
    padding-left: 5px;
}

.path-icon-input {
    font-size: 11px;
}

.path-icon-input:before {
    content: "\f054";
    font-family: FontAwesome;
    margin: 5px;
}

.panel-default {
    border: none;
}

.panel {
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: none;
    box-shadow: none;
}

.panel-default .fa::before {
    padding: 5px;
}

.main-folders {
    padding: 7.5px;
}

.contain {
    height: 60px;
    overflow: hidden;
}

.contain img {
    max-height: 100%;
}

.image-overlay {
    position: absolute;
    width: 100%;
    margin: auto;
    height: 100vh;
    top: 0;
    left: 0;
    z-index: 1;
    background-color: #111;
    padding-bottom: 40px;
    color: #fff;
    transition: all .5s ease-in-out;
    transform: scale(0);
}

.image-overlay .right {
    float: right
}

.image-overlay .right i {
    padding: 8px;
}

.image-overlay .right i.fa.fa-times:hover {
    color: white;
    background-color: #d40000;
}

.image-overlay .right i:hover {
    background-color: #ddd;
}

.video-overlay {
    position: absolute;
    width: 100%;
    margin: auto;
    height: 100vh;
    top: 0;
    left: 0;
    z-index: 1;
    background-color: #111;
    padding-bottom: 40px;
    color: #fff;
    transition: all .5s ease-in-out;
    transform: scale(0);
}

.video-overlay .right {
    float: right
}

.video-overlay .right i {
    padding: 8px;
}

.video-overlay .right i.fa.fa-times:hover {
    color: white;
    background-color: #d40000;
}

.video-overlay .right i:hover {
    background-color: #ddd;
}

.note-overlay {
    position: absolute;
    width: 100%;
    margin: auto;
    height: 100vh;
    top: 0;
    left: 0;
    z-index: 1;
    background-color: #111;
    padding-bottom: 40px;
    color: #fff;
    transition: all .5s ease-in-out;
    overflow: hidden;
    transform: scale(0);
}

.note-overlay .right {
    float: right
}

.note-overlay .right i {
    padding: 8px;
}

.note-overlay .right i.fa.fa-times:hover {
    color: white;
    background-color: #d40000;
}

.note-overlay .right i:hover {
    background-color: #ddd;
}

.note-overlay textarea {
    width: 100%;
    height: 100vh;
    resize: none;
    color: black;
    padding: 10px;
}

.head-over {
    color: white;
    padding: 5px;
    font-weight: bold;
    display: inline-block;
}

div.resizable {
    position: relative;
}

div .resizer {
    width: 10px;
    height: 10px;
    background: #ddd;
    position: absolute;
    right: 0;
    bottom: 0;
    cursor: se-resize;
}

#a1,
#a2,
#a3,
#a4,
#a5 {
    display: none;
}

.video-overlay video {
    max-width: 50%;
    max-height: 50%;
    height: 50%;
}

body {
    background-color: #000;
}

.option-box {
    position: fixed;
    top: 100px;
    right: 0;
}

.option-box .color-box {
    background-color: #333;
    padding: 10px;
    float: right;
    position: relative;
    right: 0px;
    transition: all .5s ease-in-out;
    border: 3px solid #0079d6;
    border-right: none;
}

.option-box .gear-check {
    float: right;
    padding: 5px;
    position: relative;
    right: 0px;
    transition: all .5s ease-in-out;
    background-color: #0079d6;
    cursor: pointer;
}

#day {
    font-size: 12px;
}

.about-overlay {
    position: absolute;
    width: 100%;
    margin: auto;
    height: 100vh;
    top: 0;
    left: 0;
    z-index: 1;
    background-color: #111;
    padding-bottom: 40px;
    color: #fff;
    transition: all .5s ease-in-out;
    transform: scale(0);
    overflow: auto;
}

.about-overlay .right {
    float: right
}

.about-overlay .right i {
    padding: 8px;
}

.about-overlay img {
    height: 300px;
    margin: 10px;
}

.about-overlay p {
    margin: 10px;
}

.about-overlay .second-row-abo {
    padding: 20px;
    padding-bottom: 50px;
    line-height: 2;
}

.about-overlay .right i.fa.fa-times:hover {
    color: white;
    background-color: #d40000;
}

.about-overlay .right i:hover {
    background-color: #ddd;
}

.btn-primary {
    color: #fff;
    background-color: #0079d6;
    border-color: #0079d6;
    font-size: 20px;
    margin: 10px 0;
}

.btn-primary:hover {
    color: #fff;
    background-color: #0079d6;
    border-color: #204d74;
}
</style>
<title>공유 폴더</title>
</head>
<body>

<div id="window" class="window" style="width: 620px; height: 668px;">
    <div class="icon-computer text-center" id="icon-computer" ondblclick="opencom()">
        <img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive" style="margin: auto;">
<%--         <img src="${pageContext.request.contextPath}/resources/images/open-folder.PNG"> --%>
        <p>공유 폴더</p>
    </div>
    <div class="overlay-computer" id="overlay-computer" style="transform: scale(0); left: 142px; top: 29px;">
        <div class="fluid-container">
            <div class="first-row-win" id="first-row-win">
                <div class="left">
                    <i class="fa fa-hdd-o"></i>
                    <i class="fa fa-file-o"></i>
                    <i class="fa fa-folder"></i>
                    <span>id님의 Share Folder</span>
                </div>
                <!-- 닫기, 최소화, 최대화 -->
                <div class="right">
                    <i class="fa fa-window-minimize" onclick="closeopencom()"></i>
                    <i class="fa fa-window-restore" onclick="returncom()" id="returncam" style="display:none;"></i>
                    <i class="fa fa-window-maximize" onclick="upercom()" id="upercam"></i>
                    <i class="fa fa-times" onclick="closecom()"></i>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="second-row-win">
                <div>
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a class="home-a" href="#home" aria-controls="home" role="tab" data-toggle="tab">File</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Home</a></li>
                        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Share</a></li>
                        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">View</a></li>
                    </ul>
                    <!-- Tab panes -->
<!--                     <div class="tab-content"> -->
<!--                         <div role="tabpanel" class="tab-pane active" id="home"> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-envelope-open fa-2x"></i> -->
<!--                                 <p>Mail</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-file-code-o  fa-2x"></i> -->
<!--                                 <p>Code</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-sticky-note-o fa-2x"></i> -->
<!--                                 <p>Note</p> -->
<!--                             </div> -->
<!--                             <div class="clearfix"></div> -->
<!--                         </div> -->
<!--                         <div role="tabpanel" class="tab-pane" id="profile"> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-user-circle fa-2x"></i> -->
<!--                                 <p>User</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-battery-4  fa-2x"></i> -->
<!--                                 <p>battery</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-book fa-2x"></i> -->
<!--                                 <p>Book</p> -->
<!--                             </div> -->
<!--                             <div class="clearfix"></div> -->
<!--                         </div> -->
<!--                         <div role="tabpanel" class="tab-pane" id="messages"> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-car fa-2x"></i> -->
<!--                                 <p>Car</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-camera-retro  fa-2x"></i> -->
<!--                                 <p>cam</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-building fa-2x"></i> -->
<!--                                 <p>build</p> -->
<!--                             </div> -->
<!--                             <div class="clearfix"></div> -->
<!--                         </div> -->
<!--                         <div role="tabpanel" class="tab-pane" id="settings"> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-cubes fa-2x"></i> -->
<!--                                 <p>cubes</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-coffee fa-2x"></i> -->
<!--                                 <p>coffee</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-film fa-2x"></i> -->
<!--                                 <p>film</p> -->
<!--                             </div> -->
<!--                             <div class="clearfix"></div> -->
<!--                         </div> -->
<!--                     </div> -->
                </div>
            </div>
            <div class="third-row-win">
            	<!-- 뒤로가기 앞으로가기 화살표  -->
                <div class="col-xs-2">
                    <i class="fa fa-long-arrow-left"></i>
                    <i class="fa fa-long-arrow-right"></i>
                    <i class="fa fa-chevron-down"></i>
                    <i class="fa fa-arrow-up"></i>
                </div>
                <div class="col-xs-7">
                	<!-- 폴더 경로 -->
                    <div class="path-input">
                        <span class="path-icon-input">This pc</span>
                        <span class="path-icon-input">Mohamed Yahya (E:)</span>
                        <span class="path-icon-input">programming</span>
                        <span class="path-icon-input">Front End</span>
                    </div>
                    <!-- 폴더 경로 부분 아이콘 새로고침 -->
                    <i class="fa fa-hdd-o path-icon"></i>
                    <span class="fa fa-repeat path-icon-1"></span>
                    <i class="path-icon-2">|</i>
                </div>
                <div class="col-xs-3">
                    <input class="search-input" type="text" placeholder="Search">
                    <span id="sasa" class="fa fa-search path-icon-1"></span>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="fourd-row-win">
                <div class="col-xs-3" style="border-right: 1px solid #808080;">
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="">
                            
                            	<!-- 왼쪽 영역  -->
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <span class="fa fa-desktop">This PC</span>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body">
                                    <p><span class="fa fa-desktop">Desktop</span></p>
                                    <p><span class="fa fa-download">Downloads</span></p>
                                    <p><span class="fa fa-file-text">documents</span></p>
                                    <p><span class="fa fa-picture-o ">Picture</span></p>
                                    <p><span class="fa fa-folder ">Folder</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-9 ">
                    <div class="row main-folders">
						<!-- 폴더 ajax 추가 -->
                        <div class="col-xs-2 folders text-center">
                            <p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>
                            <span>Folder</span>
                        </div>
                        <div class="col-xs-2 folders text-center">
                            <p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>
                            <span>Folder</span>
                        </div>
                        <div class="col-xs-2 folders text-center">
                            <p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>
                            <span>Folder</span>
                        </div>
                        <div class="col-xs-2 folders text-center">
                            <p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>
                            <span>Folder</span>
                        </div>
                        <div class="col-xs-2 folders text-center">
                            <p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>
                            <span>Folder</span>
                        </div>
                        <div class="col-xs-2 folders text-center">
                            <p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>
                            <span>Folder</span>
                        </div>
                        <div class="col-xs-2 folders text-center">
                            <p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>
                            <span>Folder</span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="fived-row-win"></div>
        </div>
        <div class="resizer"></div>
    </div>
    <div class="clearfix"></div>



    <footer class="nav navbar-inverse navbar-fixed-bottom footer text-center">
        <div class="fluid-container">
            <div class="row">
                <div class="left">
                    <div class="col-xs-1-me" id="a1" style="display: none;">
                        <div class="icon-bottom">
                            <i class="fa fa-folder fa-2x"></i>
                        </div>
                    </div>
                    <span class=".clearfix"></span>
                </div>
            </div>
        </div>
    </footer>

</div>
<!-- 	<script src="//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>
	alert("새로고침");
	console.log($(".fa fa-repeat path-icon-1").text());
	console.dir($(".fa fa-repeat path-icon-1"));
	$("i.fa fa-repeat path-icon-1").onclick = function () {
		alert("새로고침");
	};
	$("i.fa fa-repeat path-icon-1").click(function () {
		alert("새로고침");
	})
	$("#sasa").click(function () {
		alert("검색");
	})
// 	var myWindowFade = document.getElementById('start-window-fade'), myWindow = document.getElementById('window');
// 	myWindowFade.style.width = window.innerWidth + "px";
// 	myWindowFade.style.height = window.innerHeight + "px";
// 	myWindow.style.width = window.innerWidth + "px";
// 	myWindow.style.height = window.innerHeight + "px";
// 	window.onresize = function() {
// 		myWindowFade.style.width = window.innerWidth + "px";
// 		myWindowFade.style.height = window.innerHeight + "px";
// 		myWindow.style.width = window.innerWidth + "px";
// 		myWindow.style.height = window.innerHeight + "px";
// 	}
	
	
// 	var myVar = setInterval(myTimer, 1000);

// 	function myTimer() {
// 		var date = new Date();
// 		document.getElementById("time").textContent = date.toLocaleTimeString();
// 	}

// 	function showTimer() {
// 		'use strict';
// 		var myDiv = document.getElementById("history"), date = new Date(), year = date
// 				.getUTCFullYear(), month = date.getUTCMonth(), day = date
// 				.getUTCDate();
// 		if (month < 10) {
// 			month = '0' + month;
// 		}
// 		if (day < 10) {
// 			day = '0' + day;
// 		}
// 		myDiv.textContent = year + '/' + month + '/' + day;
// 	}
// 	showTimer();
// 	var d = new Date();
// 	var days = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
// 			"Friday", "Saturday" ];
// 	document.getElementById("day").innerHTML = days[d.getDay()];
// 	document.getElementById("number-day").innerHTML = d.getUTCDate();
	/*$(".strat-win").click(function(){
	 $('.start-window-fade').fadeToggle();
	 $('.start-window').fadeToggle();
	 }); 
	 $('.start-window-fade').click(function () {
	 $('.start-window-fade').fadeOut();
	 $('.start-window').fadeOut();
	 });*/
// 	document.getElementById('strat-win').onclick = function() {
// 		'use strict';
// 		if (document.getElementById('start-window-fade').style.opacity <= .1) {
// 			fadeInByMe(document.getElementById('start-window-fade'));
// 			fadeInByMe(document.getElementById('start-window'));
// 		} else if (document.getElementById('start-window-fade').style.opacity >= 1) {
// 			fadeOutByMe(document.getElementById('start-window-fade'));
// 			fadeOutByMe(document.getElementById('start-window'));
// 		}
// 	}
// 	document.getElementById('start-window-fade').onclick = function() {
// 		'use strict';
// 		fadeOutByMe(document.getElementById('start-window-fade'));
// 		fadeOutByMe(document.getElementById('start-window'));
// 	}
// 	document.getElementById('close-all').onclick = function() {
// 		if (document.getElementById('start-window-fade').style.opacity >= 1) {
// 			fadeOutByMe(document.getElementById('start-window-fade'));
// 			fadeOutByMe(document.getElementById('start-window'));
// 		}
// 		if (computerOverlay.style.transform == "scale(1)") {
// 			computerOverlay.style.transform = "scale(0)";
// 			document.getElementById('a1').style.borderBottom = '2px solid #76b9ed';
// 		}
// 		if (imageOverlay.style.transform == "scale(1)") {
// 			imageOverlay.style.transform = "scale(0)";
// 			document.getElementById('a2').style.borderBottom = '2px solid #76b9ed';
// 		}
// 		if (videoOverlay.style.transform == "scale(1)") {
// 			videoOverlay.style.transform = "scale(0)";
// 			document.getElementById('a3').style.borderBottom = '2px solid #76b9ed';
// 		}
// 		if (noteOverlay.style.transform == "scale(1)") {
// 			noteOverlay.style.transform = "scale(0)";
// 			document.getElementById('a4').style.borderBottom = '2px solid #76b9ed';
// 		}
// 		if (aboutOverlay.style.transform == "scale(1)") {
// 			aboutOverlay.style.transform = "scale(0)";
// 			document.getElementById('a5').style.borderBottom = '2px solid #76b9ed';
// 		}
// 	}

// 	function fadeOutByMe(element) {
// 		'use strict';
// 		var opacity = 1, timer = setInterval(function name(params) {
// 			if (opacity <= .1) {
// 				clearInterval(timer);
// 				element.style.display = 'none';
// 				document.getElementById('container-start').classList
// 						.remove('activecontainer');
// 			}
// 			element.style.opacity = opacity;
// 			opacity -= 0.1;
// 		}, 50);
// 	}
// 	var scor = document.getElementsByClassName('second-column')[0];

// 	function fadeInByMe(element) {
// 		'use strict';
// 		var opacity = 0.1, timer = setInterval(function name(params) {
// 			if (opacity >= 1) {
// 				clearInterval(timer);
// 			}
// 			if (opacity >= .5) {
// 				document.getElementById('container-start').classList
// 						.add('activecontainer');
// 			}
// 			element.style.opacity = opacity;
// 			opacity += 0.1;
// 		}, 50);
// 		element.style.display = 'block';
// 	}
	
// 	$('#myTabs a').click(function(e) {
// 		e.preventDefault()
// 		$(this).tab('show')
// 	});
// 	$('#myTabs a[href="#profile"]').tab('show') // Select tab by name
// 	$('#myTabs a:first').tab('show') // Select first tab
// 	$('#myTabs a:last').tab('show') // Select last tab
// 	$('#myTabs li:eq(2) a').tab('show') // Select third tab (0-indexed)
	
// 	var imageOverlay = document.getElementById('image-overlay');

// 	function openimg() {
// 		imageOverlay.style.transform = "scale(1)";
// 		document.getElementById('a2').style.display = "block";
// 	}

// 	function closeimg() {
// 		imageOverlay.style.transform = "scale(0)";
// 		document.getElementById('a2').style.display = "none";
// 	}
// 	var aboutOverlay = document.getElementById('about-overlay');

// 	function openabout() {
// 		aboutOverlay.style.transform = "scale(1)";
// 		document.getElementById('a5').style.display = "block";
// 	}

// 	function closeabout() {
// 		aboutOverlay.style.transform = "scale(0)";
// 		document.getElementById('a5').style.display = "none";
// 	}

// 	document.getElementById('a5').onclick = function() {
// 		if (aboutOverlay.style.transform == "scale(1)") {
// 			aboutOverlay.style.transform = "scale(0)";
// 			this.style.borderBottom = '2px solid #76b9ed';
// 		} else {
// 			aboutOverlay.style.transform = "scale(1)"
// 			this.style.border = 'none';
// 		}
// 	}

// 	document.getElementById('a2').onclick = function() {
// 		if (imageOverlay.style.transform == "scale(1)") {
// 			imageOverlay.style.transform = "scale(0)";
// 			this.style.borderBottom = '2px solid #76b9ed';
// 		} else {
// 			imageOverlay.style.transform = "scale(1)"
// 			this.style.border = 'none';
// 		}
// 	}
// 	var videoOverlay = document.getElementById('video-overlay');

// 	function closevid() {
// 		videoOverlay.style.transform = "scale(0)";
// 		document.getElementById('a3').style.display = "none";
// 	}
// 	document.getElementById('a3').onclick = function() {
// 		if (videoOverlay.style.transform == "scale(1)") {
// 			videoOverlay.style.transform = "scale(0)";
// 			this.style.borderBottom = '2px solid #76b9ed';
// 		} else {
// 			videoOverlay.style.transform = "scale(1)"
// 			this.style.border = 'none';
// 		}
// 	}
// 	var noteOverlay = document.getElementById('note-overlay');

// 	function opennote() {
// 		noteOverlay.style.transform = "scale(1)";
// 		document.getElementById('a4').style.display = "block";
// 	}

// 	function closenote() {
// 		noteOverlay.style.transform = "scale(0)";
// 		document.getElementById('a4').style.display = "none";
// 	}
// 	document.getElementById('a4').onclick = function() {
// 		if (noteOverlay.style.transform == "scale(1)") {
// 			noteOverlay.style.transform = "scale(0)";
// 			this.style.borderBottom = '2px solid #76b9ed';
// 		} else {
// 			noteOverlay.style.transform = "scale(1)"
// 			this.style.border = 'none';
// 		}
// 	}
	var computer = document.getElementById('icon-computer');

	var computerOverlay = document.getElementById('overlay-computer');

	function opencom() {
		computerOverlay.style.transform = "scale(1)";
		document.getElementById('a1').style.display = "block";
	}

	function closecom() {
		computerOverlay.style.transform = "scale(0)";
		document.getElementById('a1').style.display = "none";
	}

	function closeopencom() {
		computerOverlay.style.transform = "scale(0)";
		document.getElementById('a1').style.display = "block";
		document.getElementById('a1').style.borderBottom = '2px solid #76b9ed';
	}
	document.getElementById('a1').onclick = function() {
		if (computerOverlay.style.transform == "scale(1)") {
			computerOverlay.style.transform = "scale(0)";
			this.style.borderBottom = '2px solid #76b9ed';
		} else {
			computerOverlay.style.transform = "scale(1)"
			this.style.border = 'none';
		}
	}
	var div = document.getElementById('overlay-computer'), mouseclick = document
			.getElementById('first-row-win');

	mouseclick.addEventListener('mousedown', function(e) {
		isDown = true;
		offset = [ div.offsetLeft - e.clientX, div.offsetTop - e.clientY ];
	}, true);

	document.addEventListener('mouseup', function() {
		isDown = false;
	}, true);

	document.addEventListener('mousemove', function(event) {
		event.preventDefault();
		if (isDown) {
			mousePosition = {
				x : event.clientX,
				y : event.clientY
			};
			div.style.left = (mousePosition.x + offset[0]) + 'px';
			div.style.top = (mousePosition.y + offset[1]) + 'px';
		}
	}, true);

	var resizer = document.getElementsByClassName('resizer')[0];
	resizer.addEventListener('mousedown', initDrag, false);
	div.onresize = function() {
		resizer.style.bottom = 0;
		resizer.style.right = 0;
	}

	var startX, startY, startWidth, startHeight;

	function initDrag(e) {
		startX = e.clientX;
		startY = e.clientY;
		startWidth = parseInt(document.defaultView.getComputedStyle(div).width,
				10);
		startHeight = parseInt(
				document.defaultView.getComputedStyle(div).height, 10);
		document.documentElement.addEventListener('mousemove', doDrag, false);
		document.documentElement.addEventListener('mouseup', stopDrag, false);
	}

	function doDrag(e) {
		div.style.width = (startWidth + e.clientX - startX) + 'px';
		div.style.height = (startHeight + e.clientY - startY) + 'px';
	}

	function stopDrag(e) {
		document.documentElement
				.removeEventListener('mousemove', doDrag, false);
		document.documentElement
				.removeEventListener('mouseup', stopDrag, false);
	}
	div.onscroll = function() {
		resizer.style.bottom = (0 - div.scrollTop) + "px";
		resizer.style.right = 0;
	}

	function upercom() {
		div.style.width = "100%";
		div.style.top = "0";
		div.style.left = "0";
		div.style.height = "95.3vh";
		document.getElementById('upercam').style.display = "none";
		document.getElementById('returncam').style.display = "inline";
	}

	function returncom() {
		div.style.width = "70%";
		div.style.top = "20%";
		div.style.left = "15%";
		div.style.height = "60%";
		document.getElementById('returncam').style.display = "none";
		document.getElementById('upercam').style.display = "inline";
	}

// 	var colorBox = document.getElementsByClassName('color-box')[0], btn = document
// 			.getElementsByClassName('gear-check')[0];
// 	btn.onclick = function parenti() {
// 		'use strict';
// 		colorBox.style.right = `-${colorBox.offsetWidth}px`;
// 		btn.style.right = `-${colorBox.offsetWidth}px`;
// 		btn.onclick = function childi() {
// 			colorBox.style.right = `0px`;
// 			btn.style.right = `0px`;
// 			btn.onclick = function() {
// 				return parenti();
// 			}
// 		}
// 	}
	//# sourceURL=pen.js
</script>

</body>
</html>