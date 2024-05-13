<?php
if(!isset($_POST['do']) || $_POST['do']!="backup") die('no direct access');
require_once('global.php');

error_reporting(1);
backup_tables($host, $user, $pass, $name);
echo '{"status":"true"}';
exit;

/* backup the db OR just a table */
function backup_tables($host,$user,$pass,$name,$tables = '*')
{
	global $db;
	/*$link = mysqli_connect($host,$user,$pass);
	mysqli_select_db($name,$link);*/
	
	//get all of the tables
	if($tables == '*')
	{
		$tables = array();
		$result = mysqli_query($db->dbh,'SHOW TABLES');
	
		while($row = mysqli_fetch_row($result))
		{
			$tables[] = $row[0];
		}
	}
	else
	{
		$tables = is_array($tables) ? $tables : explode(',',$tables);
	}
	//print_r($tables);
	//cycle through
	foreach($tables as $table)
	{
		$result = mysqli_query($db->dbh,'SELECT * FROM '.$table);
		$num_fields = mysqli_num_fields($result);
		
		$return.= 'DROP TABLE '.$table.';';
		$row2 = mysqli_fetch_row(mysqli_query($db->dbh,'SHOW CREATE TABLE '.$table));
		$return.= "\n\n".$row2[1].";\n\n";
		
		for ($i = 0; $i < $num_fields; $i++) 
		{
			while($row = mysqli_fetch_row($result))
			{
				$return.= 'INSERT INTO '.$table.' VALUES(';
				for($j=0; $j<$num_fields; $j++) 
				{
					$row[$j] = addslashes($row[$j]);
					// $row[$j] = preg_replace("\n","\\n",$row[$j]);
					if (isset($row[$j])) { $return.= '"'.$row[$j].'"' ; } else { $return.= '""'; }
					if ($j<($num_fields-1)) { $return.= ','; }
				}
				$return.= ");\n";
			}
		}
		$return.="\n\n\n";
	}
	
	//save file
	//$handle = fopen('db-backup-'.time().'-'.(md5(implode(',',$tables))).'.sql','w+');
	$handle = fopen(dirname(__FILE__).'\backup\db-backup-'.date('d-m-Y-h-i-s', time()).'.sql','w+');
	fwrite($handle,$return);
	fclose($handle);
}
?>