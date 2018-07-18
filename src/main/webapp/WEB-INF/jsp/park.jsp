<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="common/header.jspf"%>

<c:url var="parksHomePageUrl" value="/"/>

<c:forEach var="parks" items="${parks}">

<div class=“imageForPark”>
<c:url var="parksImgUrl" value="/img/parks/${parks.parkCodeLower}.jpg" />
<img src="${parksImgUrl}"/>
<br/>
<strong>${parks.parkName}</strong>
<p>${parks.parkDescription}</p>

 </div>

</c:forEach>



<%@include file="common/footer.jspf"%>
