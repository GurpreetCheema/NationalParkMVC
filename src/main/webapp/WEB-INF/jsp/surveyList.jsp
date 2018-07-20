<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/header.jspf" %>

<c:set var="pageTitle" value="NP Results"></c:set>

<c:url var="surveyList" value="/SurveyList"/>

<hr>

<table class ="topParks">
<pre class="tab">                  Top Parks               Name| Votes                        Description </pre>>
<!--  <tr><h1> Top Parks </h1></tr>
<tr><h1> Name| Votes </h1><tr>
<tr><h1> Description </h1></tr>
  -->

<c:forEach var="parks" items="${topParks}">
<tr>
	<td class="topImage"> 
	<div id="park-info">
	<c:url var="parksImgUrl" value="/img/parks/${parks.parkCodeLower}.jpg" />
		<c:url var="parkDetailPageUrl" value="/parkDetail/${parks.parkCode}"/>
			<img src="${parksImgUrl}"/>
			</td>
			
			<td class ="parkName">
		<h4><c:out value="${parks.parkName}" /> <c:out value=" | Total Votes: ${parks.count}" /></h4>
</td>

	<td class ="parkDesc">	<c:out value="${parks.parkDescription}" /> <br></td>

	</tr>
	
</c:forEach>
	</table>
<%@include file="common/footer.jspf" %>