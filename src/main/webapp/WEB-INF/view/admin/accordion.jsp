<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="/proj21_funding/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/proj21_funding/bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/proj21_funding/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<table class="table table-hover">
<thead>
  <tr>
    <th></th>
    <th></th>
    <th></th>
  </tr>
</thead>

<tbody>
    <tr data-toggle="collapse" data-target="#accordion" class="clickable">
        <td>Some Stuff</td>
        <td>Some more stuff</td>
        <td>And some more</td>
    </tr>
    <tr>
        <td colspan="3">
            <div id="accordion" class="collapse">Hidden by default</div>
        </td>
    </tr>
</tbody>
</table>
</body>
</html>