<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#f0f0f0">
<?php	
// перв≥й уровень Ќј„јЋќ
		$query = '
			SELECT 
				id ,
				0 ,					
				0,
				name,				
				1 level, 
				id, 
				id_parent,
				0 cnt
			FROM 
				sections s1 
			WHERE 
				id_parent=0 
				and state = 1 
			
			union all
			
			SELECT 
				id_parent,
				id,						
				0,
				name, 				
				2, 
				id, 
				id_parent,
				0
			FROM 
				sections s2 
			WHERE 
				(select sections.id_parent from sections where id=s2.id_parent and state = 1 )=0 -- определ€ем, что уровень выше - первый, то есть имеет родител€=0
				and ((id_parent='.$parent.') or (id_parent='.$section.' and '.$parent.'=0) or (id_parent in (select id_parent from sections where id = '.$parent.' and state = 1 )) )
				and state = 1 
						
			union all						
			
			SELECT 
				(select sections.id_parent from sections where sections.id=s3.id_parent),
				id_parent,
				id,				
				name, 
				3, 
				id, 
				id_parent,
				(select count(id) from advertisements where id_sections = s3.id and state = 1)
			FROM 
				sections s3 
			WHERE 
				(select sections.id_parent from sections where id=s3.id_parent and state = 1)>0 -- определ€ем, что у родител€ точно уровень 2
				and (id_parent = '.$parent.' or id_parent = '.$section.')
				and state = 1 
			order by 1,2,3
			';
		$result=mysql_query($query) or die ('Invalid query:перв≥й уровень Ќј„јЋќ');;
		$number = mysql_num_rows($result);
		if($number>0){
			while($data=mysql_fetch_assoc($result)){
				if(!empty($data['id'])){ 
					switch ($data['level']):
					case 1:// первый уровень
						print('<tr><td colspan=2 class="level_1">');
						if($section==$data['id'])
							print(																			
								'<a class="level_1" href="?section='.$data['id'].'&parent='.$data['id_parent'].'">'.
								$data['name'].
								' Х </a>'							
								);
						else
							print(																			
								'<a class="level_1" href="?section='.$data['id'].'&parent='.$data['id_parent'].'">'.
								$data['name'].
								'</a>'							
								);								
						print('</td></tr>');	
						break;
					case 2://второй уровень						
						print('<tr><td colspan=2 class="level_2">');
						if($section==$data['id'])
							print(							
								'<a class="level_2" href="">'.
								$data['name'].
								' Х </a>'														
								);						
						else
							print(													
								'<a class="level_2" href="?section='.$data['id'].'&parent='.$data['id_parent'].'">'.
								$data['name'].
								'</a>'														
								);
						print('</td></tr>');	
						break;
					case 3://третий уровень
						print('<tr><td width="80%" class="level_3">');					
						if($section==$data['id'])
							print(							
								'<a class="level_3" style="font-weight:bold;" href=""> Х '.
								$data['name'].
								'</a>'
								);
							else
							print(							
								'<a class="level_3" href="?section='.$data['id'].'&parent='.$data['id_parent'].'">'.
								$data['name'].
								'</a>'
								);							
						print('</td><td class="level_3">'.$data['cnt']);								
						print('</td></tr>');	
						break;						
					endswitch;									
					}						
				}			
			}

// перв≥й уровень  ќЌ≈÷
?>		
</table>
