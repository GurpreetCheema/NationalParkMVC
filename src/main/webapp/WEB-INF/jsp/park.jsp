<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="common/header.jspf"%>

<c:url var="parksHomePageUrl" value="/"/>

<c:forEach var="parks" items="${parks}">

	<div class=clearfix>
		<c:url var="parksImgUrl" value="/img/parks/${parks.parkCodeLower}.jpg" />
		<c:url var="parkDetailPageUrl" value="/parkDetail/${parks.parkCode}"/>
			<img class="homeParks" src="${parksImgUrl}"/>

		<p class="parkName">${parks.parkName}</p>
		<br>
		<p>${parks.parkDescription}</p>
		<br>
		<a href="${parkDetailPageUrl}"><div class="btn btn-success">${parks.parkName} Details</div></a><br>
	 	<br/>
	 	</div>
	 	<hr class ="styleHr">
</c:forEach>



<%@include file="common/footer.jspf"%>
