<?php
	if(isset($tabs)) $tabs=(int)$tabs;// ���������������� ����� ������ok ����� � ������
	else $tabs=3;				
	if(isset($lines)) $lines=(int)$lines;// ���-�� ����� �� ��������
	else $lines=10;				
	if(isset($page)) $page=(int)$page;// ����� ��������, ������������ ������
	else $page=1;
	
						

	$result=mysql_query($query) or die ('pages.php:Invalid query');//����� ���������� ������� 
	$number = mysql_num_rows($result);//���������� ������� � �������				
	$total=ceil($number/$lines);//���������� ������� (�����)				
	$start=($page-1)*$lines;//������, � ������� ���������� ��������� � ����
	
	if($page-1 >= 1 && $page-1<=$total) $previous=$page-1;//��������� ��������, ���������������
	else $previous=1;
		
	if($page+1 >= 1 && $page+1<=$total) $next=$page+1;//�������� �������� �����.....
	else $next=$total;	
			
	$items_left=array();
	$items_right=array();		
	
	
	if ($total <= $tabs*2+1){//���� ������� ������, ��� ���������� �������� �����-������+�������
		$left=1;
		$right=$total;
		}
	else{ //����� ������� ������, ��...
		if($page<=$tabs){ // ����� �������� ����� ������
			$left=1;
			$right=$page+$tabs+($tabs-$page+1);//������ ������� ������ ���������� ����������� �����
			}
		elseif($total-$page<$tabs){// ��� �� ������ �������� ��������
			$left=$page-$tabs-($tabs-($total-$page));//������� �����
			$right=$total;
			}
		else{// ������� - ���-�� �����������
			$left=$page-$tabs;
			$right=$page+$tabs;
			}
		}
		
	for($n=$left;$n<$page;$n++) $items_left[]=$n;//������ �������� ����� �� ������� ��������
	for($n=$page+1;$n<=$right;$n++) $items_right[]=$n;//�������� ������ �� �������

	$limit=' LIMIT '.$start.' , '.$lines.' ';	
?>