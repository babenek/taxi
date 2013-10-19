<?php	
	$query_first = '
		SELECT 
			id,
			name,
			id_parent,				
			(	
				select count(id) 
				from advertisements 
				where (
					id_sections in (
						select id 
						from sections s3 
						where (
							id_parent in (
								select id 
								from sections s2
								where 
									id_parent = s1.id 
									and state = 1
								) 							
							or id_parent=s1.id							
							) and state = 1	
						) 
					or id_sections = s1.id
					) and state = 1
				) cnt
		FROM 
			sections s1 
		WHERE 
			id_parent=0
			and state = 1
		';
	$result_first=mysql_query($query_first) or die ('Invalid query');;
	$number_first = mysql_num_rows($result_first);
	if($number_first>0){
		while($data_first=mysql_fetch_assoc($result_first)){
			if(!empty($data_first['id'])){ 
				print(
					'<table width="100%" cellpadding="5"><tr><th bgcolor="#f0f0f0" colspan="3">'.
					'Секция # '.
					$data_first['id'].
					' ['.					
					$data_first['cnt'].
					'] <h1>"'.
					$data_first['name'].
					'"</h1>'.
					
					'</th></tr>'.
					'<tr><td valign="top" width="33%"> </td><td valign="top" width="33%"> </td><td valign="top" width="34%">'
					);
				$tmp=3;	
// SECOND
				$query_second ='
					SELECT 
						id,						
						name, 				
						id_parent,
						(select count(id) from advertisements where (id_sections in (select id from sections where id_parent=s2.id and state = 1) or id_sections=s2.id) and state=1) cnt
					FROM 
						sections s2 
					WHERE 			
						id_parent='.$data_first['id'].'
						and state = 1 
					';	
				$result_second=mysql_query($query_second) or die ('Invalid query');;
				$number_second = mysql_num_rows($result_second);
				if($number_second>0){
					while($data_second=mysql_fetch_assoc($result_second)){
						if(!empty($data_second['id'])){ 
							// проверяем какой столбец біл до єтого нарисован					
							if($tmp==1 || $tmp==2){//если был левый
								print('</td><td valign="top" width="33%" align="center">');	//тогда вставим начало ячейки							
								$tmp++;
								}
							else{
								print('</td></tr><tr><td valign="top" width="34%" align="center">');//был правый или с заголовка - вставляем строки
								$tmp=1;								
								}
	
							print(
								'<table cellpadding="0" cellspacing="0" border="0" width="100%"><tr><th bgcolor="#f0f0f0"  style="font-size:14px;"  align="left">'.
//								$data_second['id'].
								'<a href="?section='.
								$data_second['id'].
								'&parent='.
								$data_second['id_parent'].
								'">'.
								$data_second['name'].
								'</a>'.								
								'</th><th bgcolor="#f0f0f0" class="level_2" align="right">'.
								$data_second['cnt'].
								'</th></tr>'
								);										
// THIRD
							$query_third = 	'
								SELECT 
									id,				
									name, 
									id_parent,
									(select count(id) from advertisements where id_sections = s3.id and state=1) cnt
								FROM 
									sections s3 
								WHERE 
									id_parent='.$data_second['id'].'
									and state = 1 
								';
							$result_third=mysql_query($query_third) or die ('Invalid query');;
							$number_third = mysql_num_rows($result_third);
							if($number_third>0){
								while($data_third=mysql_fetch_assoc($result_third)){
									if(!empty($data_third['id'])){ 
										print(//втупую рисуем
											'<tr><td style="font-size:12px; padding-left:10px;" >'.
//											$data_third['id'].
//											' name='.
											'<a href="?section='.
											$data_third['id'].
											'&parent='.
											$data_third['id_parent'].
											'">'.
											$data_third['name'].
											'</a>'.								
											'</td><td class="level_3" align="right">'.
											$data_third['cnt'].
											'</td></tr>'
											);										
										}
									}
								}	
							print('</table> </td>');// закрыли таблицу, запечатали ячейку	
// END THIRD
							}
						}
					}	
// END SECOND	
				print('</td></tr></table>');					
				}
			}
		}	
?>	



