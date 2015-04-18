<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="calendar-header">
    Lessons
    <div class="pull-right">
	<a href="#" class="glyphicon glyphicon glyphicon-plus"></a>
    </div>
</div>
<table class="calendar">
    <tr>
	<th>Period</th>
	<th>Monday</th>
	<th>Tuesday</th>
	<th>Wednesday</th>
	<th>Thursday</th>
	<th>Friday</th>
    </tr>
    <c:forEach var="period" items="${periods}">
    <tr>
	<td>${period}</td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
    </tr>
    </c:forEach>
</table>