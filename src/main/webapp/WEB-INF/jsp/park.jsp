<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="common/header.jspf"%>

<c:url var="parksHomePageUrl" value="/"/>

<c:forEach var="parks" items="${parks}">

	<div class=imageForPark€>
		<c:url var="parksImgUrl" value="/img/parks/${parks.parkCodeLower}.jpg" />
		<c:url var="parkDetailPageUrl" value="/parkDetail/${parks.parkCode}"/>
			<img src="${parksImgUrl}"/>
			<br/>
			<h4>${parks.parkName}</h4>
			<p>${parks.parkDescription}</p>
			<a href="${parkDetailPageUrl}"><div class="btn btn-success">Park Details</div></a>
			<br/><hr/>
	 </div>
</c:forEach>



<%@include file="common/footer.jspf"%>
