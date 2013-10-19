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
	require('../../dbconf.php');//тут у нас парольчики :)
	$connect=mysql_connect(hostname,username,password) or die ('Не могу создать соединение '. mysql_error());
	mysql_select_db(database,$connect) or die ('Не могу выбрать базу данных '. mysql_error());


	if(isset($_POST['locations'])){//видимо, что-то хотять передать		
		mysql_query('delete from elit;') or die('Query failed: ' . mysql_error());		
		$locations = split(';',$_POST['locations']); 
		foreach($locations as $each){
			if (strlen($each)>10){
				$query='insert into elit(name,id_location,bg,cl) values'.substr($each,0,32).";";	
				mysql_query($query) or die('Query failed: ' . mysql_error());		
				}
			}
		$query='insert into elit(name,id_location,bg,cl) values(\''.date('d.m.y').'\',99,\'FFFFFF\',\'808080\');';	
		mysql_query($query) or die('Query failed: ' . mysql_error());		
		
		$query='insert into elit(name,id_location,bg,cl) values(\''.date('H:i:s').'\',99,\'FFFFFF\',\'808080\');';	
		mysql_query($query) or die('Query failed: ' . mysql_error());		      		

		}

?>
<html><p>test ok</p></html>
