<?php 
require_once 'global.php';
//authentication_print();
require_once(ROOT_CLASSES.'PHPExcel.php');
$searchString = "";
              
if(isset($_REQUEST['searchterm'])&&!empty($_REQUEST['searchterm'])){ 
    $searchString .= " and cps_book_size = '".$_REQUEST['searchterm']."'";  
}

if(isset($_REQUEST['ddlAccountType'])&&!empty($_REQUEST['ddlAccountType']))
{  
    $searchString .= " and cps_tr_code = '".$_REQUEST['ddlAccountType']."'";    
}

$branch_name ="";
if(isset($_REQUEST['ddlBranchName'])&&!empty($_REQUEST['ddlBranchName']))
{  
    $searchString .= " and ABS(branch_sub_code) = '".(int)$_REQUEST['ddlBranchName']."'";
    $branchDetails = $db->get_row("SELECT branch_name from tb_branchdetails where ABS(branch_sub_code)='".(int)$_REQUEST['ddlBranchName']."'");
                if (!empty($branchDetails)&&!empty($branchDetails->branch_name)) {
                  $branch_name = $branchDetails->branch_name;
                } else {
                  $branch_name ="NA";
                }
}
$title='';
if(isset($_REQUEST['type']) && !empty($_REQUEST['type']) && $_REQUEST['type'] == 'search'  && 
	 isset($_REQUEST['from_date']) && !empty($_REQUEST['from_date']) &&  
	 isset($_REQUEST['to_date']) && !empty($_REQUEST['to_date']) ) {
		 $sql = "(select id,cps_branchmicr_code,cps_account_no,cps_act_name,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,cps_date,cps_tr_code,branch_sub_code from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."' ".$searchString.") UNION ALL (select id,cps_branchmicr_code,cps_account_no,cps_act_name,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,cps_date,cps_tr_code,branch_sub_code from tb_pending_print_req where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."' ".$searchString.") ORDER BY ABS(branch_sub_code) ASC,ABS(cps_branchmicr_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_chq_no_from) ASC";
	$title .="Printed Reports for period ".$_REQUEST['from_date']." to ".$_REQUEST['to_date'];
} else {
	$sql = "(select id,cps_branchmicr_code,cps_account_no,cps_act_name,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,cps_date,cps_tr_code,branch_sub_code from tb_print_req_collection where cps_date = '".date('Y-m-d')."' ORDER BY ABS(cps_branchmicr_code) ASC,ABS(branch_sub_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_chq_no_from) ASC) UNION ALL (select id,cps_branchmicr_code,cps_account_no,cps_act_name,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,cps_date,cps_tr_code,branch_sub_code from tb_pending_print_req where cps_date = '".date('Y-m-d')."' ORDER BY ABS(cps_branchmicr_code) ASC,ABS(branch_sub_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_chq_no_from) ASC) order by branch_sub_code ASC";
}



if($result = $db->get_results($sql)){

	$totalBooks=0;
	$totalBookSize=0;
    $branchBooks=0;
    $branchBookSize=0;

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
	$wrsheet->mergeCells('A1:I1');
	$wrsheet->getRowDimension(1)->setRowHeight(45);
	$wrsheet->SetCellValueByColumnAndRow(0, 2, 'Sr. No.');
	$wrsheet->SetCellValueByColumnAndRow(1, 2, 'Acc. Type');
	$wrsheet->SetCellValueByColumnAndRow(2, 2, 'Account No.');
	$wrsheet->SetCellValueByColumnAndRow(3, 2, 'Chq From');
	$wrsheet->SetCellValueByColumnAndRow(4, 2, 'Chq To');
	$wrsheet->SetCellValueByColumnAndRow(5, 2, 'No Of Books');	
	$wrsheet->SetCellValueByColumnAndRow(6, 2, 'Book Size');	
	$wrsheet->SetCellValueByColumnAndRow(7, 2, 'Customer Name');
	$wrsheet->SetCellValueByColumnAndRow(8, 2, 'Printed Date');
	$i = 3;
	$p = 1;
	$prevBranchSubCode="";
	foreach($result as $row) 
	{


		 if(empty($prevBranchSubCode)||$prevBranchSubCode!=$row->branch_sub_code){
              
               if(!empty($prevBranchSubCode)){
                       
                            $wrsheet->SetCellValueByColumnAndRow(5, $i, "Branch Total");
							$wrsheet->SetCellValueByColumnAndRow(6, $i, $branchBooks);
							$wrsheet->SetCellValueByColumnAndRow(7, $i, $branchBookSize);
							$wrsheet->getStyle("F".$i.":H".$i)->getFont()->setBold(true);
                            $i++;
                    }   

              $prevBranchSubCode=$row->branch_sub_code;
              $branchDetails = $db->get_row("SELECT branch_name from tb_branchdetails where ABS(branch_code)='".(int)$row->cps_branchmicr_code."' AND ABS(branch_sub_code)='".(int)$row->branch_sub_code."'");
                        if (!empty($branchDetails)&&!empty($branchDetails->branch_name)) {
                          $branch_name = $branchDetails->branch_name;
                        } else {
                          $branch_name ="NA";
                        }

                   		$wrsheet->SetCellValueByColumnAndRow(0, $i, "Branch Name");
						$wrsheet->SetCellValueByColumnAndRow(1, $i, $branch_name.' - '.$row->branch_sub_code);

						$wrsheet->getStyle("A".$i.":b".$i)->getFont()->setBold(true);
                  
                   $branchBooks=0;
                  $branchBookSize=0;
  					$i++;
                }

		switch ($row->cps_tr_code) {
		case '31':
			$cps_tr_type="SAVING";
			break;
		case '29':
			$cps_tr_type="CURRENT";
			break;
		case '30':
			$cps_tr_type="CC";
			break;
		case '12':
			$cps_tr_type="PAY ORDER";
			break;
		default:
			$cps_tr_type="-";
			break;
		}		
		$wrsheet->SetCellValueByColumnAndRow(0, $i, $p);
		$wrsheet->SetCellValueByColumnAndRow(1, $i, $cps_tr_type);
		$wrsheet->SetCellValueByColumnAndRow(2, $i, $row->cps_account_no);
		$wrsheet->SetCellValueByColumnAndRow(3, $i, $row->cps_chq_no_from);
		$wrsheet->SetCellValueByColumnAndRow(4, $i, $row->cps_chq_no_to);
		$wrsheet->SetCellValueByColumnAndRow(5, $i, $row->cps_no_of_books);
		$wrsheet->SetCellValueByColumnAndRow(6, $i, $row->cps_book_size);
		$wrsheet->SetCellValueByColumnAndRow(7, $i, $row->cps_act_name);
		$wrsheet->SetCellValueByColumnAndRow(8, $i, date('d-m-Y', strtotime($row->cps_date)));

		$branchBooks=$branchBooks+$row->cps_no_of_books;
        $branchBookSize=$branchBookSize+($row->cps_no_of_books*$row->cps_book_size); 

		$totalBooks=$totalBooks+$row->cps_no_of_books;
		$totalBookSize=$totalBookSize+($row->cps_no_of_books*$row->cps_book_size); 		
		$i++;
		$p++;
	}

	$wrsheet->SetCellValueByColumnAndRow(5, $i, "Branch Total");
	$wrsheet->SetCellValueByColumnAndRow(6, $i, $branchBooks);
	$wrsheet->SetCellValueByColumnAndRow(7, $i, $branchBookSize);
	$wrsheet->getStyle("F".$i.":H".$i)->getFont()->setBold(true);
    $i++;
	
	$wrsheet->SetCellValueByColumnAndRow(5, $i+1, "Grand Total");
	$wrsheet->SetCellValueByColumnAndRow(6, $i+1, $totalBooks);
	$wrsheet->SetCellValueByColumnAndRow(7, $i+1, $totalBookSize);
	$wrsheet->getStyle("F".($i+1).":H".($i+1))->getFont()->setBold(true);

	// adjust auto column width
	foreach(range('A','I') as $columnID) {
		$wrobjPHPExcel->getActiveSheet()->getColumnDimension($columnID)
			->setAutoSize(true);			
	}
	//heading bold
	$wrsheet->getStyle("A1:I1")->getFont()->setBold(true);
	$wrsheet->getStyle("A2:I2")->getFont()->setBold(true);
    $styleMerge = array(
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
        )
    );
    $wrsheet->getStyle("A1:I1")->applyFromArray($styleMerge);	
	
	$date = date("Y-m-d");
	$filename = 'ConsolidatedReport_'.$date;
	header("Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	header("Content-Disposition: attachment; filename=\"".$filename.".xlsx\"");
	header("Cache-Control: max-age=0");
	$objWriter->save("php://output");
}
?>