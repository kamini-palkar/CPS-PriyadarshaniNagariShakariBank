<?php 
require_once 'global.php';
authentication_print();
require_once(ROOT_CLASSES.'tcpdf/config/lang/eng.php');
require_once(ROOT_CLASSES.'tcpdf/tcpdf.php');
//print_r($_REQUEST);
$searchString = "";
              
if(isset($_REQUEST['searchterm'])&&!empty($_REQUEST['searchterm']))
{
 
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
if(isset($_REQUEST['type']) && !empty($_REQUEST['type']) && $_REQUEST['type'] == 'search'  && 
	 isset($_REQUEST['from_date']) && !empty($_REQUEST['from_date']) &&  
	 isset($_REQUEST['to_date']) && !empty($_REQUEST['to_date']) ) {
		 $sql = "(select id,cps_branchmicr_code,cps_account_no,cps_act_name,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,cps_date,cps_tr_code,branch_sub_code from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."' ".$searchString.") UNION ALL (select id,cps_branchmicr_code,cps_account_no,cps_act_name,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,cps_date,cps_tr_code,branch_sub_code from tb_pending_print_req where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."' ".$searchString.") ORDER BY ABS(branch_sub_code) ASC,ABS(cps_branchmicr_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_chq_no_from) ASC";
} else {
	$sql = "(select id,cps_branchmicr_code,cps_account_no,cps_act_name,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,cps_date,cps_tr_code,branch_sub_code from tb_print_req_collection where cps_date = '".date('Y-m-d')."' ORDER BY ABS(branch_sub_code) ASC,ABS(cps_branchmicr_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_chq_no_from) ASC) UNION ALL (select id,cps_branchmicr_code,cps_account_no,cps_act_name,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,cps_date,cps_tr_code,branch_sub_code from tb_pending_print_req where cps_date = '".date('Y-m-d')."' ORDER BY ABS(branch_sub_code) ASC,ABS(cps_branchmicr_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_chq_no_from) ASC) order by branch_sub_code ASC";
}

// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Check Printing');
$pdf->SetTitle('Sucessfully Printed Reports');
//$pdf->SetSubject('TCPDF Tutorial');
//$pdf->SetKeywords('TCPDF, PDF, example, test, guide');	

// set default header data
$pdf->SetHeaderData('', '', 'Sucessfully Printed Reports for period '.$_REQUEST['from_date'].' to '.$_REQUEST['to_date'], '');

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------


// add a page
$pdf->AddPage();
if(!empty($branch_name)){
$pdf->Write(0, $branch_name." :", '', 0, 'L', true, 0, false, false, 0);
}
$pdf->SetFont('helvetica', '', 8);

// -----------------------------------------------------------------------------
//echo $sql;
if($result = $db->get_results($sql)){

  $totalBooks=0;
  $totalBookSize=0;
  $branchBooks=0;
  $branchBookSize=0;

$i=1;
	

              $data .= '<table cellpadding="5" cellspacing="0" border="1" width="100%">
                            
                            <tr style="font-weight:bold; border:1px #cccccc">
                              <td width="8%" class="thwidthth" align="center">Sr.No.</td>
                              <td width="6%" class="thwidthth" align="center">Acc. Type</td>
                              <td width="12%" class="thwidthth" align="center">Account. No.</td>
                              <td width="8%" class="thwidthth" align="center">Chq From</td>
                              <td width="8%" class="thwidthth" align="center">Chq To</td>                             
                              <td width="6%" class="thwidthth" align="center">No Of Books</td>
                              <td width="6%" class="thwidthth" align="center">Book Size</td>
                              <td width="22%" class="thwidthth" align="center">Customer Name</td> 
                              <td width="10%" class="thwidthth" align="center">Printed Date</td>
                              <td width="10%" class="thwidthth" align="center">Cust. Sign</td>
                            </tr>' ;

	$prevBranchSubCode="";
  // echo "<pre>";
  // print_r($result);
  // exit;
  foreach($result as $row) {

            if(empty($prevBranchSubCode)||$prevBranchSubCode!=$row->branch_sub_code){
              
               if(!empty($prevBranchSubCode)){
                        $data .= '<tr>
                             
                              
                              <td colspan="6" class="thwidthtd" align="right" ><b>Branch Total</b></td>
                              <td class="thwidthtd" align="center"><b>'.$branchBooks.'</b></td>
                              <td class="thwidthtd" align="center"><b>'.$branchBookSize.'</b></td>
                              <td colspan="2" class="thwidthtd" align="center"></td>
                            </tr>
                            <tr>
                              <td colspan="10" style="height:5px;"> &nbsp; </td>
                            </tr>' ;
                    }   

              $prevBranchSubCode=$row->branch_sub_code;
              $branchDetails = $db->get_row("SELECT branch_name from tb_branchdetails where ABS(branch_code)='".(int)$row->cps_branchmicr_code."' AND ABS(branch_sub_code)='".(int)$row->branch_sub_code."'");
                        if (!empty($branchDetails)&&!empty($branchDetails->branch_name)) {
                          $branch_name = $branchDetails->branch_name;
                        } else {
                          $branch_name ="NA";
                        }
                    $data .= '<tr>
                              <td width="96%" colspan="10" class="thwidthtd" align="left"><b>Branch : '.$branch_name.' - '.$row->branch_sub_code.'</b></td>
                            </tr>';


                  
                   $branchBooks=0;
                  $branchBookSize=0;
  
                }
                $cps_tr_type=$row->cps_tr_code;
              // switch ($row->cps_tr_code) {
              //   case '10':
              //             $cps_tr_type="Savings A/c. No.";
              //     break;
              //   case '11':
              //             $cps_tr_type="Current A/c. No.";
              //     break;
              //   case '13':
              //             $cps_tr_type="Cash Credit No.";
              //     break;
              //   case '12':
              //             $cps_tr_type="Pay Order No.";
              //     break;
              //   default:
              //     $cps_tr_type="-";
              //     break;
              // }

							$data .= '<tr>
                             
                              <td width="8%" class="thwidthtd" align="center">'.$i.'</td>
                              <td width="6%" class="thwidthtd" align="center">'.$cps_tr_type.'</td>
							                 <td width="12%" class="thwidthtd" align="center">'.$row->cps_account_no.'</td>
                              <td width="8%" class="thwidthtd" align="center">'.$row->cps_chq_no_from.'</td>
                              <td width="8%" class="thwidthtd" align="center">'.$row->cps_chq_no_to.'</td>
                              <td width="6%" class="thwidthtd" align="center">'.$row->cps_no_of_books.'</td>
                              <td width="6%" class="thwidthtd" align="center">'.$row->cps_book_size.'</td>
                              <td width="22%" class="thwidthtd" align="center">'.$row->cps_act_name.'</td>
                              <td width="10%" class="thwidthtd" align="center">'.date('d-m-Y', strtotime($row->cps_date)).'</td>
                              <td width="10%" class="thwidthtd" align="center"></td>
                            </tr>' ;

                          $branchBooks=$branchBooks+$row->cps_no_of_books;
                          $branchBookSize=$branchBookSize+($row->cps_no_of_books*$row->cps_book_size); 

                          $totalBooks=$totalBooks+$row->cps_no_of_books;
                          $totalBookSize=$totalBookSize+($row->cps_no_of_books*$row->cps_book_size); 
                          $i++; 

	}

  $data .= '<tr>
                             
                              
                              <td colspan="6" class="thwidthtd" align="right" ><b>Branch Total</b></td>
                              <td class="thwidthtd" align="center"><b>'.$branchBooks.'</b></td>
                              <td class="thwidthtd" align="center"><b>'.$branchBookSize.'</b></td>
                              <td colspan="2" class="thwidthtd" align="center"></td>
                            </tr>
                            <tr>
                              <td colspan="10" style="height:5px;"> &nbsp; </td>
                            </tr>' ;

  $data .= '<tr>
                             
                              
                              <td colspan="6" class="thwidthtd" align="right" ><b>Grand Total</b></td>
                              <td class="thwidthtd" align="center"><b>'.$totalBooks.'</b></td>
                              <td class="thwidthtd" align="center"><b>'.$totalBookSize.'</b></td>
                              <td colspan="2" class="thwidthtd" align="center"></td>
                            </tr>' ;

	$data .= '</table>';
//	echo $data;
$pdf->writeHTML($data, true, false, false, false, '');
$pdf->Output('report-'.time().'.pdf', 'I');
}
?>