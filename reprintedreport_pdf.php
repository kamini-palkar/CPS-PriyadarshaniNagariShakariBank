<?php 
require_once 'global.php';
authentication_print();
require_once(ROOT_CLASSES.'tcpdf/config/lang/eng.php');
require_once(ROOT_CLASSES.'tcpdf/tcpdf.php');
$title = "";
	
	$condation = ' 1=1 ';
	if(isset($_REQUEST['branchid']) && !empty($_REQUEST['branchid'])){
		$condation .= ' AND prc.cps_micr_code = "'.$_REQUEST['branchid'].'"';
	}
	if(isset($_GET['cps_atpar']) && !empty($_GET['cps_atpar'])){
		$condation .= ' AND prc.cps_tr_code = "'.$_GET['cps_atpar'].'"';
	}
	if(isset($_GET['cps_book_size']) && !empty($_GET['cps_book_size'])){
		$condation .= ' AND prc.cps_book_size = "'.$_GET['cps_book_size'].'"';
	}
	if(isset($_GET['frm']) && !empty($_GET['frm']) && isset($_GET['to']) && !empty($_GET['to'])){
		$condation .= ' AND (prc.cps_date between "'.date('Y-m-d',strtotime($_REQUEST['frm'])).'" and "'.date('Y-m-d', strtotime($_REQUEST['to'])).'")';
	}
	
	$condation .= ' AND prc.cps_is_reprint=0';
	
	$sql = "select prc.*,p.userid from tb_reprint_req_collection prc inner join tb_printadmin p on prc.cps_process_user_id = p.adminid where ".$condation."";
	$title = 'Sucessfully Printed Reports for the period : '.date('Y-m-d',strtotime($_REQUEST['frm'])).' To '.date('Y-m-d',strtotime($_REQUEST['to']));

//print_r($_REQUEST);
/*if(isset($_REQUEST['type']) && !empty($_REQUEST['type']) && $_REQUEST['type'] == 'search'  && 
	 isset($_REQUEST['frm']) && !empty($_REQUEST['frm']) &&  
	 isset($_REQUEST['to']) && !empty($_REQUEST['to']) ) {*/
		//$sql = "select * from tb_reprint_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['frm']))."' and '".date('Y-m-d', strtotime($_REQUEST['to']))."'";
		/*$sql = "SELECT tb_reprint_req_collection.*, tb_printadmin.`userid` FROM tb_reprint_req_collection LEFT OUTER JOIN tb_printadmin ON cps_process_user_id = adminid where cps_date between '".date('Y-m-d',strtotime($_REQUEST['frm']))."' and '".date('Y-m-d', strtotime($_REQUEST['to']))."'";
} else {*/
	//$sql = "select * from tb_reprint_req_collection";
	/*$sql = "SELECT tb_reprint_req_collection.*, tb_printadmin.`userid` FROM tb_reprint_req_collection LEFT OUTER JOIN tb_printadmin ON cps_process_user_id = adminid";
}*/

// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Check Printing');
$pdf->SetTitle('Reprint Reports');


// set default header data
$pdf->SetHeaderData('', '', 'Sucessfully Reprinted Report', '');

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, 2, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

$branch = "";
if(isset($_GET['branchid']) && !empty($_GET['branchid']))
{
	$sql1 = "select branch_name from  tb_branchdetails where branch_micr = ".$_GET['branchid'];
	$result1 = $db->get_row($sql1);

	$branch = $result1->branch_name;
}

$trn_type = "";
if(isset($_GET['cps_atpar']) && !empty($_GET['cps_atpar']))
{
	$sql2 = "select transactioncodedescription from tb_cps_transactioncodes where transactioncode = ".$_GET['cps_atpar'];
	$result2 = $db->get_row($sql2);

	$trn_type = $result2->transactioncodedescription;
}

$cps_book_size = "";
if(isset($_GET['cps_book_size']) && !empty($_GET['cps_book_size']))
{
		$cps_book_size = $_GET['cps_book_size'];
}
// add a page
$pdf->AddPage();

//$pdf->Write(0, 'Sucessfully Printed Reports', '', 0, 'L', true, 0, false, false, 0);

$pdf->SetFont('helvetica', '', 10);

// -----------------------------------------------------------------------------
$data = "";
if($result = $db->get_results($sql)){
$data .='<div style="border-bottom-color: #4487A9;border-bottom-style: solid;height: 87px;margin-bottom: 0;margin-left: 0;margin-right: 0;margin-top: 0;padding-bottom: 0;padding-left: 0;padding-right: 0;padding-top: 0;width: 100%;"><div id="titlediv" style="font-size: 60px;text-align:left;"><b>Sucessfully Reprinted Reports.</b><div style="font-size: 40px; float: left;">';
	if($branch != "")
	{
		$data .='&nbsp;&nbsp;&nbsp;<label><b>Branch Name :</b> '.$branch.'</label>';
	}
	if($trn_type != "")
	{
		$data .='&nbsp;&nbsp;&nbsp;<label><b>Transaction Type :</b> '.$trn_type.'</label>';
	}
	if($cps_book_size != "")
	{
		$data .='&nbsp;&nbsp;&nbsp;<label><b>Book size :</b> '.$cps_book_size.'</label>';
	}
	$data .='</div></div></div>';	
						$data .= '<table cellpadding="3" cellspacing="0" border="1" width="93%">
                            <tr style="font-weight:bold; border:1px #cccccc">
								<td width="7%" height="40px" align="center">Operator</td>								
								<td width="7%" height="40px" align="center">Unique Req</td>								
								<td width="16%" class="thwidthth" align="center">Acc. No</td>
								<td width="6%" class="thwidthth" align="center">Branch Code</td>
								<td width="18%" class="thwidthth" align="center">Name</td>								
								<td width="10%" class="thwidthth" align="center">Chq From</td>
								<td width="10%" class="thwidthth" align="center">Chq To</td>								
								<td width="6%" class="thwidthth" align="center">No Of Books</td>
								<td width="4%" class="thwidthth" align="center">Book Size</td>								
								<td width="8%" class="thwidthth" align="center">Date Of Issue</td>
								<td width="8%" class="thwidthth" align="center">Charges</td>
								<td width="6%" class="thwidthth" align="center">Sign</td>
                            </tr>' ;
	foreach($result as $row) {

							$data .= '<tr>
								<td class="thwidthtd" align="center">'.$row->userid.'</td>
								<td class="thwidthtd" height="30px" align="center">'.$row->cps_unique_req.'</td>
								<td style="padding-top:5px;" align="center">'.$row->cps_account_no.'</td>
								<td class="thwidthtd" align="center">'.$row->cps_micr_code.'</td>
								<td class="thwidthtd" align="center">'.$row->cps_act_name.'</td>								
								<td class="thwidthtd" align="center">'.$row->cps_chq_no_from.'</td>
								<td class="thwidthtd" align="center">'.$row->cps_chq_no_to.'</td>
								<td class="thwidthtd" align="center">'.$row->cps_no_of_books.'</td>
								<td class="thwidthtd" align="center">'.$row->cps_book_size.'</td>
								<td class="thwidthtd" align="center">'.date('d-m-Y', strtotime($row->cps_date)).'</td>								
								<td class="thwidthtd" align="center"></td>
								<td class="thwidthtd" align="center"></td>								
                            </tr>' ;

	}
	$data .= '</table>';
	//echo $data;
$pdf->writeHTML($data, true, false, false, false, '');
$pdf->Output('report-'.time().'.pdf', 'I');
}
?>