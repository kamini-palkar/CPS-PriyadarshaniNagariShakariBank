<?php 
require_once 'global.php';
//authentication_print();
require_once(ROOT_CLASSES.'PHPExcel.php');
if(!isset($_REQUEST['from_date']) || empty($_REQUEST['from_date']) &&
  !isset($_REQUEST['to_date']) || empty($_REQUEST['to_date']) ) {
  $_REQUEST['from_date']=$_REQUEST['to_date']=date('d-m-Y');
}
$filter=" for the ".$_REQUEST['from_date']." to ".$_REQUEST['to_date'];
$searchString = "";              
if(isset($_REQUEST['searchterm'])&&!empty($_REQUEST['searchterm']))
{
    $searchString .= " and cps_book_size = '".$_REQUEST['searchterm']."'";
}
if(isset($_REQUEST['ddlAccountType'])&&!empty($_REQUEST['ddlAccountType']))
{  
    $searchString .= " and cps_tr_code = '".$_REQUEST['ddlAccountType']."'";    
}
if(isset($_REQUEST['ddlBranchName'])&&!empty($_REQUEST['ddlBranchName']))
{
	$searchString .= " and ABS(branch_sub_code) = '".(int)$_REQUEST['ddlBranchName']."'";
    //$sql = "(select cps_branchmicr_code,sum(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY cps_branchmicr_code,cps_tr_code,cps_book_size ORDER BY cps_branchmicr_code ASC,cps_tr_code,cps_tr_code ASC,cps_book_size ASC)";

	/*$sql = "SELECT  cps_branchmicr_code,SUM(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size 
	FROM ((select cps_branchmicr_code,SUM(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY ABS(cps_branchmicr_code),cps_tr_code,cps_book_size ORDER BY cps_branchmicr_code ASC,cps_tr_code ASC,cps_book_size ASC) UNION ALL (select cps_branchmicr_code,SUM(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size from tb_payorder_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY ABS(cps_branchmicr_code),cps_tr_code,cps_book_size ORDER BY cps_branchmicr_code ASC,cps_tr_code ASC,cps_book_size ASC)) report GROUP BY ABS(cps_branchmicr_code),cps_tr_code,cps_book_size ORDER BY ABS(cps_branchmicr_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_book_size) ASC";*/
	$sql = "select branch_sub_code,cps_branchmicr_code,SUM(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY ABS(branch_sub_code),cps_tr_code,cps_book_size ORDER BY ABS(branch_sub_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_book_size) ASC";

    if($result = $db->get_results($sql)){
			
		    // echo "SELECT branch_name from tb_branchdetails where ABS(branch_code)='".(int)$result[0]->cps_branchmicr_code."'";
			$branchDetails = $db->get_row("SELECT branch_name from tb_branchdetails where ABS(branch_sub_code)='".(int)$result[0]->branch_sub_code."'");
			if (!empty($branchDetails)&&!empty($branchDetails->branch_name)) {
			  $branch_name = $branchDetails->branch_name;
			} else {
			  $branch_name ="NA";
			}
			$savingCountTotalBook=0;
            $savingCountTotalLeaves=0;
            $currentCountTotalBook=0;
            $currentCountTotalLeaves=0;
            $castCreditCountTotalBook=0;
            $castCreditCountTotalLeaves=0;
            $ddCountTotalBook=0;
            $ddCountTotalLeaves=0;        
            $prevTrCode=$result[0]->cps_tr_code;
			
			$inputFileType = 'Excel2007';
			$wrobjPHPExcel = new PHPExcel();
			$objWriter     = PHPExcel_IOFactory::createWriter($wrobjPHPExcel, $inputFileType);	
			ob_end_clean();
			$wrsheet = $wrobjPHPExcel->getSheet(0); 
			$wrsheet->SetCellValueByColumnAndRow(0, 1, $branch_name.' - '.$result[0]->cps_branchmicr_code);
			$wrsheet->getStyle('A1')->getAlignment()->setWrapText(true);
			$wrsheet->mergeCells('A1:D1');
			//$wrsheet->getRowDimension(1)->setRowHeight(45);
			$wrsheet->SetCellValueByColumnAndRow(0, 2, '');
			$wrsheet->SetCellValueByColumnAndRow(1, 2, 'No. Of Books');
			$wrsheet->SetCellValueByColumnAndRow(2, 2, 'Book Size');
			$wrsheet->SetCellValueByColumnAndRow(3, 2, 'Total Leaves');
			$i = 3;	
            foreach($result as $row) {
                $adminDetails = $db->get_row("SELECT username from tb_printadmin where adminid='".$row->cps_process_user_id."'");
                if (!empty($adminDetails)&&!empty($adminDetails->username)) {
                    $userName = $adminDetails->username;
                } else {
                    $userName ="-";
                }
				if($prevTrCode!=$row->cps_tr_code){
					switch ($prevTrCode) {
						case '10':
							$wrsheet->SetCellValueByColumnAndRow(0, $i, "Savings A/c. No.");
							$wrsheet->SetCellValueByColumnAndRow(1, $i, $savingCountTotalBook);
							$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(3, $i, $savingCountTotalLeaves);									
							break;
						case '11':
							$wrsheet->SetCellValueByColumnAndRow(0, $i, "Current A/c. No.");
							$wrsheet->SetCellValueByColumnAndRow(1, $i, $currentCountTotalBook);
							$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(3, $i, $currentCountTotalLeaves);
							break;
						case '12':
							$wrsheet->SetCellValueByColumnAndRow(0, $i, "Pay Order No.");
							$wrsheet->SetCellValueByColumnAndRow(1, $i, $castCreditCountTotalBook);
							$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(3, $i, $castCreditCountTotalLeaves);
							break;
						case '13':
							$wrsheet->SetCellValueByColumnAndRow(0, $i, "Cash Credit No.");
							$wrsheet->SetCellValueByColumnAndRow(1, $i, $ddCountTotalBook);
							$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(3, $i, $ddCountTotalLeaves);
							break;
						default:
							$wrsheet->SetCellValueByColumnAndRow(0, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(1, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(3, $i, '');
							break;
				    }
				}
				$wrsheet->SetCellValueByColumnAndRow(0, $i, '');
				$wrsheet->SetCellValueByColumnAndRow(1, $i, $row->cps_no_of_books);
				$wrsheet->SetCellValueByColumnAndRow(2, $i, $row->cps_book_size);
				$wrsheet->SetCellValueByColumnAndRow(3, $i, ($row->cps_no_of_books*$row->cps_book_size));							  
				$prevTrCode=$row->cps_tr_code;

				switch ($prevTrCode) {
				  case '10':
						$savingCountTotalBook=$savingCountTotalBook+$row->cps_no_of_books;
						$savingCountTotalLeaves=$savingCountTotalLeaves+($row->cps_no_of_books*$row->cps_book_size);
						break;
				  case '11':
						$currentCountTotalBook=$currentCountTotalBook+$row->cps_no_of_books;
						$currentCountTotalLeaves=$currentCountTotalLeaves+($row->cps_no_of_books*$row->cps_book_size);
						break;
				  case '12':
						$castCreditCountTotalBook=$castCreditCountTotalBook+$row->cps_no_of_books;
						$castCreditCountTotalLeaves=$castCreditCountTotalLeaves+($row->cps_no_of_books*$row->cps_book_size);
						break;
				  case '13':
						$ddCountTotalBook=$ddCountTotalBook+$row->cps_no_of_books;
						$ddCountTotalLeaves=$ddCountTotalLeaves+($row->cps_no_of_books*$row->cps_book_size);
						break;                          
				  default:
					//continue;
					break;
				}
				$i++;	
            }

            switch ($prevTrCode) {
                case '10':
					$wrsheet->SetCellValueByColumnAndRow(0, $i, "Savings A/c. No.");
					$wrsheet->SetCellValueByColumnAndRow(1, $i, $savingCountTotalBook);
					$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
					$wrsheet->SetCellValueByColumnAndRow(3, $i, $savingCountTotalLeaves);									
					break;
                case '11':
					$wrsheet->SetCellValueByColumnAndRow(0, $i, "Current A/c. No.");
					$wrsheet->SetCellValueByColumnAndRow(1, $i, $currentCountTotalBook);
					$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
					$wrsheet->SetCellValueByColumnAndRow(3, $i, $currentCountTotalLeaves);
					break;
                case '12':
					$wrsheet->SetCellValueByColumnAndRow(0, $i, "Pay Order No.");
					$wrsheet->SetCellValueByColumnAndRow(1, $i, $castCreditCountTotalBook);
					$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
					$wrsheet->SetCellValueByColumnAndRow(3, $i, $castCreditCountTotalLeaves);
					break;
                case '13':
					$wrsheet->SetCellValueByColumnAndRow(0, $i, "Cash Credit No.");
					$wrsheet->SetCellValueByColumnAndRow(1, $i, $ddCountTotalBook);
					$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
					$wrsheet->SetCellValueByColumnAndRow(3, $i, $ddCountTotalLeaves);
					break;
                default:
                    //continue;
					break;
            }
                $wrsheet->SetCellValueByColumnAndRow(0, $i+1, $branch_name.' Total');
				$wrsheet->SetCellValueByColumnAndRow(1, $i+1, ($savingCountTotalBook+$currentCountTotalBook+$castCreditCountTotalBook+$ddCountTotalBook));
				$wrsheet->SetCellValueByColumnAndRow(2, $i+1, '');
				$wrsheet->SetCellValueByColumnAndRow(3, $i+1, ($savingCountTotalLeaves+$currentCountTotalLeaves+$castCreditCountTotalLeaves+$ddCountTotalLeaves));
	}else{
            //$data .= '<tr><td class="thwidthtd" colspan="12" style="font-size:35px;">No data found!</td></tr>' ;
               
			$wrsheet->getStyle('A1')->getAlignment()->setWrapText(true);
			$wrsheet->mergeCells('A1:D1');
			//$wrsheet->getRowDimension(1)->setRowHeight(45);
			$wrsheet->SetCellValueByColumnAndRow(0, 2, '');
			$wrsheet->SetCellValueByColumnAndRow(1, 2, 'No. Of Books');
			$wrsheet->SetCellValueByColumnAndRow(2, 2, 'Book Size');
			$wrsheet->SetCellValueByColumnAndRow(3, 2, 'Total Leaves');						
    }

}else{



   // $sqlbranch = "(select distinct ABS(cps_branchmicr_code) from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." ORDER BY cps_branchmicr_code ASC)";
    $sqlbranch = "select distinct ABS(branch_sub_code) as branch_sub_code from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." ORDER BY ABS(branch_sub_code) ASC";
	$data ="";
	if($resultbranch = $db->get_results($sqlbranch)){
		//print_r($resultbranch);
		$i = 1;	
		$totalBook=0;
		$totalLeaves=0;
		$inputFileType = 'Excel2007';
		$wrobjPHPExcel = new PHPExcel();
		$objWriter     = PHPExcel_IOFactory::createWriter($wrobjPHPExcel, $inputFileType);	
		ob_end_clean();
		$wrsheet = $wrobjPHPExcel->getSheet(0); 	


		$wrsheet->SetCellValueByColumnAndRow(0, $i, 'Consolidated Cheque Book Print Report '.$filter);
		$wrsheet->getStyle('A'.$i)->getAlignment()->setWrapText(true);
		$wrsheet->mergeCells('A'.$i.':D'.$i);

		$i=3;
		foreach ($resultbranch as $rowbranch) {
            $searchStringIndv = $searchString." and ABS(branch_sub_code) = '".(int)$rowbranch->branch_sub_code."'";
           /* $sql = "(select cps_branchmicr_code,sum(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchStringIndv." GROUP BY cps_branchmicr_code,cps_tr_code,cps_book_size ORDER BY cps_branchmicr_code ASC,cps_tr_code,cps_tr_code ASC,cps_book_size ASC)";*/
          /*   $sql = "SELECT  * 
		FROM ((select cps_branchmicr_code,cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY cps_branchmicr_code,cps_tr_code,cps_book_size ORDER BY cps_branchmicr_code ASC,cps_tr_code ASC,cps_book_size ASC) UNION ALL (select cps_branchmicr_code,cps_no_of_books,cps_tr_code,cps_book_size from tb_payorder_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY cps_branchmicr_code,cps_tr_code,cps_book_size ORDER BY cps_branchmicr_code ASC,cps_tr_code ASC,cps_book_size ASC)) report ORDER BY ABS(cps_branchmicr_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_book_size) ASC";*/
			$sql = "select branch_sub_code,ABS(cps_branchmicr_code) as cps_branchmicr_code,SUM(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchStringIndv." GROUP BY ABS(branch_sub_code),cps_tr_code,cps_book_size ORDER BY ABS(branch_sub_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_book_size) ASC";
            if($result = $db->get_results($sql)){
				$data .= '<table cellpadding="2" cellspacing="0" border="1" width="100%">';
				$branchDetails = $db->get_row("SELECT branch_name from tb_branchdetails where ABS(branch_sub_code)='".(int)$result[0]->branch_sub_code."'");
				if (!empty($branchDetails)&&!empty($branchDetails->branch_name)) {
				  $branch_name = $branchDetails->branch_name;
				} else {
				  $branch_name ="NA";
				}
				$wrsheet->SetCellValueByColumnAndRow(0, $i, $branch_name.' - '.$result[0]->cps_branchmicr_code);
				$wrsheet->getStyle('A'.$i)->getAlignment()->setWrapText(true);
				$wrsheet->mergeCells('A'.$i.':D'.$i);

				//heading bold
				$wrsheet->getStyle('A'.$i.':D'.$i)->getFont()->setBold(true);

				$i++;
				//$wrsheet->getRowDimension(1)->setRowHeight(45);
				$wrsheet->SetCellValueByColumnAndRow(0, $i, '');
				$wrsheet->SetCellValueByColumnAndRow(1, $i, 'No. Of Books');
				$wrsheet->SetCellValueByColumnAndRow(2, $i, 'Book Size');
				$wrsheet->SetCellValueByColumnAndRow(3, $i, 'Total Leaves');
				
				$wrsheet->getStyle('A'.$i.':D'.$i)->getFont()->setBold(true);
				$i++;
                $savingCountTotalBook=0;
                $savingCountTotalLeaves=0;
                $currentCountTotalBook=0;
                $currentCountTotalLeaves=0;        
                $castCreditCountTotalBook=0;
                $castCreditCountTotalLeaves=0;
                $ddCountTotalBook=0;
                $ddCountTotalLeaves=0;  
                $prevTrCode=$result[0]->cps_tr_code;
                foreach($result as $row) {
					$adminDetails = $db->get_row("SELECT username from tb_printadmin where adminid='".$row->cps_process_user_id."'");
					if (!empty($adminDetails)&&!empty($adminDetails->username)) {
						$userName = $adminDetails->username;
					} else {
						$userName ="-";
					}
					if($prevTrCode!=$row->cps_tr_code){
						switch ($prevTrCode) {
						case '10':
							$wrsheet->SetCellValueByColumnAndRow(0, $i, "Savings A/c. No.");
							$wrsheet->SetCellValueByColumnAndRow(1, $i, $savingCountTotalBook);
							$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(3, $i, $savingCountTotalLeaves);									
							break;
						case '11':
							$wrsheet->SetCellValueByColumnAndRow(0, $i, "Current A/c. No.");
							$wrsheet->SetCellValueByColumnAndRow(1, $i, $currentCountTotalBook);
							$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(3, $i, $currentCountTotalLeaves);
							break;
						case '12':
							$wrsheet->SetCellValueByColumnAndRow(0, $i, "Pay Order No.");
							$wrsheet->SetCellValueByColumnAndRow(1, $i, $castCreditCountTotalBook);
							$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(3, $i, $castCreditCountTotalLeaves);
							break;
						case '13':
							$wrsheet->SetCellValueByColumnAndRow(0, $i, "Cash Credit No.");
							$wrsheet->SetCellValueByColumnAndRow(1, $i, $ddCountTotalBook);
							$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(3, $i, $ddCountTotalLeaves);
							break;
						default:
							$wrsheet->SetCellValueByColumnAndRow(0, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(1, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
							$wrsheet->SetCellValueByColumnAndRow(3, $i, '');
							break;
						}
						 
					}
					$wrsheet->SetCellValueByColumnAndRow(0, $i, '');
					$wrsheet->SetCellValueByColumnAndRow(1, $i, $row->cps_no_of_books);
					$wrsheet->SetCellValueByColumnAndRow(2, $i, $row->cps_book_size);
					$wrsheet->SetCellValueByColumnAndRow(3, $i, ($row->cps_no_of_books*$row->cps_book_size));
					$prevTrCode=$row->cps_tr_code;
				    switch ($prevTrCode){
					    case '10':
							$savingCountTotalBook=$savingCountTotalBook+$row->cps_no_of_books;
							$savingCountTotalLeaves=$savingCountTotalLeaves+($row->cps_no_of_books*$row->cps_book_size);
							break;
					    case '11':
							$currentCountTotalBook=$currentCountTotalBook+$row->cps_no_of_books;
							$currentCountTotalLeaves=$currentCountTotalLeaves+($row->cps_no_of_books*$row->cps_book_size);
							break;
					    case '12':
							$castCreditCountTotalBook=$castCreditCountTotalBook+$row->cps_no_of_books;
							$castCreditCountTotalLeaves=$castCreditCountTotalLeaves+($row->cps_no_of_books*$row->cps_book_size);
							break;
					    case '13':
							$ddCountTotalBook=$ddCountTotalBook+$row->cps_no_of_books;
							$ddCountTotalLeaves=$ddCountTotalLeaves+($row->cps_no_of_books*$row->cps_book_size);
							break;
					  
					    default:
						//continue;
						break;
					}
					$i++;
                }
				switch ($prevTrCode) {
				    case '10':
						$wrsheet->SetCellValueByColumnAndRow(0, $i, "Savings A/c. No.");
						$wrsheet->SetCellValueByColumnAndRow(1, $i, $savingCountTotalBook);
						$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
						$wrsheet->SetCellValueByColumnAndRow(3, $i, $savingCountTotalLeaves);									
						break;
				    case '11':
						$wrsheet->SetCellValueByColumnAndRow(0, $i, "Current A/c. No.");
						$wrsheet->SetCellValueByColumnAndRow(1, $i, $currentCountTotalBook);
						$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
						$wrsheet->SetCellValueByColumnAndRow(3, $i, $currentCountTotalLeaves);
						break;
				    case '12':
						$wrsheet->SetCellValueByColumnAndRow(0, $i, "Pay Order No.");
						$wrsheet->SetCellValueByColumnAndRow(1, $i, $castCreditCountTotalBook);
						$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
						$wrsheet->SetCellValueByColumnAndRow(3, $i, $castCreditCountTotalLeaves);
						break;	
				    case '13':
						$wrsheet->SetCellValueByColumnAndRow(0, $i, "Cash Credit No.");
						$wrsheet->SetCellValueByColumnAndRow(1, $i, $ddCountTotalBook);
						$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
						$wrsheet->SetCellValueByColumnAndRow(3, $i, $ddCountTotalLeaves);
						break;
				    default:
					//continue;
					break;
				}

				$i++;
                		$wrsheet->SetCellValueByColumnAndRow(0, $i, $branch_name.' Total');
						$wrsheet->SetCellValueByColumnAndRow(1, $i, ($savingCountTotalBook+$currentCountTotalBook+$castCreditCountTotalBook+$ddCountTotalBook));
						$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
						$wrsheet->SetCellValueByColumnAndRow(3, $i, ($savingCountTotalLeaves+$currentCountTotalLeaves+$castCreditCountTotalLeaves+$ddCountTotalLeaves));

                $i++;
                $i++;
                $totalBook=$totalBook+($savingCountTotalBook+$currentCountTotalBook+$castCreditCountTotalBook+$ddCountTotalBook);
                $totalLeaves=$totalLeaves+($savingCountTotalLeaves+$currentCountTotalLeaves+$castCreditCountTotalLeaves+$ddCountTotalLeaves);
            }
        }
        	
        	$i++;
			$wrsheet->SetCellValueByColumnAndRow(0, $i, 'Bank Total');
			$wrsheet->SetCellValueByColumnAndRow(1, $i, $totalBook);
			$wrsheet->SetCellValueByColumnAndRow(2, $i, '');
			$wrsheet->SetCellValueByColumnAndRow(3, $i, $totalLeaves);

      }else{
			//$data .= '<tr><td class="thwidthtd" colspan="12" style="font-size:35px;">No data found!</td></tr>' ;
			$wrsheet->getStyle('A1')->getAlignment()->setWrapText(true);
			$wrsheet->mergeCells('A1:D1');
			//$wrsheet->getRowDimension(1)->setRowHeight(45);
			$wrsheet->SetCellValueByColumnAndRow(0, 2, '');
			$wrsheet->SetCellValueByColumnAndRow(1, 2, 'No. Of Books');
			$wrsheet->SetCellValueByColumnAndRow(2, 2, 'Book Size');
			$wrsheet->SetCellValueByColumnAndRow(3, 2, 'Total Leaves');				
    }
	// adjust auto column width
	foreach(range('A','D') as $columnID) {
		$wrobjPHPExcel->getActiveSheet()->getColumnDimension($columnID)
			->setAutoSize(true);			
	}
	
    /*$styleMerge = array(
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
        )
    );
    $wrsheet->getStyle("A1:D1")->applyFromArray($styleMerge);	*/
	
	$date = date("Y-m-d");
	$filename = 'ConsolidatedBookSizeReport_'.$date;
	header("Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	header("Content-Disposition: attachment; filename=\"".$filename.".xlsx\"");
	header("Cache-Control: max-age=0");
	$objWriter->save("php://output");	
  }
?>