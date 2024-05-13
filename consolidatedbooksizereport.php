<?php
require_once('global.php');
$page_name = "printed_report";
authentication_print();
if(!isset($_REQUEST['from_date']) || empty($_REQUEST['from_date']) &&
	!isset($_REQUEST['to_date']) || empty($_REQUEST['to_date']) ) {
	
	/*$sql_print = "(select id,cps_unique_req, cps_branchmicr_code,cps_account_no,cps_act_name,cps_act_jointname1,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,chq_printed_date,cps_tr_code,cps_process_user_id from tb_print_req_collection) UNION ALL (select id,cps_unique_req, cps_branchmicr_code,cps_account_no,cps_act_name,cps_act_jointname1,cps_no_of_books,cps_book_size,cps_chq_no_from,cps_chq_no_to,chq_printed_date,cps_tr_code,cps_process_user_id from tb_pending_print_req)";*/
  $_REQUEST['from_date']=$_REQUEST['to_date']=date('d-m-Y');
 

}

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
    
}

 $sql_print = "select branch_sub_code,SUM(cps_no_of_books) as cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY ABS(cps_branchmicr_code),cps_tr_code,cps_book_size ORDER BY ABS(branch_sub_code) ASC,ABS(cps_tr_code) ASC,ABS(cps_book_size) ASC";

     // $sql_print = "(select cps_branchmicr_code,cps_no_of_books,cps_tr_code,cps_book_size from tb_print_req_collection where chq_printed_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'".$searchString." GROUP BY cps_branchmicr_code,cps_tr_code,cps_book_size ORDER BY cps_branchmicr_code ASC,cps_tr_code,cps_tr_code ASC,cps_book_size ASC)";



?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php include('includes.php'); ?>
<script type="text/javascript" src="scripts/dropdowntabs.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#search, #button").button();
		$('#from_date, #to_date').datepicker({changeMonth: true, changeYear: true, showButtonPanel: false, yearRange:'-70:Y', maxDate: 'D', dateFormat: 'dd-mm-yy' });	
	});

	function recuired(){
		if(document.getElementById("to_date").value == "" || document.getElementById("from_date").value == ""){
			document.getElementById("divmsg").innerHTML = 'Please select to and from date';
			return false;
		}else{
			document.getElementById("divmsg").innerHTML = '';
		}
	}
</script>
</head>
<body>
<?php require_once('header.php');	?>
      <div id="formdiv">
        <div id="formheading">Consolidated Report Monthly</div>
        <div id="formfields">
          
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                  <td>
                  <form id="frmuploadfile" name="frmuploadfile" enctype="multipart/form-data" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="get">
				  				<div style="float:left;padding-right:15px;"><label>Select Branch </label>
            <select name="ddlBranchName" id="ddlBranchName" style="width:198px;">
              <option value=""> All Branches </option>
              <?php 
                $rowgetbranch =  $db->get_results("SELECT distinct(b.branch_sub_code),b.branch_id, b.branch_name FROM tb_branchdetails b INNER JOIN tb_print_req_collection prc ON b.branch_sub_code = prc.branch_sub_code WHERE prc.cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."'");
                if($rowgetbranch){
                foreach($rowgetbranch as $eachbranch)
                {
                  if(isset($_GET['ddlBranchName']) && $_GET['ddlBranchName'] == $eachbranch->branch_sub_code)
                  {
                    ?><option value="<?php echo $eachbranch->branch_sub_code; ?>" selected="selected"><?php echo $eachbranch->branch_name; ?></option><?php
                  }
                  else
                  {
                    ?><option value="<?php echo $eachbranch->branch_sub_code; ?>"><?php echo $eachbranch->branch_name; ?></option><?php
                  } 
                } }
              ?>
            </select>
          </div>&nbsp;&nbsp;
          <div style="float:left;padding-right:15px;display: none;"><label>Account Type -</label>
                <select name="ddlAccountType" id="ddlAccountType" style="width:130px;">
                  <option value="">== ALL ==</option>
                  <option value="10">Saving Account</option>
                  <option value="11">Current Account</option>
                  <option value="12">Pay Order</option>
                  <option value="13">Cash Credit</option>
                </select>
              
              </div>
              <div style="float:left; padding-right:15px;display: none;">
                <label>Book Size -</label>
                <input id="searchterm" name="searchterm" class="formelement" type="text" value="<?php if(isset($_GET['searchterm'])){ echo $_GET['searchterm']; } ?>" style="width:40px" />                   
              </div>
              <div style="float:left; padding-right:15px;">
						<label>Select Date :</label> <input type="text" id="from_date" name="from_date" value="<?php echo $_REQUEST['from_date'];?>" />&nbsp;&nbsp;<label> To </label>&nbsp;&nbsp;
						<input type="text" id="to_date" name="to_date" value="<?php echo $_REQUEST['to_date'];?>"/> 
						<input type="submit" name="search" id="search" value="Search" onClick="return recuired();" />
                  
          </div>
                  </form>
                  </td>
              </tr>
			  <tr><td><div id="divmsg" class="red"><div></td></tr>
              <tr><td>&nbsp;</td></tr>
              <tr>
                <td align="center" valign="top"
			style="border: 1px solid; border-color: #cccccc;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="left" valign="top">
					  <?php if($result = $db->get_results($sql_print)){  ?>
                        <div style="width:1000px; overflow-x:scroll;overflow-y:hidden; margin:0px; padding:0px;" id="divshowdetails" name="divshowdetails">
                          <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                              
                             <!--  <th class="thwidthth">Branch Code</th>
                              <th class="thwidthth">Acc. No</th>
                              <th class="thwidthth">Name</th>
                              <th class="thwidthth">No Of Books</th>
                              <th class="thwidthth">Book Size</th>
                              <th class="thwidthth">Chq From</th>
                              <th class="thwidthth">Chq To</th>
                              <th class="thwidthth">Date Of Issue</th> -->
                              <td width="6%" class="thwidthth" align="center">Branch Code</td>
                              <td width="6%" class="thwidthth" align="center">Acc. Type</td>                    
                              <td width="6%" class="thwidthth" align="center">No Of Books</td>
                              <td width="6%" class="thwidthth" align="center">Book Size</td>
                              <td width="24%" class="thwidthth" align="center">Total Leaves</td>  
                            </tr>
                            
                            <?php
								foreach($result as $row) {	

                $adminDetails = $db->get_row("SELECT username from tb_printadmin where adminid='".$row->cps_process_user_id."'");
            if (!empty($adminDetails)&&!empty($adminDetails->username)) {
              $userName = $adminDetails->username;
            } else {
              $userName ="-";
            }				
							?>
                            

                            <tr>
                              <td class="thwidthtd" align="center"><?php echo $row->cps_branchmicr_code ?></td>
                              <td class="thwidthtd" align="center"><?php echo $row->cps_tr_code ?></td>
                              <td class="thwidthtd" align="center"><?php echo $row->cps_no_of_books ?></td>
                              <td class="thwidthtd" align="center"><?php echo $row->cps_book_size ?></td>
                              <td class="thwidthtd" align="center"><?php echo $row->cps_no_of_books*$row->cps_book_size ?></td>
                            </tr>

                            <?php }?>
                            <tr>
                              <td class="thwidthth" colspan="43" style="text-align:left; padding-left:10px; height:40px"></td>
                            </tr>
                            <tr>
                              <td style="height:30px;">&nbsp; </td>
                            </tr>
                            <?php //}?>
                          </table>
                          <tr>
                          <td>&nbsp;</td>
                          </tr>
                          <tr>
                          <?php if(isset($_REQUEST['from_date']) && !empty($_REQUEST['from_date']) &&
									isset($_REQUEST['to_date']) && !empty($_REQUEST['to_date']) ) {
										$url = 'consolidatedbooksizereport_pdf.php?type=search&from_date='.$_REQUEST['from_date'].'&to_date='.$_REQUEST['to_date'].'&ddlAccountType='.$_REQUEST['ddlAccountType'].'&ddlBranchName='.$_REQUEST['ddlBranchName'].'&searchterm='.$_REQUEST['searchterm'];
										$urlexcel = 'consolidatedbooksizereport_excel.php?type=search&from_date='.$_REQUEST['from_date'].'&to_date='.$_REQUEST['to_date'].'&ddlAccountType='.$_REQUEST['ddlAccountType'].'&ddlBranchName='.$_REQUEST['ddlBranchName'].'&searchterm='.$_REQUEST['searchterm'];
								} else {
										$url = 'consolidatedbooksizereport_pdf.php?type=search&from_date='.$_REQUEST['from_date'].'&to_date='.$_REQUEST['to_date'];
										$urlexcel = 'consolidatedbooksizereport_excel.php?type=search&from_date='.$_REQUEST['from_date'].'&to_date='.$_REQUEST['to_date'];
								}
										
						  
						  ?>
                          <td >&nbsp;&nbsp;&nbsp;&nbsp;
						  <a href="<?php echo $url; ?>" target="_blank"><input type="button" id="button" value="Export to PDF" /></a>&nbsp;&nbsp;
						  <a href="<?php echo $urlexcel; ?>" target="_blank"><input type="button" id="button" value="Export to Excel" /></a>						  
						  </td>
                          </tr>
                        </div>
                        <?php }else{ echo "<label>There are no sucessfully printed reports</label>";} ?>
                       </td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table>
          
        </div>
      </div>
    </div>
  </div>
</div>
<?php require_once('footer.php');	?>
</body>
</html>
<script type="text/javascript">
  $('#ddlAccountType').val("<?php if(isset($_GET['ddlAccountType'])){echo $_GET['ddlAccountType'];}?>");
  $('#ddlBranchName').val("<?php if(isset($_GET['ddlBranchName'])){echo $_GET['ddlBranchName'];}?>");
</script>
