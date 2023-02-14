<%-- 
    Document   : statelist
    Created on : 13-Feb-2023, 12:01:11 pm
    Author     : Nairwita Chakraborty
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<option value="">Select a State</option>
<c:forEach items="${StateList}" var="province">
    <option value=${province.getStateCode()} <c:if test="${province.getStateCode().equalsIgnoreCase(Users.getStateCode())}"> selected </c:if>> ${province.getStateName()}  </option>
</c:forEach>
