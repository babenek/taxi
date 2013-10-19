<?php
	if(isset($tabs)) $tabs=(int)$tabs;// предопределенный лимит закладok влево и вправо
	else $tabs=3;				
	if(isset($lines)) $lines=(int)$lines;// кол-во строк на странице
	else $lines=10;				
	if(isset($page)) $page=(int)$page;// номер страницы, отображаемой сейчас
	else $page=1;
	
						

	$result=mysql_query($query) or die ('pages.php:Invalid query');//общее количество записей 
	$number = mysql_num_rows($result);//количество записей в выборке				
	$total=ceil($number/$lines);//количество страниц (всего)				
	$start=($page-1)*$lines;//запись, с которой начинается обращение к базе
	
	if($page-1 >= 1 && $page-1<=$total) $previous=$page-1;//вычисляем закладку, пердшедствующую
	else $previous=1;
		
	if($page+1 >= 1 && $page+1<=$total) $next=$page+1;//следущая закладка будет.....
	else $next=$total;	
			
	$items_left=array();
	$items_right=array();		
	
	
	if ($total <= $tabs*2+1){//если страниц меньше, чем определено закладок влево-вправо+текущая
		$left=1;
		$right=$total;
		}
	else{ //всего страниц больше, но...
		if($page<=$tabs){ // слева закладок будет меньше
			$left=1;
			$right=$page+$tabs+($tabs-$page+1);//значит добавим справа количество недостающих слева
			}
		elseif($total-$page<$tabs){// или же справа закладок нехватат
			$left=$page-$tabs-($tabs-($total-$page));//добавим слева
			$right=$total;
			}
		else{// наконец - где-то посерединке
			$left=$page-$tabs;
			$right=$page+$tabs;
			}
		}
		
	for($n=$left;$n<$page;$n++) $items_left[]=$n;//массив закладок слева от текущей страницы
	for($n=$page+1;$n<=$right;$n++) $items_right[]=$n;//закладки справа от текущей

	$limit=' LIMIT '.$start.' , '.$lines.' ';	
?>