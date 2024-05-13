<?php
require_once('global.php');
require('cellpdf.php');
$page_name = "print_preview";
authentication_print();
//ini_set("max_execution_time",300000);

	$printersinfo[0][0] = "HP LaserJet Pro M402-M403 n-dne PCL 6";
			//$printersinfo[0][0] = 'HP LaserJet 1020';
			$printersinfo[0][2] = 'Tray 2'; //hardcoded test value 
			// echo $printer_tray;die;
			//$printersinfo[0][2] = $printer_tray; 
			$PrintPath="Cheque.pdf";
			//echo 'gsbatchprint\gsbatchprintc -P "'.$printersinfo[0][0].'" -F "'.$PrintPath.'" -I "'.$printersinfo[0][2].'" -N 1 2>&1';
			//$msg =  exec('gsbatchprint\gsbatchprintc -P "'.$printersinfo[0][0].'" -F "'.$PrintPath.'" -I "'.$printersinfo[0][2].'" -N 1 2>&1');	
			//echo DOC_ROOT;
			// $PrintPath= dirname(__FILE__) . "\Slip.pdf";
			//echo $msg =  exec(dirname(__FILE__).'\pdfprint_cmd\pdfprint.exe "-$" "7AC75E9E-67F6-4329-B2F8-A3D4DDB23BF0" -firstpage 1 -papersource "'.$printersinfo[0][2].'" -printer "'.$printersinfo[0][0].'" '.$PrintPath);
/*echo get_current_user(); //
echo exec('whoami');

exec('wmic COMPUTERSYSTEM Get UserName', $user);
print_r($user);*/
//echo exec("gsbatchprint\gsbatchprintc -P HP LaserJet 1020 -F C:\wamp64\www\CPS\Slip.pdf -I Tray1 -N 1 2>&1");

$printersinfo[0][0] = "NPIA705BA (HP LaserJet M403n)";
$printersinfo[0][2] = 'Tray 2';
$PrintPath="C:\Users\SCUBE\Desktop\New folder\Cheque.pdf";


echo $msg =  exec('gsbatchprint\gsbatchprintc -P "'.$printersinfo[0][0].'" -F "'.$PrintPath.'" -I "'.$printersinfo[0][2].'" -N 1 2>&1');	
			//echo DOC_ROOT;
?>