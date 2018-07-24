<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/header.jspf" %>

<c:set var="pageTitle" value="NP Results"></c:set>

<c:url var="surveyList" value="/SurveyList"/>

<hr>


-<h1> Top Parks </h1>

<c:forEach var="parks" items="${topParks}">
<div class=clearfix>

	
	<c:url var="parksImgUrl" value="/img/parks/${parks.parkCodeLower}.jpg" />
		<c:url var="parkDetailPageUrl" value="/parkDetail/${parks.parkCode}"/>
			<img class="homeParks" src="${parksImgUrl}"/>
			
			
			<p class ="parkName">
		<p class="parkName"><c:out value="${parks.parkName}" /></p> <p class="votes"><c:out value="Total Votes: ${parks.count}" /></p>
</p>

	<c:out value="${parks.parkDescription}" /> <br>

</div>
<hr/>
</c:forEach>
	
<%@include file="common/footer.jspf" %>