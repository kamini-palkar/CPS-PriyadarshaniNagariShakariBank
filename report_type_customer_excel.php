<?php 
require_once 'global.php';
//authentication_print();
require_once(ROOT_CLASSES.'PHPExcel.php');

$title = 'Customer Report';
if(isset($_REQUEST['type']) && !empty($_REQUEST['type']) && $_REQUEST['type'] == 'search'  && 
	 isset($_REQUEST['cust']) && !empty($_REQUEST['cust']) ) {
		$sql = "SELECT tb_print_req_collection.*, tb_printadmin.`userid` FROM tb_print_req_collection LEFT OUTER JOIN tb_printadmin ON cps_process_user_id = adminid where cps_act_name LIKE '%".$_REQUEST['cust']."%' ";
		$title .= ': '.$_REQUEST['cust'];
}else{
	echo "Invalid Location!!!!!";
	die();
}

if($result = $db->get_results($sql)){

	$inputFileType = 'Excel2007';
	$wrobjPHPExcel = new PHPExcel();
	$objWriter     = PHPExcel_IOFactory::createWriter($wrobjPHPExcel, $inputFileType);	
	ob_end_clean();
	$wrsheet = $wrobjPHPExcel->getSheet(0); 
	//header
	$data .=$title."\n";
	if($branch != "")
	{
		$data .="Branch Name: ".$branch."\n";
	}
	if($trn_type != "")
	{
		$data .="Transaction Type: ".$trn_type;
	}
	$wrsheet->SetCellValueByColumnAndRow(0, 1, $data);
	$wrsheet->getStyle('A1')->getAlignment()->setWrapText(true);
	$wrsheet->mergeCells('A1:K1');
	$wrsheet->getRowDimension(1)->setRowHeight(45);

	$wrsheet->SetCellValueByColumnAndRow(0, 2, 'SR. NO.');
	$wrsheet->SetCellValueByColumnAndRow(1, 2, 'OPERATOR');
	$wrsheet->SetCellValueByColumnAndRow(2, 2, 'BRANCH NAME');
	$wrsheet->SetCellValueByColumnAndRow(3, 2, 'TRANSACTION TYPE');
	$wrsheet->SetCellValueByColumnAndRow(4, 2, 'CUSTOMER NAME');
	$wrsheet->SetCellValueByColumnAndRow(5, 2, 'ACCOUNT NO');
	$wrsheet->SetCellValueByColumnAndRow(6, 2, 'CHQ. FROM');
	$wrsheet->SetCellValueByColumnAndRow(7, 2, 'CHQ. TO');
	$wrsheet->SetCellValueByColumnAndRow(8, 2, 'BOOK SIZE');
	$wrsheet->SetCellValueByColumnAndRow(9, 2, 'NO OF BOOKS');	
	$wrsheet->SetCellValueByColumnAndRow(10, 2, 'DATE OF ISSUE');
	$i = 3;
	require_once('getAccountType.php');
	foreach($result as $row) 
	{
		$branch = $db->get_row("select branch_name from tb_branchdetails where branch_micr =".$row->cps_micr_code." AND branch_code = ".$row->cps_branchmicr_code);
		$accountType = getAccountType($row->cps_tr_code);

		$wrsheet->SetCellValueByColumnAndRow(0, $i, $i-2);
		$wrsheet->SetCellValueByColumnAndRow(1, $i, $row->userid);
		$wrsheet->SetCellValueByColumnAndRow(2, $i, $branch->branch_name);
		$wrsheet->SetCellValueByColumnAndRow(3, $i, $accountType);
		$wrsheet->SetCellValueByColumnAndRow(4, $i, $row->cps_act_name);
		$wrsheet->SetCellValueByColumnAndRow(5, $i, ' '.$row->cps_account_no);
		$wrsheet->SetCellValueByColumnAndRow(6, $i, ' '.$row->cps_chq_no_from);
		$wrsheet->SetCellValueByColumnAndRow(7, $i, ' '.$row->cps_chq_no_to);
		$wrsheet->SetCellValueByColumnAndRow(8, $i, ' '.$row->cps_book_size);
		$wrsheet->SetCellValueByColumnAndRow(9, $i, ' '.$row->cps_no_of_books);
		$wrsheet->SetCellValueByColumnAndRow(10, $i, date('d-m-Y', strtotime($row->cps_date)));
		$i++;
	}
	//$wrobjPHPExcel->getActiveSheet()->getRowDimension('1')->setRowHeight(-1);
	// adjust auto column width
	foreach(range('A','K') as $columnID) {
		$wrobjPHPExcel->getActiveSheet()->getColumnDimension($columnID)
			->setAutoSize(true);
			
	}
	//heading bold
	$wrsheet->getStyle("A1:K1")->getFont()->setBold(true);
	$wrsheet->getStyle("A2:K2")->getFont()->setBold(true);
    $styleMerge = array(
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
        )
    );
    $wrsheet->getStyle("A1:K1")->applyFromArray($styleMerge);
	$date = date("Y-m-d");
	$filename = 'CustomerReport_'.$date;
	header("Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	header("Content-Disposition: attachment; filename=\"".$filename.".xlsx\"");
	header("Cache-Control: max-age=0");
	$objWriter->save("php://output"); 

}
?>