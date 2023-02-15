<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <style>
            .vl {
                border-left: 1px solid grey;
                height: 723px;
                margin-left: 10px;
            }
        </style>


        <div style="position :relative; height: 700px;">

            <div class="d-flex" style="position: absolute; left: 2px">

                <div class="container mt-5">
                    <div class="list-group">
                        <a href="/admin/userForm" class="list-group-item list-group-item-action active"
                            aria-current="true">
                            회원관리
                        </a>
                        <a href="/admin/boardForm" class="list-group-item list-group-item-action">게시글 관리</a>
                        <a href="/admin/replyForm" class="list-group-item list-group-item-action">댓글 관리</a>
                    </div>
                </div>

                <div class="vl">

                </div>

            </div>


            <div class="d-flex justify-content-center">
                <div style="position: absolute; top: 50px">

                    <table class="table">
                        <thead>
                            <tr class="my-text-align">
                                <th scope="col">#</th>
                                <th scope="col">id</th>
                                <th scope="col">유저 아이디</th>
                                <th scope="col">비밀번호</th>
                                <th scope="col">이메일</th>
                                <th scope="col">가입일자</th>
                                <th scope="col"></th>

                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${userList}" var="user">
                                <tr class="my-text-align">
                                    <th scope="row"></th>
                                    <td>${user.id}</td>
                                    <td>${user.username}</td>
                                    <td>${user.password}</td>
                                    <td>${user.email}</td>
                                    <td>${user.createdAtToString}</td>
                                    <c:if test="${user.username != 'ADMIN'}">
                                        <td><button onclick="deleteById(`${user.id}`)" class="btn-xs">삭제</button>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>


        </div>

        <script>
            function deleteById(id) {
                $.ajax({
                    type: "delete",
                    url: "/admin/user/delete/" + id,
                    dataType: "json"
                }).done((res) => {
                    alert(res.msg);
                    location.href = "/admin/userForm";
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            }
        </script>
        <%@ include file="../layout/footer.jsp" %>