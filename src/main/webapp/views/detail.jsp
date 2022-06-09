<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="common/header.jsp" %>

<section class="container">
    <div class="bg-white px-48 py-10">
        <div class="flex flex-col xl:flex-row ">
            <div id="bookThumbnail" class="flex-grow-1 w-60"></div>
            <div class="flex flex-col">
                <div id="bookTitle" class="flex flex-col mt-6"></div>
                <div class="flex flex-col">
                    <div id="bookAuthor" class="text-gray-500 flex-row mt-2"></div>
                    <div class="text-l mt-2">
                        <c:if test="${starAVG ne 0}">
                            평균 ★ ${starAVG} (${starCount}명)
                        </c:if>
                        <c:if test="${starAVG eq 0}">
                            평균 ★ ${starAVG} (0명)
                        </c:if>
                    </div>
                </div>

                <div class="flex flex-row mt-24 space-x-16">

                    <%--비로그인 시 선택 불가능--%>
                    <c:if test="${empty authInfo}">
                        <div class="flex flex-col items-center justify-center">
                            <span id="starMsgUL" class="text-gray-600 mb-2">평가하기</span>
                            <div class="star-group flex text-5xl flex-row-reverse">
                                <input type="radio" id="star-1" class="hidden" onclick="alert('로그인 후 이용가능합니다.')"
                                       onmouseover="mouseOverUL('최고예요!')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-1"
                                       class="s1 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onclick="alert('로그인 후 이용가능합니다.')" onmouseover="mouseOverUL('최고예요!')"
                                       onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                                <input type="radio" id="star-2" class="hidden" onmouseover="mouseOverUL('재미있어요')"
                                       onclick="alert('로그인 후 이용가능합니다.')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-2"
                                       class="s2 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverUL('재미있어요')"
                                       onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                                <input type="radio" id="star-3" class="hidden" onmouseover="mouseOverUL('보통이에요')"
                                       onclick="alert('로그인 후 이용가능합니다.')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-3"
                                       class="s3 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverUL('보통이에요')"
                                       onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                                <input type="radio" id="star-4" class="hidden" onmouseover="mouseOverUL('재미없어요')"
                                       onclick="alert('로그인 후 이용가능합니다.')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-4"
                                       class="s4 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverUL('재미없어요')"
                                       onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                                <input type="radio" id="star-5" class="hidden" onmouseover="mouseOverUL('싫어요')"
                                       onclick="alert('로그인 후 이용가능합니다.')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-5"
                                       class="s5 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverUL('싫어요')" onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                            </div>
                        </div>

                        <div class="flex flex-col">
                            <span class="text-gray-600">읽고싶어요</span>
                            <div class="text-4xl cursor-pointer mt-3 text-center" onclick="alert('로그인 후 이용가능합니다.')">
                                &#x2795
                            </div>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-gray-600">코멘트</span>
                            <div class="text-3xl cursor-pointer mt-4 text-center" onclick="alert('로그인 후 이용가능합니다.')">
                                &#x270F
                            </div>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-gray-600">읽는중</span>
                            <div class="text-4xl cursor-pointer mt-4 text-center" onclick="alert('로그인 후 이용가능합니다.')">
                                &#x1F440
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${!empty authInfo}">
                        <%--로그인 시 선택 가능--%>
                        <div class="flex flex-col items-center justify-center">
                                <%--                            <c:if test="${empty userStarMsg}">--%>
                            <span id="starMsgL" class="text-gray-600"></span>
                                <%--                            </c:if>--%>
                            <span id="userStarMsg" class="text-gray-600">${userStarMsg}</span>
                            <div class="star-group flex text-5xl flex-row-reverse mt-2">
                                <input type="radio" id="star1" value=5 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('최고예요!')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 5}">checked="checked"</c:if>/>
                                <label for="star1"
                                       class="s1 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('최고예요!')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star2" value=4 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('재미있어요')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 4}">checked="checked"</c:if>/>
                                <label for="star2"
                                       class="s2 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('재미있어요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star3" value=3 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('보통이에요')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 3}">checked="checked"</c:if>/>
                                <label for="star3"
                                       class="s3 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('보통이에요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star4" value=2 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('재미없어요')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 2}">checked="checked"</c:if>/>
                                <label for="star4"
                                       class="s4 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('재미없어요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star5" value=1 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('싫어요')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 1}">checked="checked"</c:if>/>
                                <label for="star5"
                                       class="s5 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('싫어요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                            </div>
                        </div>

                        <div class="flex flex-col">
                            <span class="text-gray-600">읽고싶어요</span>
                            <label class="swap mt-2">
                                <input name="want" type="checkbox"
                                       <c:if test="${userStatus == 0}">checked="checked"</c:if>/>
                                <div class="swap-on text-3xl" onclick="insertStatus(0)">&#x2714</div>
                                <div class="swap-off text-4xl" onclick="deleteStatus(0)">&#x2795</div>
                            </label>
                        </div>

                        <c:if test="${!empty userStatusNo}">
                            <div class="flex flex-col">
                                <span class="text-gray-600 mb-2 ml-2">코멘트</span>
                                <div class="dropdown">
                                    <div tabindex="0"
                                         class="btn m-1 bg-white border-white hover:bg-white hover:border-white text-3xl">
                                        &#x270F
                                    </div>
                                    <ul tabindex="0"
                                        class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-36">
                                        <li><label for="modifyComment" class="text-gray-600 hover:text-white justify-center items-center">코멘트 수정</label></li>
                                        <li><a class="text-gray-600 hover:text-white justify-center items-center">코멘트 삭제</a></li>
                                    </ul>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${empty userStatusNo}">
                            <div class="flex flex-col">
                                <span class="text-gray-600 mb-2 ml-2">코멘트</span>
                                <label for="my-modal-3"
                                       class="btn modal-button bg-white border-white hover:bg-white hover:border-white text-3xl">&#x270F</label>
                            </div>
                        </c:if>

                        <div class="flex flex-col">
                            <span class="text-gray-600 mb-2">읽는중</span>
                            <label class="swap mt-2">
                                <input name="read" type="checkbox"
                                       <c:if test="${userStatus == 1}">checked="checked"</c:if>/>
                                <div class="swap-on text-3xl" onclick="insertStatus(1)">&#x1F4D6</div>
                                <div class="swap-off text-3xl" onclick="deleteStatus(1)">&#x1F440</div>
                            </label>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <%--코멘트 작성 폼--%>
    <input type="checkbox" id="my-modal-3" class="modal-toggle"/>
    <div class="modal bg-opacity-60 bg-gray-300">
        <div class="modal-box relative space-y-2 h-4/5 w-11/12 max-w-3xl">
            <form:form modelAttribute="requestWriteComment">
                <label for="my-modal-3"
                       class="btn btn-secondary btn-sm btn-circle absolute right-2 top-2 text-gray-600 hover:text-white">✕</label>
                <div id="title" class="text-gray-600 mb-3 text-center"></div>
                <textarea class="content w-full text-gray-600" rows="13" id="comment" name="comment"
                          placeholder="이 작품의 대한 생각을 자유롭게 표현해주세요."></textarea>
                <div class="ml-56 mt-2">
                    <div class="flex flex-row text-gray-600 space-x-2">
                        <span> 독서 시작 날짜 : </span>
                        <div>
                            <input type="date" id="startDate" name="startDate" class="text-gray-400"/>
                        </div>
                    </div>
                    <div class="flex flex-row text-gray-600 space-x-2">
                        <span> 독서 완료 날짜 : </span>
                        <div>
                            <input type="date" id="endDate" name="endDate" class="text-gray-400"/>
                        </div>
                    </div>
                    <div class="flex flex-row text-gray-600 space-x-2">
                        <span> 공개 여부 :</span>
                        <span>공개 </span>
                        <input class="checkbox checkbox-secondary checkbox-sm mt-1" type="checkbox" id="coPrvY"
                               name="coPrv"
                               value="공개" onclick='checkOnlyOne(this)'/>
                        <span>비공개 </span>
                        <input class="checkbox checkbox-secondary checkbox-sm mt-1" type="checkbox" id="coPrvN"
                               name="coPrv"
                               value="비공개"
                               onclick='checkOnlyOne(this)'/>
                    </div>
                </div>
                <div class="modal-action justify-center items-center">
                    <input type="submit" id="submit1" onsubmit="return false" for="my-modal-3" class="btn btn-secondary text-gray-600 hover:text-white"
                           value="저장"/>
                </div>
            </form:form>
        </div>
    </div>

    <%--코멘트 수정 폼--%>
    <input type="checkbox" id="modifyComment" class="modal-toggle"/>
    <c:forEach var="myComment" items="${myComment}">
        <div class="modal bg-opacity-60 bg-gray-300">
            <div class="modal-box relative space-y-2 h-4/5 w-11/12 max-w-3xl">
                <form:form modelAttribute="requestModifyComment">
                    <label for="modifyComment"
                           class="btn btn-secondary btn-sm btn-circle absolute right-2 top-2 text-gray-600 hover:text-white">✕</label>
                    <textarea class="content w-full text-gray-600 mt-6" rows="14" id="comment_m" name="comment"
                              placeholder="${myComment.comment}"></textarea>
                    <div class="ml-56 mt-2">
                        <div class="flex flex-row text-gray-600 space-x-2">
                            <span> 독서 시작 날짜 : </span>
                            <div>
                                <input type="date" id="startDate_m" name="startDate" class="text-gray-400"/>
                            </div>
                        </div>
                        <div class="flex flex-row text-gray-600 space-x-2">
                            <span> 독서 완료 날짜 : </span>
                            <div>
                                <input type="date" id="endDate_m" name="endDate" class="text-gray-400"/>
                            </div>
                        </div>
                        <div class="flex flex-row text-gray-600 space-x-2">
                            <span> 공개 여부 :</span>
                            <span>공개 </span>
                            <input class="checkbox checkbox-secondary checkbox-sm mt-1" type="checkbox" id="coPrvY_m"
                                   name="coPrv"
                                   value="공개" onclick='checkOnlyOne(this)'/>
                            <span>비공개 </span>
                            <input class="checkbox checkbox-secondary checkbox-sm mt-1" type="checkbox" id="coPrvN_m"
                                   name="coPrv"
                                   value="비공개"
                                   onclick='checkOnlyOne(this)'/>
                        </div>
                    </div>
                    <div class="modal-action justify-center items-center">
                        <input type="submit" for="modifyComment" class="btn btn-secondary text-gray-600 hover:text-white"
                               value="저장"/>
                    </div>
                </form:form>
            </div>
        </div>
    </c:forEach>

    <div class="bg-gray-100 pl-24 pr-24 pt-8 pb-8">


        <div id="writeCommentBtn" class="rounded-xl flex flex-col justify-center shadow-xl bg-white mb-4"></div>
        <div id="myComment" class="rounded-xl flex flex-col justify-center shadow-xl bg-white mb-4"></div>

        <div class="rounded-xl flex flex-col justify-center shadow-xl bg-white py-2">
            <div class="p-4 pr-8">
                <div class="p-4"><span class="text-2xl font-bold text-gray-600">기본정보</span></div>
                <div id="authors" class="flex pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold text-gray-600">저자 : </span>
                </div>
                <div id="publisher" class="flex pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold text-gray-600">출판사 : </span>
                </div>
                <div id="datetime" class="flex pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold text-gray-600">제작년도 : </span>
                </div>
                <div id="contents" class="flex flex-col pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold mb-2 text-gray-600">줄거리</span>
                </div>
                <div id="isbn_content" class="flex pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold text-gray-600">ISBN : </span>
                </div>
            </div>

            <div class="border-b-2 border-blue-100"></div>

            <div class="p-4">
                <div class="flex flex-row">
                    <span class="p-4 text-2xl font-bold text-gray-600 flex flex-row">코멘트</span>
                    <div class="pt-5 text-gray-600">
                        <c:if test="${!empty commentCount}">
                            Total : ${commentCount}
                        </c:if>
                    </div>
                </div>

                <div class="carousel carousel-center pl-4 pb-4 space-x-2 w-pull bg-white ">
                    <div class="carousel-item rounded-lg bg-gray-100 w-80 h-72 flex flex-col">
                        <c:if test="${!empty commentsByMembers}">
                            <c:forEach var="comment" items="${commentsByMembers}">
                                <div class="p-4 space-x-4">
                                    <div class="flex flex-row border-b-2 border-gray-300">
                                        <div class="mr-2 text-gray-600">${comment.originPic}</div>
                                        <div class="text-gray-600">${comment.id}</div>
                                        <div class="ml-24 text-yellow-400" id="star${comment.appraisalNo}">
                                            <c:if test="${comment.star==1 }">★☆☆☆☆</c:if>
                                            <c:if test="${comment.star==2 }">★★☆☆☆</c:if>
                                            <c:if test="${comment.star==3 }">★★★☆☆</c:if>
                                            <c:if test="${comment.star==4 }">★★★★☆</c:if>
                                            <c:if test="${comment.star==5 }">★★★★★</c:if>
                                        </div>
                                    </div>
                                    <div class="mt-3 text-gray-600"
                                         id="content${comment.appraisalNo}">${comment.comment}</div>
                                    <div class="flex flex-row mt-28 px-5">
                                        <div>&#x1F4C6</div>
                                        <div class="ml-2 text-gray-600" id="startDate${comment.appraisalNo}">
                                                ${comment.startDate}
                                        </div>
                                        <div class="ml-3 text-gray-600" id="endDate${comment.appraisalNo}">
                                                ${comment.endDate}
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {
//     		 # 상세페이지 실행하자마자 도서 데이터 요청
            var pageNum = 1;
            var isbn_query = "${isbn}";
            console.log("isbn_query:" + isbn_query);
            $.ajax({	//카카오 검색요청 / [요청]
                method: "GET",
                url: "https://dapi.kakao.com/v3/search/book",
                data: {query: isbn_query, page: pageNum},
                headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
            })

                .done(function (msg) {	//검색 결과 담기 / [응답]
                    console.log(msg);
                    $("#bookThumbnail").append("<img class='h-[20rem] shadow-xl rounded' src='" + msg.documents[0].thumbnail + "'/>");		//표지
                    $("#bookTitle").append("<div class='flex flex-col'><span class='font-semibold text-3xl'>" + msg.documents[0].title + "</span></div>");
                    $("#title").append("<span class='font-semibold text-xl'>" + msg.documents[0].title + "</span>");
                    $("#bookAuthor").append("<span class='text-xl'>" + msg.documents[0].authors + "</span>");
                    $("#authors").append("<h5> " + msg.documents[0].authors + "</h5>");		//저자
                    $("#publisher").append("<h5>" + msg.documents[0].publisher + "</h5>");		//출판사
                    $("#datetime").append("<h5>" + msg.documents[0].datetime.slice(0, 10) + "</h5>");		//일련번호
                    $("#contents").append("<h5>" + msg.documents[0].contents + "...</h5>");		//줄거리
                    $("#isbn_content").append("<h5>" + msg.documents[0].isbn.slice(-13) + "</h5>");		//일련번호
                    $("#isbn").val(msg.documents[0].isbn.slice(-13));
                });
        })

        $(document).ready(function () {
            $("#starMsgL").append("평가하기");

            //로그인한 회원이 별점을 남겼다면
            <c:if test="${!empty userStarMsg}">
            $("#starMsgL").hide();
            </c:if>

            //로그인한 회원이 읽고싶어요 / 읽는 중을 체크했다면
            <c:if test="${!empty userStatus}">
            $("#writeCommentBtn").show(writeCommentBtn());
            </c:if>

            //로그인한 회원이 코멘트를 남겼다면
            <c:if test="${!empty userStatusNo}">
                <c:forEach var="myComment" items="${myComment}">
                    <c:if test="${!empty myComment.originPic}">
                    $("#writeCommentBtn").hide();
                    $("#myComment").show(
                        myComment("${myComment.originPic}","${myComment.startDate}","${myComment.endDate}","${myComment.id}","${myComment.comment}")
                    );
                    </c:if>
                </c:forEach>
            </c:if>


        });

        $("#submit1").click(function(){
            let date = new Date();
            let startDate = document.getElementById("startDate").value;
            let endDate = document.getElementById("endDate").value;

            function getFormatDate(date){
                var year = date.getFullYear();              //yyyy
                var month = (1 + date.getMonth());          //M
                month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
                var day = date.getDate();                   //d
                day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
                return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
            }

            let maxDate = getFormatDate(date);

            if (startDate > maxDate) {
                alert("[독서 시작 날짜] 오늘 이후의 날짜는 선택할 수 없습니다");
                return false;
            }else if(endDate > maxDate){
                alert("[독서 완료 날짜] 오늘 이후의 날짜는 선택할 수 없습니다");
                return false;
            }
        });




        // 별 마우스 오버 starMsgUL
        function mouseOverUL(a) {
            let starMsg = document.getElementById("starMsgUL");
            starMsg.innerHTML = a;
        }

        function mouseOffUL(a) {
            let starMsg = document.getElementById("starMsgUL");
            starMsg.innerHTML = a;
        }

        // 별 마우스 오버 starMsgL
        function mouseOverL(a) {
            let starMsg = document.getElementById("starMsgL");
            starMsg.innerHTML = a;
        }

        function mouseOffL(a) {
            let starMsg = document.getElementById("starMsgL");
            starMsg.innerHTML = a;
        }

        // 별점 평가 등록, 수정, 삭제
        function star(star) {
            let isbn = "${isbn}";
            console.log(isbn)

            $.ajax({
                url: '<c:url value="/star"/>',
                type: 'POST',
                data: JSON.stringify({
                    "star": star,
                    "isbn": isbn
                }),
                contentType: 'application/json',
                success: function (data) {
                    if (data == 2) {
                        document.getElementById("userStarMsg").innerHTML = "평가하기";
                        $("input:radio[name='star']").prop('checked', false);
                    } else if (data.star != null) {
                        console.log("data.star : " + data.star);
                        console.log("data.starMsg : " + data.starMsg);
                        $("#starMsgL").hide();
                        document.getElementById("userStarMsg").innerHTML = data.starMsg;
                    }
                }, error: function (map) {
                    console.log("에러");
                }

            });
        }


        // 읽고싶어요, 읽는중 등록 또는 수정
        function insertStatus(status) {
            let userStatusNo = "${userStatusNo}";
            let isbn = "${isbn}";

            $.ajax({
                url: '<c:url value="/insertOrUpdate"/>',
                type: 'POST',
                data: JSON.stringify({
                    "status": status,
                    "isbn": isbn
                }),
                contentType: 'application/json',
                success: function (data) {
                    console.log("data : " + data);

                    if(userStatusNo.length != 0){
                        $("#writeCommentBtn").off(writeCommentBtn());
                        return;
                    }

                    if (data == 0) {
                        $("#writeCommentBtn").show(writeCommentBtn());
                        $("input[name=read]").prop("checked", false);
                    } else if (data == 1) {
                        $("#writeCommentBtn").show(writeCommentBtn());
                        $("input[name=want]").prop("checked", false);
                    } else if (data == 2) {
                        $("#writeCommentBtn").hide(writeCommentBtn());
                    }
                }, error: function (data) {
                    console.log("에러");
                }

            });
        }


        // 코멘트 남기기 버튼 클릭 시 코멘트 작성 폼 보여짐
        function writeCommentBtn() {
            $("#writeCommentBtn").html(
                '<div class="p-4 text-center">' +
                '<label for="my-modal-3" class="btn modal-button w-96 bg-white border-white hover:bg-gray-200 hover:border-gray-200">코멘트 남기러가기</label>' +
                '</div>'
            );
        }

        // 읽고싶어요, 읽는 중 중복 클릭 시 기존 상태 삭제
        function deleteStatus(status) {
            let isbn = "${isbn}";

            $.ajax({
                url: '<c:url value="/delete"/>',
                type: 'POST',
                data: JSON.stringify({
                    "status": status,
                    "isbn": isbn
                }),
                contentType: 'application/json',
                success: function (data) {
                    console.log("data : " + data);
                    $("#writeCommentBtn").hide();
                }, error: function (data) {
                    console.log("에러");
                }

            });
        }

        // 공개 여부 체크 시 둘 중 하나만 선택
        function checkOnlyOne(chk) {
            let obj = document.getElementsByName("coPrv");
            for (var i = 0; i < obj.length; i++) {
                if (obj[i] != chk) {
                    obj[i].checked = false;
                }
            }
        }

        function myComment(pic, startDate, endDate, id, comment) {

            console.log(pic);
            console.log(id);
            console.log(comment);
            console.log(startDate);
            console.log(endDate);

            $("#myComment").html(
                '<div class="p-4 text-center flex flex-row space-x-4 justify-center items-center">' +
                    '<span class="text-gray-600">' + pic + '</span>' +
                    '<span class="text-gray-600 text-xl">' + id + '</span>' +
                    '<span class="text-gray-600">' + comment + '</span>' +
                    '<span class="text-gray-600">' + startDate + '</span>' +
                    '<span class="text-gray-600">' + endDate + '</span>' +
                    '<label class="pl-24 flex flex-row">'+
                        '<label for="modifyComment" class="text-gray-400 hover:text-black pr-2"><div>&#x1F4DD</div>수정' + '</label>'+
                        '<div class="text-gray-400 hover:text-black"><div>&#x1F5D1</div>삭제' + '</div>'+
                    '</div>'+
                '</div>'
            );
        }
    </script>

</section>

<%@ include file="common/footer.jsp" %>