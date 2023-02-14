<%-- 
    Document   : districtlist
    Created on : 13-Feb-2023, 3:31:55 pm
    Author     : Nairwita Chakraborty
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<option value="">Select a District</option>
<c:forEach items="${DistrictList}" var="district">
    <option value=${district.getDistCode()} <c:if test="${district.getDistCode().equalsIgnoreCase(Users.getDistCode())}"> selected </c:if>> ${district.getDistName()}  </option>
</c:forEach>
