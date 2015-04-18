<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="calendar-header calendar-secondary">
    My calendar
    <div class="pull-right">
	<a href="#" class="glyphicon glyphicon glyphicon-plus"></a>
	<a href="#" class="glyphicon glyphicon-chevron-left"></a>
	<a href="#" class="glyphicon glyphicon-chevron-right"></a>
    </div>
</div>
<table class="calendar calendar-secondary">
    <tr>
	<th>Period</th>
	<th>Monday</th>
	<th>Tuesday</th>
	<th>Wednesday</th>
	<th>Thursday</th>
	<th>Friday</th>
	<th>Saturday</th>
	<th>Sunday</th>
    </tr>
    <c:forEach begin="0" end="23" var="hour">
    <tr>
	<td>${hour}:00 - ${hour + 1}:00</td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
    </tr>
    </c:forEach>
</table>