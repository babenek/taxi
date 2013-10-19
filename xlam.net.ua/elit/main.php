<?php
	$query = '
		SELECT 
			id,
			name,
			id_location,				
			cl,
			bg
		FROM 
			elit
		';
	$result=mysql_query($query) or die ('Invalid query');;
	$number = mysql_num_rows($result);

	$data=array();
	for ($n=0;$n<$number;$n++){
		$data[$n]=mysql_fetch_assoc($result);
		}


?>
<table  width="100%" >

    <tr>
        <td width="33%" colspan=3>
        	<table>
        		<tr><td class='title'>Двадцатый</td></tr>
        		<tr><td class='label'>
				<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==5) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>			
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
        <td width="33%" colspan=3><table>
        		<tr><td class='title'>Украина</td></tr>
	        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==4) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
        <td width="33%" colspan=3><table><tr><td class='title'>Восточный</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==7) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
    </tr>

    <tr>
        <td colspan=3><table><tr><td class='title'>Тысяча</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==10) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
        <td colspan=3><table><tr><td class='title'>Левченко</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==3) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
        <td colspan=3><table><tr><td class='title'>Ленинградский</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==8) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
    </tr>
    <tr>
        <td colspan=3><table><tr><td class='title'>Коралл</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==16) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
        <td colspan=3><table><tr><td class='title'>Нептун</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==15) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
        <td colspan=3><table><tr><td class='title'>Площадь</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==9) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
    </tr>
    <tr>
        <td colspan=3><table><tr><td class='title'>Порт</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==6) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
        <td colspan=3><table><tr><td class='title'>Кирова</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==1) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
        <td colspan=3><table><tr><td class='title'>Где-то там...</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==0) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
    </tr>
    <tr>
        <td colspan=3><table><tr><td class='title'>Черемушки</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==11) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
        <td colspan=3><table><tr><td class='title'>Центр</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==2) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <?php //<td> </td> ?>
        <td colspan=2><table><tr><td class='title'>Город грузовой</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==14) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
        <?php //<td> </td> ?>
        <td colspan=1><table><tr><td class='title'>Левый берег грузовой</td></tr>
        	<tr><td class='label'>
	        		<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==13) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp;</a> ');} ?>
        			</td></tr>
			</table></td>
    </tr>
    <tr>
        <td colspan=9><table><tr><td class='title'>время обновления</td></tr>
        	<tr><td class='label'>
        			<?php for($n=0;$n<$number;$n++){if($data[$n]['id_location']==99) 
					print ('&nbsp;<a href="." style=\'color:#'.$data[$n]['cl'].'; background:#'.$data[$n]['bg'].'\'>&nbsp;'.$data[$n]['name'].'&nbsp</a> ');} ?>
        			</td></tr>
			</table></td>
    </tr>


</table>
<?php
?>