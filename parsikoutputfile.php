<?php
require_once('global.php');
$page_name = "printed_report";
authentication_print();
if((isset($_REQUEST['from_date']) && !empty($_REQUEST['from_date']) && isset($_REQUEST['to_date']) && !empty($_REQUEST['to_date'])) || (isset($_REQUEST['ddlBranchName']) && !empty($_REQUEST['ddlBranchName']))) {
	
	$SearchString = "";
	$count = 1;
	if(isset($_REQUEST['from_date']) && !empty($_REQUEST['from_date']) && isset($_REQUEST['to_date']) && !empty($_REQUEST['to_date']))
	{
		if($count == 1){
			$SearchString .= " where cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."' ";
		}else{
			$SearchString .= " and cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."' ";			
		}
		$count++;
	}
	if(isset($_REQUEST['ddlBranchName']) && !empty($_REQUEST['ddlBranchName']))
	{
		if($count == 1){
			$SearchString .= " where cps_micr_code = '".$_REQUEST['ddlBranchName']."' ";
		}else{
			$SearchString .= " and cps_micr_code = '".$_REQUEST['ddlBranchName']."' ";
		}
		$count++;
	}
 	$sql_print = "select * from tb_print_req_collection  ".$SearchString."";
} else {
	$sql_print = "";
}


if(isset($_GET['ddlTranType']) && !empty($_GET['ddlTranType']))
{
	$sql_print .= " && cps_tr_code = ".$_GET['ddlTranType'];
}
if(isset($_GET['ddlBookSize']) && !empty($_GET['ddlBookSize']))
{
	$sql_print .= " && cps_book_size = ".$_GET['ddlBookSize'];
}

$today = date("d-m-Y");
$pre_month = date('d-m-Y', strtotime('last month'));
if(isset($_GET['from_date']) && !empty($_GET['from_date']))
{
	$pre_month = $_GET['from_date'];
}
if(isset($_GET['to_date']) && !empty($_GET['to_date']))
{
	$today = $_GET['to_date'];
}
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
	if((document.getElementById("to_date").value == "" || document.getElementById("from_date").value == "") && (document.getElementById("ddlBranchName").value != "")){
		document.getElementById("divmsg").innerHTML = 'Please select date criteria';
		return false;
	}else if(document.getElementById("to_date").value == "" && document.getElementById("from_date").value == "" && (document.getElementById("ddlBranchName").value == "")){
		document.getElementById("divmsg").innerHTML = 'Please select search criteria';
		return false;
	}
	else if((document.getElementById("to_date").value == "" || document.getElementById("from_date").value == "") && (document.getElementById("ddlBranchName").value == "")){
		document.getElementById("divmsg").innerHTML = 'Please select date criteria';
		return false;
	}
	else{
		document.getElementById("divmsg").innerHTML = '';
	}
}
</script>
</head>
<body>
<?php require_once('header.php');	?>
      <div id="formdiv">
        <div id="formheading">Output File</div>
        <div id="formfields">
          
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                  <td style="width:80%">
                  <form id="frmuploadfile" name="frmuploadfile" enctype="multipart/form-data" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="get">
                  <div style="float:left;clear: borh;height: 40px;"><label>Select Branch </label>
							<select name="ddlBranchName" id="ddlBranchName" style="width:198px; height:26px;">
								<option value=""> Select Branch </option>
								<?php 
									$rowgetbranch =  $db->get_results("SELECT distinct(b.branch_code),b.branch_id, b.branch_name,b.branch_micr FROM tb_branchdetails b INNER JOIN tb_print_req_collection prc ON b.branch_micr = prc.cps_micr_code AND b.branch_sub_code= prc.branch_sub_code");
									if($rowgetbranch){
									foreach($rowgetbranch as $eachbranch)
									{
										if(isset($_GET['ddlBranchName']) && $_GET['ddlBranchName'] == $eachbranch->branch_id)
										{
											?><option value="<?php echo $eachbranch->branch_id; ?>" selected="selected"><?php echo $eachbranch->branch_name; ?></option><?php
										}
										else
										{
											?><option value="<?php echo $eachbranch->branch_id; ?>"><?php echo $eachbranch->branch_name; ?></option><?php
										} 
									} 
								}
								?>
							</select>
						</div>
						<div style="float:left;height: 40px;"><label>Transaction Type </label>
							<select name="ddlTranType" id="ddlTranType" style="width:198px; height:26px;">
								<option value=""> Select Transaction </option>
								<?php
									$sql = "SELECT distinct(transactioncode),b.transactioncode, b.transactioncodedescription FROM tb_cps_transactioncodes b INNER JOIN tb_print_req_collection prc ON b.transactioncode = prc.cps_tr_code where 1=1";
									if(isset($_REQUEST['from_date']) && !empty($_REQUEST['from_date']) && isset($_REQUEST['to_date']) && !empty($_REQUEST['to_date']))
									{
										$sql .= " and cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."' ";			
									} 
									$rowgetbranch =  $db->get_results($sql);
									if($rowgetbranch){
									foreach($rowgetbranch as $eachbranch)
									{
										if(isset($_GET['ddlTranType']) && $_GET['ddlTranType'] == $eachbranch->transactioncode)
										{
											?><option value="<?php echo $eachbranch->transactioncode; ?>" selected="selected"><?php echo $eachbranch->transactioncodedescription; ?></option><?php
										}
										else
										{
											?><option value="<?php echo $eachbranch->transactioncode; ?>"><?php echo $eachbranch->transactioncodedescription; ?></option><?php
										} 
									}
									} 
								?>
							</select>
						</div>
						<div style="float:left;height: 40px;">&nbsp;&nbsp;<label>Book Size </label>
							<select name="ddlBookSize" id="ddlBookSize" style="width:198px; height:26px;">
								<option value=""> Select Book Size </option>
								<?php 
									$sql = "SELECT distinct(prc.cps_book_size) as cps_book_size from tb_print_req_collection prc where 1=1";
									if(isset($_REQUEST['from_date']) && !empty($_REQUEST['from_date']) && isset($_REQUEST['to_date']) && !empty($_REQUEST['to_date']))
									{
										$sql .= " and cps_date between '".date('Y-m-d',strtotime($_REQUEST['from_date']))."' and '".date('Y-m-d', strtotime($_REQUEST['to_date']))."' ";			
									} 
									$rowgetbranch =  $db->get_results($sql);
									if($rowgetbranch){
									foreach($rowgetbranch as $eachbranch)
									{
										if(isset($_GET['ddlBookSize']) && $_GET['ddlBookSize'] == $eachbranch->cps_book_size)
										{
											?><option value="<?php echo $eachbranch->cps_book_size; ?>" selected="selected"><?php echo $eachbranch->cps_book_size; ?></option><?php
										}
										else
										{
											?><option value="<?php echo $eachbranch->cps_book_size; ?>"><?php echo $eachbranch->cps_book_size; ?></option><?php
										} 
									} 
									}
								?>
							</select>
						</div>
                  		<div style="float: left;height: 40px;">
							<label>From </label> 
							<input type="text" id="from_date" name="from_date" value="<?php echo $pre_month;?>"/>&nbsp;&nbsp;
							<label> To </label>
							<input type="text" id="to_date" name="to_date" value="<?php echo $today;?>"/> 
						</div>
						<div style="float: left;height: 40px;margin-left: 10px;">
                        	<input type="submit" name="search" id="search" value="Search" onClick="return recuired();" />
                        </div>
                        <div style="float:left;padding-left: 5px;">
							<a href="parsikoutputfile.php"><img src="images/refresh.png" alt="Refresh"></a>
						</div>
                  </form>
                  </td>
              </tr>
			  <tr><td><div id="divmsg" class="red"><div></td></tr>
              <tr><td>&nbsp;</td></tr>
              <tr>
				 <?php if($sql_print != ""){  ?>
                <td align="center" valign="top"
			style="border: 1px solid; border-color: #cccccc;"><table width="969" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="left" valign="top">
					 
					  <?php if($result = $db->get_results($sql_print)){  ?>
                        <div style="width:1000px; overflow-x:scroll;overflow-y:hidden; margin:0px; padding:0px;" id="divshowdetails" name="divshowdetails">
                          <table cellpadding="0" cellspacing="0" border="0" width="1500">
                            <tr>
                              <th class="thwidthth">Unique Req</th>                             
                              <th class="thwidthth">Acc. No</th>
                              <th class="thwidthth">Name</th>       
                              <th class="thwidthth">Transaction Type</th>                        
                              <th class="thwidthth">No Of Books</th>
                              <th class="thwidthth">Book Size</th>
                              <th class="thwidthth">Chq From</th>
                              <th class="thwidthth">Chq To</th>
                              <th class="thwidthth">Date Of Issue</th>
                            </tr>
                            <?php
								foreach($result as $row) {					
							?>
                            <tr>
                              <td class='thwidthtd'><?php echo $row->cps_unique_req; ?></td>                             
                              <td class='thwidthtd'><?php echo $row->cps_account_no; ?></td>
                              <td class='thwidthtd'><?php echo $row->cps_act_name; ?></td>       
                              <?php 
                              		$tran_type =  $db->get_results("select transactioncodedescription from tb_cps_transactioncodes where transactioncode = ".$row->cps_tr_code);
                              ?>
                              <?php foreach($tran_type as $tran_type_row) {?>
                              	<td class='thwidthtd'><?php echo $tran_type_row->transactioncodedescription; ?></td>
                              <?php }?>                      
                              <td class='thwidthtd'><?php echo $row->cps_no_of_books; ?></td>
                              <td class='thwidthtd'><?php echo $row->cps_book_size; ?></td>
                              <td class='thwidthtd'><?php echo $row->cps_chq_no_from; ?></td>
                              <td class='thwidthtd'><?php echo $row->cps_chq_no_to; ?></td>
                              <td class='thwidthtd'><?php echo date('d-m-Y', strtotime($row->cps_date)); ?></td>
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
                          <?php if((isset($_REQUEST['from_date']) && !empty($_REQUEST['from_date']) && isset($_REQUEST['to_date']) && !empty($_REQUEST['to_date'])) ||  isset($_REQUEST['ddlBranchName']) && !empty($_REQUEST['ddlBranchName'])) {
									$url = 'post_parsikoutputfile.php?frm='.$_REQUEST['from_date'].'&to='.$_REQUEST['to_date'].'&ddlBranchName='.$_REQUEST['ddlBranchName'];
								} 
								if(isset($_GET['ddlTranType']) && !empty($_GET['ddlTranType']))
								{
									$url .= "&cps_tr_code=".$_GET['ddlTranType'];
								}
								if(isset($_GET['ddlBookSize']) && !empty($_GET['ddlBookSize']))
								{
									$url .= "&cps_book_size=".$_GET['ddlBookSize'];
								}	
						  ?>
                          <td >&nbsp;&nbsp;&nbsp;&nbsp;<a href="<?php echo $url; ?>" ><input type="button" id="button" value="Get Output File" /></a></td>
                          </tr>
                        </div>
                        <?php }else{ echo "<label>There are no sucessfully printed reports</label>";} ?>
                       </td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
				   <?php } else { echo "<td>&nbsp;</td>" ;} ?>
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
