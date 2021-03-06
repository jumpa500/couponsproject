<%@page import="java.util.Collection"%>
<%@page import="il.ac.hit.couponsproject.model.dto.Coupon"%>
<%@page import="il.ac.hit.couponsproject.configuration.constants.IConstants"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="customtag"%>
<%
	String contextPath = request.getContextPath();
%>
<%-------------------------------------------------------------------------------------------%>
<%--------------This page shows to the guest user the 3 closest coupons to him---------------%>
<%-------------------------------------------------------------------------------------------%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Closest Coupons to the User</title>
<%------------------%>
<%--------CSS-------%>
<%------------------%>
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap/bootstrap-rtl.min.css" />
<link rel="stylesheet" href="<%=contextPath%>/css/style.css" />
</head>
<body>
	<form action="/CouponsProject/Controller/guest" method="POST">
		<button class="go-to-guest-page  btn btn-link" name="<%=IConstants.ACTION%>"
			value="<%=IConstants.FORWARD_TO_GUEST_PAGE_ACTION%>">חזור אל עמוד האורח</button>
	</form>
	<div id="favorites-coupons" class="alert alert-success" role="alert">
		<span class="glyphicon glyphicon-info-sign" aria-hidden="true">&nbsp;</span>
		<span>הקופונים הקרובים ביותר למיקומך</span>
	</div>
	<%
		Collection<Coupon> coupons = (Collection<Coupon>) request.getAttribute(IConstants.ATTR_THREE_CLOSEST_COUPONS);
	%>
	<%
		//show the closest coupons to the guest user
		if (coupons != null) {
	%>
	<%--------showCouponsList custom tag-------%>
	<customtag:showCouponsList listOfCoupons="<%=coupons%>" />
	<%
		//show an error message in case the collection is null (in case of problem)
		} else {
	%>
	<%--shows an error message in case there was a problem in getting the closest coupons--%>
	<div id="wrong-parameters-closest-coupon" class="alert alert-danger" role="alert">
		<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true">&nbsp;</span>
		<span>משתמש יקר, לא ניתן היה להחזיר את הקופון הקרוב אלייך (לא היה ניתן לחשב את מיקומך או שאין נתונים במערכת הקופונים)</span>
		<br />
		<form action="/CouponsProject/Controller/guest" method="POST">
			<button class="btn btn-link" name="<%=IConstants.ACTION%>" value="<%=IConstants.FORWARD_TO_GUEST_PAGE_ACTION%>">חזור
				אל עמוד האורח</button>
		</form>
	</div>
	<%
		}
	%>
	<%------------------%>
	<%------Scripts-----%>
	<%------------------%>
	<script src="<%=contextPath%>/js/jquery/jquery-2.1.1.min.js"></script>
</body>
</html>