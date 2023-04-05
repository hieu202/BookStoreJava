<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- import sf: spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base }/css/contact.css">
<sf:form modelAttribute="contactDTO" action="${base }/contact-post-using-spring-form" method="post">
  <label for="fname">Tên:</label>  
  <sf:input path="firstName" type="text" id="fname" name="firstname" required="required" /><br><br>

  <label for="lname">Họ:</label>
  <sf:input path="lastName" type="text" id="lname" name="lastname" required="required" /><br><br>

  <label for="email">Email:</label>
  <sf:input path="email" type="email" id="email" name="email" required="required" /><br><br>

  <label for="details">Thông tin liên hệ:</label>
  <sf:textarea path = "message" id="details" name="details" rows="5" cols="30" required="required" ></sf:textarea><br><br>

  <input type="submit" value="Gửi" />
</sf:form>