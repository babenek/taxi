<?php
// обрабатываем переменные
	foreach($_REQUEST as $key => $val) {if(isset($$key)) unset($$key);}
	if (get_magic_quotes_gpc()) {
		$_GET = array_map('stripslashes', $_GET);
		$_POST = array_map('stripslashes', $_POST);
		$_COOKIE = array_map('stripslashes', $_COOKIE);
		};
	ini_set('magic_quotes_gpc','0');
	ini_set('magic_quotes_runtime','0');
	ini_set('display_errors','1');
	if (version_compare(phpversion(), '5.0.0', '>')==1) {ini_set('error_reporting', E_ALL | E_STRICT);} 
	else {ini_set('error_reporting', E_ALL);}
	// ??? for ($i=0; $i<count($_POST); $i++) {list($key,$val)=each($_POST);$$key=$val;};
	// ??? for ($i=0; $i<count($_GET); $i++) {list($key,$val)=each($_GET);$$key=$val;};
	//$_REQUEST, $_POST, $_GET, $_COOKIE, $_SERVER и т.д.
	if(isset($_REQUEST['ad'])) $ad=(int)$_REQUEST['ad']; else $ad=0;	
	if(isset($_REQUEST['parent'])) $parent=(int)$_REQUEST['parent'];else $parent=0;		
	if(isset($_REQUEST['section'])) $section=(int)$_REQUEST['section']; else $section=0;		
	if(isset($_REQUEST['page'])) $page=(int)$_REQUEST['page']; else $page=1;		
	if(isset($_REQUEST['lines'])) $lines=(int)$_REQUEST['lines']; else $lines=10;	


	
//eregi("^[A-Z0-9._%-]+@[A-Z0-9._%-]+\.[A-Z]{2,6}$", $email)
//function is_unsigned_integer($val){
//$val=str_replace(" ","",trim($val));
//return eregi("^([0-9])+$",$val);
//}
	if(isset($_COOKIE['sid'])){
		$sid=(int)$_COOKIE['sid'];				
		}
	else{
		mt_srand(time()+(double)microtime()*1000000);
		$sid= mt_rand(1,1E+11); 
		setcookie('sid',$sid);	
		}
		
	if(isset($_COOKIE['sid'])){
		$sid=(int)$_COOKIE['sid'];				
		}			
//подключение к БД						
	require('dbconf.php');//тут у нас парольчики :)
	$connect=mysql_connect(hostname,username,password) or die ('Не могу создать соединение '. mysql_error());
	mysql_select_db(database,$connect) or die ('Не могу выбрать базу данных '. mysql_error());


	if(isset($_POST['action'])){//видимо, что-то хотять передать
		switch($_POST['action']){
			case 'login':
				srand(time()+(double) microtime() * 1000000);
				$uniq_id = uniqid(rand( ));		
				setcookie('uid',uniqid(rand( )),time()+3600);				
				break;
			case 'forgotpassword':
				break;
			case 'registration':
				break;
			default:
				break;											
			};
		

		}

	if(isset($_REQUEST['content']))	{// участок, выдающий графику и прочую хрень	
		$query = 'select data from `contents` WHERE id = '.(int)$_REQUEST['content'];
		$result = mysql_query($query) or die('Query failed: ' . mysql_error());		
		if(mysql_num_rows($result)>0){
			$rec = mysql_fetch_array($result, MYSQL_ASSOC);		
			header('Content-Type: image/jpg');
			echo $rec['data'];
			mysql_free_result($result);
			}
		exit();
		}
		
	else{	
				
?>
<html>
<head>
	<title>Хлам.</title>
	<meta name="description" content="хлам">
	<meta name="keywords" content="хлам">
	<meta name="robots" content="all">
	<meta content="no-cache" http-equiv="pragma">
	<meta content="text/html; charset=windows-1251" http-equiv="content-type">
	<meta HTTP-EQUIV="REFRESH" content="15; URL=http://www.xlam.net.ua/">
	<link rel="SHORTCUT ICON" href="favicon.ico">
	<LINK rel="stylesheet" type="text/css" href="main.css">		
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
		}
	mysql_close($connect);
?>