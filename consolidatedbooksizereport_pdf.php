<?php 
require_once 'global.php';
authentication_print();
require_once(ROOT_CLASSES.'tcpdf/config/lang/eng.php');
require_once(ROOT_CLASSES.'tcpdf/tcpdf.php');

if(!isset($_REQUEST['from_date']) || empty($_REQUEST['from_date']) &&
  !isset($_REQUEST['to_date']) || empty($_REQUEST['to_date']) ) {
  

  $_REQUEST['from_date']=$_REQUEST['to_date']=date('d-m-Y');
 

}

$filter=" for the ".$_REQUEST['from_date']." to ".$_REQUEST['to_date'];

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
$pdf->SetHeaderData('', '', 'Consolidated Cheque Book Print Report '.$filter, '');

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

//$pdf->Write(0, 'Sucessfully Printed Reports', '', 0, 'L', true, 0, false, false, 0);

$pdf->SetFont('helvetica', '', 8);

// -----------------------------------------------------------------------------



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
  //  $sql = "(select cps_branchmicr_code,sum(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY cps_branchmicr_code,cps_tr_code,cps_book_size ORDER BY cps_branchmicr_code ASC,cps_tr_code,cps_tr_code ASC,cps_book_size ASC)";

 /*$sql = "SELECT  cps_branchmicr_code,SUM(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size 
FROM ((select cps_branchmicr_code,SUM(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY ABS(cps_branchmicr_code),cps_tr_code,cps_book_size ORDER BY cps_branchmicr_code ASC,cps_tr_code ASC,cps_book_size ASC) UNION ALL (select cps_branchmicr_code,SUM(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size from tb_payorder_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY ABS(cps_branchmicr_code),cps_tr_code,cps_book_size ORDER BY cps_branchmicr_code ASC,cps_tr_code ASC,cps_book_size ASC)) report GROUP BY ABS(cps_branchmicr_code),cps_tr_code,cps_book_size ORDER BY ABS(cps_branchmicr_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_book_size) ASC";*/
 $sql = "select branch_sub_code,cps_branchmicr_code,SUM(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY ABS(branch_sub_code),cps_tr_code,cps_book_size ORDER BY ABS(branch_sub_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_book_size) ASC";

    if($result = $db->get_results($sql)){
    /*  print_r($result);
      exit;*/
                $data = '<table cellpadding="2" cellspacing="0" border="1" width="100%">';

               // echo "SELECT branch_name from tb_branchdetails where ABS(branch_code)='".(int)$result[0]->cps_branchmicr_code."'";

                $branchDetails = $db->get_row("SELECT branch_name from tb_branchdetails where ABS(branch_sub_code)='".(int)$result[0]->branch_sub_code."'");
                if (!empty($branchDetails)&&!empty($branchDetails->branch_name)) {
                  $branch_name = $branchDetails->branch_name;
                } else {
                  $branch_name ="NA";
                }

                $data .= '<tr><td class="thwidthtd" colspan="12" style="font-size:35px;"><b>'.$branch_name.' - '.$result[0]->cps_branchmicr_code.'</b></td></tr>' ;

                $data .='<tr style="font-weight:bold; border:1px solid black;">
                        <td width="40%" class="thwidthth" colspan="6" align="center"></td>                          
                        <td width="20%" class="thwidthth" colspan="2" align="center">No Of Books</td>
                        <td width="20%" class="thwidthth" colspan="2" align="center">Book Size</td>
                        <td width="20%" class="thwidthth" colspan="2" align="center">Total Leaves</td>  
                      </tr>' ;

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
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Savings A/c. No.</b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$savingCountTotalBook.'</b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$savingCountTotalLeaves.'</b></td>
                                        </tr>' ;
                                      break;
                            case '11':
                                       $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Current A/c. No.</b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$currentCountTotalBook.'</b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$currentCountTotalLeaves.'</b></td>
                                        </tr>' ;
                                      break;
                            case '12':
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Pay Order No.</b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$castCreditCountTotalBook.'</b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$castCreditCountTotalLeaves.'</b></td>
                                        </tr>' ;
                                      break;
                            case '13':
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Cash Credit No.</b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$ddCountTotalBook.'</b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$ddCountTotalLeaves.'</b></td>
                                        </tr>' ;
                                      break;
                            
                            default:
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b></b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b></b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b></b></td>
                                        </tr>' ;
                                      break;
                          }
                            
                           
                        }
                        $data .= '<tr>
                                        <td class="thwidthtd" align="center" colspan="6"></td>
                                        <td class="thwidthtd" align="center" colspan="2">'.$row->cps_no_of_books.'</td>
                                        <td class="thwidthtd" align="center" colspan="2">'.$row->cps_book_size.'</td>
                                        <td class="thwidthtd" align="center" colspan="2">'.($row->cps_no_of_books*$row->cps_book_size).'</td>
                                      </tr>' ;
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
                            // continue;
                            break;
                        }
                            /*if($prevTrCode==10){
                              $savingCountTotalBook=$savingCountTotalBook+$row->cps_no_of_books;
                              $savingCountTotalLeaves=$savingCountTotalLeaves+($row->cps_no_of_books*$row->cps_book_size);
                            }else{
                              $currentCountTotalBook=$currentCountTotalBook+$row->cps_no_of_books;
                              $currentCountTotalLeaves=$currentCountTotalLeaves+($row->cps_no_of_books*$row->cps_book_size);
                            }*/
                        
            }

            switch ($prevTrCode) {
              case '10':
                        $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>Savings A/c. No.</b></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$savingCountTotalBook.'</b></td>
                          <td class="thwidthtd" colspan="2"></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$savingCountTotalLeaves.'</b></td>
                          </tr>' ;
                        break;
              case '11':
                        $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>Current A/c. No.</b></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$currentCountTotalBook.'</b></td>
                          <td class="thwidthtd" colspan="2"></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$currentCountTotalLeaves.'</b></td>
                          </tr>' ;
                        break;
              case '12':
                        $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>Pay Order No.</b></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$castCreditCountTotalBook.'</b></td>
                          <td class="thwidthtd" colspan="2"></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$castCreditCountTotalLeaves.'</b></td>
                          </tr>' ;
                        break;
              case '13':
                        $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>Cash Credit No.</b></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$ddCountTotalBook.'</b></td>
                          <td class="thwidthtd" colspan="2"></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$ddCountTotalLeaves.'</b></td>
                          </tr>' ;
                        break;
              default:
                // continue;
                break;
            }

             /*if($prevTrCode==10){
                $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>Savings A/c. No.</b></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$savingCountTotalBook.'</b></td>
                          <td class="thwidthtd" colspan="2"></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$savingCountTotalLeaves.'</b></td>
                          </tr>' ;
              }else{
                $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>Current A/c. No.</b></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$currentCountTotalBook.'</b></td>
                          <td class="thwidthtd" colspan="2"></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$currentCountTotalLeaves.'</b></td>
                          </tr>' ;
              }*/
               $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>'.$branch_name.' Total</b></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.($savingCountTotalBook+$currentCountTotalBook+$castCreditCountTotalBook+$ddCountTotalBook).'</b></td>
                          <td class="thwidthtd" colspan="2"></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.($savingCountTotalLeaves+$currentCountTotalLeaves+$castCreditCountTotalLeaves+$ddCountTotalLeaves).'</b></td>
                          </tr>' ;
              $data .= '</table>';


    }else{
              $data = '<table cellpadding="2" cellspacing="0" border="1" width="100%">';

                $data .='<tr style="font-weight:bold; border:1px solid black;">
                        <td width="40%" class="thwidthth"  colspan="6" align="center"></td>                   
                        <td width="20%" class="thwidthth" align="center" colspan="2">No Of Books</td>
                        <td width="20%" class="thwidthth" align="center" colspan="2">Book Size</td>
                        <td width="20%" class="thwidthth" align="center" colspan="2">Total Leaves</td>
                      </tr>' ;


                $data .= '<tr><td class="thwidthtd" colspan="12" style="font-size:35px;">No data found!</td></tr>' ;
                $data .= '</table>';
    }

}else{

   // $sqlbranch = "(select distinct ABS(cps_branchmicr_code) from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." ORDER BY cps_branchmicr_code ASC)";
     $sqlbranch = "select distinct ABS(branch_sub_code) as branch_sub_code from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." ORDER BY ABS(branch_sub_code) ASC";

 $data ="";
if($resultbranch = $db->get_results($sqlbranch)){

  //print_r($resultbranch);
	$totalBook=0;
    $totalLeaves=0;
  foreach ($resultbranch as $rowbranch) {



            $searchStringIndv = $searchString." and ABS(branch_sub_code) = '".(int)$rowbranch->branch_sub_code."'";
           /* $sql = "(select cps_branchmicr_code,sum(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchStringIndv." GROUP BY cps_branchmicr_code,cps_tr_code,cps_book_size ORDER BY cps_branchmicr_code ASC,cps_tr_code,cps_tr_code ASC,cps_book_size ASC)";*/

          /*   $sql = "SELECT  * 
FROM ((select cps_branchmicr_code,cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY cps_branchmicr_code,cps_tr_code,cps_book_size ORDER BY cps_branchmicr_code ASC,cps_tr_code ASC,cps_book_size ASC) UNION ALL (select cps_branchmicr_code,cps_no_of_books,cps_tr_code,cps_book_size from tb_payorder_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY cps_branchmicr_code,cps_tr_code,cps_book_size ORDER BY cps_branchmicr_code ASC,cps_tr_code ASC,cps_book_size ASC)) report ORDER BY ABS(cps_branchmicr_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_book_size) ASC";*/

  $sql = "select branch_sub_code,ABS(cps_branchmicr_code) as cps_branchmicr_code,SUM(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchStringIndv." GROUP BY ABS(branch_sub_code),cps_tr_code,cps_book_size ORDER BY ABS(branch_sub_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_book_size) ASC";

           
/*  
print_r($sql);
              echo "<br>";
               echo "<br>";
                echo "<br>";*/
            if($result = $db->get_results($sql)){
           //   print_r($result);
             // exit;

                        $data .= '<table cellpadding="2" cellspacing="0" border="1" width="100%">';

                        $branchDetails = $db->get_row("SELECT branch_name from tb_branchdetails where ABS(branch_sub_code)='".(int)$result[0]->branch_sub_code."'");
                        if (!empty($branchDetails)&&!empty($branchDetails->branch_name)) {
                          $branch_name = $branchDetails->branch_name;
                        } else {
                          $branch_name ="NA";
                        }

                        $data .= '<tr><td class="thwidthtd" colspan="11" style="font-size:35px;"><b>'.$branch_name.' - '.$result[0]->cps_branchmicr_code.'</b></td></tr>' ;

                        $data .='<tr style="font-weight:bold; border:1px solid black;">
                        <td width="40%" class="thwidthth"  colspan="6" align="center"></td>                   
                        <td width="20%" class="thwidthth" align="center" colspan="2">No Of Books</td>
                        <td width="20%" class="thwidthth" align="center" colspan="2">Book Size</td>
                        <td width="20%" class="thwidthth" align="center" colspan="2">Total Leaves</td>
                      </tr>' ;

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
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Savings A/c. No.</b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$savingCountTotalBook.'</b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$savingCountTotalLeaves.'</b></td>
                                        </tr>' ;
                                      break;
                            case '11':
                                       $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Current A/c. No.</b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$currentCountTotalBook.'</b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$currentCountTotalLeaves.'</b></td>
                                        </tr>' ;
                                      break;
                            case '12':
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Pay Order No.</b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$castCreditCountTotalBook.'</b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$castCreditCountTotalLeaves.'</b></td>
                                        </tr>' ;
                                      break;
                            case '13':
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b>Cash Credit No.</b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$ddCountTotalBook.'</b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b>'.$ddCountTotalLeaves.'</b></td>
                                        </tr>' ;
                                      break;
                            
                            default:
                                      $data .= '<tr style="font-size:30px;">
                                        <td class="thwidthtd" colspan="6" align="right"><b></b></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b></b></td>
                                        <td class="thwidthtd" colspan="2"></td>
                                        <td class="thwidthtd" align="center" colspan="2"><b></b></td>
                                        </tr>' ;
                                      break;
                          }
                             
                          }
                          $data .= '<tr>
                                          <td class="thwidthtd" align="center" colspan="6"></td>
                                          <td class="thwidthtd" align="center" colspan="2">'.$row->cps_no_of_books.'</td>
                                          <td class="thwidthtd" align="center" colspan="2">'.$row->cps_book_size.'</td>
                                          <td class="thwidthtd" align="center" colspan="2">'.($row->cps_no_of_books*$row->cps_book_size).'</td>
                                        </tr>' ;
                             
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
                            // continue;
                            break;
                        }
              }
             switch ($prevTrCode) {
              case '10':
                        $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>Savings A/c. No.</b></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$savingCountTotalBook.'</b></td>
                          <td class="thwidthtd" colspan="2"></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$savingCountTotalLeaves.'</b></td>
                          </tr>' ;
                        break;
              case '11':
                        $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>Current A/c. No.</b></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$currentCountTotalBook.'</b></td>
                          <td class="thwidthtd" colspan="2"></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$currentCountTotalLeaves.'</b></td>
                          </tr>' ;
                        break;
              case '12':
                        $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>Pay Order No.</b></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$castCreditCountTotalBook.'</b></td>
                          <td class="thwidthtd" colspan="2"></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$castCreditCountTotalLeaves.'</b></td>
                          </tr>' ;
                        break;
              case '13':
                        $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>Cash Credit No.</b></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$ddCountTotalBook.'</b></td>
                          <td class="thwidthtd" colspan="2"></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.$ddCountTotalLeaves.'</b></td>
                          </tr>' ;
                        break;
              default:
                // continue;
                break;
            }
                $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="6" align="right"><b>'.$branch_name.' Total</b></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.($savingCountTotalBook+$currentCountTotalBook+$castCreditCountTotalBook+$ddCountTotalBook).'</b></td>
                          <td class="thwidthtd" colspan="2"></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.($savingCountTotalLeaves+$currentCountTotalLeaves+$castCreditCountTotalLeaves+$ddCountTotalLeaves).'</b></td>
                          </tr>' ;
              $data .= '</table>';

              $data .= '<table cellpadding="0" cellspacing="0" border="0" width="100%">';
              $data .= '<tr><td style="font-size:35px;"></td></tr>' ;
              $data .= '</table>';

              $totalBook=$totalBook+($savingCountTotalBook+$currentCountTotalBook+$castCreditCountTotalBook+$ddCountTotalBook);
              $totalLeaves=$totalLeaves+($savingCountTotalLeaves+$currentCountTotalLeaves+$castCreditCountTotalLeaves+$ddCountTotalLeaves);
          }
        }
        	$data .= '<table cellpadding="2" cellspacing="0" border="1" width="100%">';
              $data .= '<tr style="font-size:30px;">
                          <td class="thwidthtd" colspan="4" align="right"><b>Bank Total</b></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.($totalBook).'</b></td>
                          <td class="thwidthtd" colspan="2"></td>
                          <td class="thwidthtd" align="center" colspan="2"><b>'.($totalLeaves).'</b></td>
                          </tr>' ;
              $data .= '</table>';
      }else{
              $data = '<table cellpadding="2" cellspacing="0" border="1" width="100%">';

                $data .='<tr style="font-weight:bold; border:1px solid black;">
                        <td width="40%" class="thwidthth" align="center"></td>                       
                        <td width="20%" class="thwidthth" align="center" colspan="2">No Of Books</td>
                        <td width="20%" class="thwidthth" align="center" colspan="2"></td>
                        <td width="20%" class="thwidthth" align="center" colspan="2">Book Size</td>
                      </tr>' ;


                $data .= '<tr><td class="thwidthtd" colspan="12" style="font-size:35px;">No data found!</td></tr>' ;
                $data .= '</table>';
    }
  }




	//echo $data;
$pdf->writeHTML($data, true, false, false, false, '');
$pdf->Output('report-'.time().'.pdf', 'I');
//}
?>