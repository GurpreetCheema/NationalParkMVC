<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="common/header.jspf"%>

<c:forEach var="park" items="${parks}">

<div class=“imageForPark”>
<c:url var="parkImgUrl" value="${park.imageName}" />
<img src="${parkImgUrl}"/>


 </div>

<%-- <div class="parkdescription">
<a href="${parkLink }" ><c:out value="${parkInfo.parkName }"/></a>

<p><c:out value="${parkInfo.parkDescription }"/></p>

</div>

</div> --%>

</c:forEach>









<%@include file="common/footer.jspf"%>
