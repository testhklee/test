<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h1>list page</h1>


<table border="1" style="width: 1300px;">
	<c:if test="${!empty list }">
		<colgroup>
			<col width="50px" />
			<col width="30px" />
			<col width="100px" />
			<col width="100px" />
			<col width="100px" />
			<col width="100px" />
			<col width="100px" />
			<col width="100px" />
		</colgroup>
		<tr>
			<th>email</th>
			<th>password</th>
			<th>name</th>
			<th>tel</th>
			<th>face</th>
			<th>가입날짜</th>
			<th>탈퇴시키기</th>
			<th>등급변경</th>

		</tr>

		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.memberEmail }</td>
				<td>${dto.memberPw }</td>
				<td>${dto.memberName }</td>
				<td>${dto.memberTel }</td>
				<td>${dto.memberFace }</td>
				<td>${dto.memberJoinDate }</td>
				<td><button>탈퇴시키기</button></td>
				<td><select>
						<option>비지니스등급</option>
						<option>티쳐등급</option>
				</select>
					<button>등급변경</button></td>
			</tr>
		</c:forEach>


	</c:if>
</table>
