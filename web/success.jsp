<%-- 
    Document   : success
    Created on : 13-Feb-2023, 2:52:59 pm
    Author     : Nairwita Chakraborty
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="successMsg" value="Your request was successful." />
<div class="success-msg">
    <p><c:out value="${successMsg}"/></p>
</div>
