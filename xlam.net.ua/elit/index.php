<?php
//����������� � ��						
	require('../dbconf.php');//��� � ��� ���������� :)
	$connect=mysql_connect(hostname,username,password) or die ('�� ���� ������� ���������� '. mysql_error());
	mysql_select_db(database,$connect) or die ('�� ���� ������� ���� ������ '. mysql_error());
?>
<html>
<head>
	<title>SAMARA</title>
	<meta name="description" content="����">
	<meta name="keywords" content="����">
	<meta name="robots" content="all">
	<meta content="no-cache" http-equiv="pragma">
	<meta content="text/html; charset=windows-1251" http-equiv="content-type">
	<meta HTTP-EQUIV="REFRESH" content="20; URL=./">
	<link rel="SHORTCUT ICON" href="favicon.ico">
	<LINK rel="stylesheet" type="text/css" href="../main.css">		
	</head>

<body bgcolor="white" rightmargin="3" leftmargin="0" topmargin="0"><center>	
	<table align="CENTER%" width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr><td>
			<?include('header.php');?>
			</td></tr>
		<tr><td>		
			<?include('main.php');?>
			</td></tr>
		<tr><td>
			<?include('footer.php');?>
			</td></tr>	
		</table>
	</center></body>
</html>
<?php
	mysql_close($connect);
?>