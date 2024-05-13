<?php
	require_once('global.php');
	$page_name = "confirm_print";
	authentication_print();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<script type="text/javascript" src="scripts/dropdowntabs.js"></script>
		<?php include('includes.php'); ?>

		<script type="text/javascript">
			var selected_ids_array = [];
			$(document).ready(function(){		
				$( "#dialog" ).dialog({
					autoOpen: false,
					modal: true,
					buttons: {
						Ok: function() {
							$( this ).dialog( "close" );
						}
					}
				});


				Cancel_selected = function(){
					//alert('aaa');
					if(selected_ids_array.length <= 0 ) {
						$( "#dialog" ).dialog( "open" );
						//alert('id');
						return false;
					}
					$( "#confirm-cancel" ).dialog( "open" );		
				};
				
				$(".class_chkbox").live("click", function(){
					if($(this).attr('checked')) {
						selected_ids_array.push($(this).attr("id"));					
					  } else {			 
						  removeByValue(selected_ids_array, $(this).attr("id"));
					  }
				});
				
				$( "#confirm-cancel" ).dialog({
					autoOpen: false,			
					modal: true,
					buttons: {
						Cancel: function() {
							$( this ).dialog( "close" );
							return false;
						},
						Ok: function() {
							window.location = 'post_cancel.php?do=cancel&pid='+selected_ids_array;		
						}
					}
				});
			});
	
	

			function removeByValue(arr, val) {
				for(var i=0; i<arr.length; i++) {
					if(arr[i] == val) {
						arr.splice(i, 1);
						break;
					}
				}	
			}

		</script>

	</head>
	<body>
		<?php require_once('header.php'); ?>

		<?php
		if(isset($_REQUEST['file']) && ($_REQUEST['file'] == 'text'))
		{
			if(isset($_REQUEST['bunch']) && $_REQUEST['bunch'] == 'yes')	
				$action = "confirmprintreq_post.php?file=text&bunch=yes";
			else
				$action = "confirmprintreq_post.php?file=text";
		}
		else
			$action = "confirmprintreq_post.php";
		?>
		<div id="formdiv">
			<div id="formheading">Confirm Print Request</div>
			<div id="formfields">
				<form id="frmuploadfile" name="frmuploadfile"
					enctype="multipart/form-data" action="<?php echo $action; ?>"
					method="POST">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="center" valign="top"
								style="border: 1px solid; border-color: #cccccc;">
								<table width="969" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td align="left" valign="top">
											<div style="width:1000px; overflow-x:scroll;overflow-y:hidden; margin:0px; padding:0px;">
												<table cellpadding="0" cellspacing="0" border="0" width="3000">
													<tr>
														<th width="2%" style="border-right: 1px solid #ccc;background-color: #EDEDED;"></th>
														<th class="thwidthth">Unique Request No</th>
														<th class="thwidthth">Micr Code</th>						
														<th class="thwidthth">Account No</th>
														<th class="thwidthth">Customer Name</th>
														<th class="thwidthth">Book Size</th>
														<th class="thwidthth">No Of Books</th>
														<th class="thwidthth">Cheque From</th>
														<th class="thwidthth">Cheque To</th>
														<th class="thwidthth">Tr Code</th>
														<th class="thwidthth">At Par</th>						
														<th class="thwidthth">Address 1</th>
														<th class="thwidthth">Address 2</th>
														<th class="thwidthth">Address 3</th>
														<th class="thwidthth">Address 4</th>
														<th class="thwidthth">Address 5</th>
														<th class="thwidthth">City</th>												
														<th class="thwidthth">PIN</th>						
														<th class="thwidthth">Mobile</th>
													</tr>
													<?php 
													if($result = $db->get_results("select * from tb_pending_print_req where cps_isprint = 1 and cps_unique_req not in (0)")){
													foreach($result as $row) {
													?>
													<tr>
														<td class='thwidthtd'><input type='checkbox' name='action[]' id='<?php echo $row->id; ?>' class='class_chkbox'  /></td>
														<td class='thwidthtd'><?php echo $row->cps_unique_req; ?></td>
														<td class='thwidthtd'><?php echo $row->cps_micr_code; ?></td>						
														<td class='thwidthtd'><?php echo $row->cps_account_no; ?></td>
														<td class='thwidthtd'><?php echo $row->cps_act_name; ?></td>
														<td class='thwidthtd'><?php echo $row->cps_book_size; ?></td>
														
														<td class='thwidthtd'><?php echo $row->cps_no_of_books; ?></td>
														<td class='thwidthtd'><?php echo $row->cps_chq_no_from; ?></td>
														<td class='thwidthtd'><?php echo $row->cps_chq_no_to; ?></td>
														
														<td class='thwidthtd'><?php echo $row->cps_tr_code; ?></td>
														<td class='thwidthtd'><?php if($row->cps_atpar == 0){ echo "N"; }else{ echo "";} ?></td>						
														<td class='thwidthtd'><?php echo $row->cps_act_address1; ?></td>
														<td class='thwidthtd'><?php echo $row->cps_act_address2; ?></td>
														<td class='thwidthtd'><?php echo $row->cps_act_address3; ?></td>
														<td class='thwidthtd'><?php echo $row->cps_act_address4; ?></td>
														<td class='thwidthtd'><?php echo $row->cps_act_address5; ?></td>
														<td class='thwidthtd'><?php echo $row->cps_act_city; ?></td>											
														<td class='thwidthtd'><?php echo $row->cps_act_pin; ?></td>						
														<td class='thwidthtd'><?php echo $row->cps_act_mobile; ?></td>
													</tr>
													<?php }}?>
													<tr>
														<td class="thwidthth" colspan="23" style="text-align:left; padding-left:10px; height:40px">
														<input type="submit" id="btnprint" name="btnprint" style="border: 1px solid rgb(118, 118, 118);padding: 5px 3px 5px 3px;border-radius: 5px;" value=" Print All "></input>
														<a id="cancel_selected" style="margin-right: 10px;border: 1px solid rgb(118, 118, 118);padding: 5px 3px 5px 3px;border-radius: 5px; margin-left: 20px;" class="pointer" onclick="Cancel_selected();"> Cancel Selected </a>
														<!--<input type="button" id="btnprintpreview" name="btnprintpreview" value="Print Preview" onclick="window.open('printpreview.php','_blank')"></input>-->
														</td>
													</tr>
													<tr>
														<td style="height:30px;">&nbsp;</td>
													</tr>
												</table>
											</div>

										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>


								</table>
							</td>
						</tr>

					</table>
				</form>
				<div id="confirm-cancel" title="Confirmation">
					<p style="float:left;"><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Are you sure? you want to cancel selected records.</p>
				</div>
				<div id="dialog" title="Error">
					<p style="float:left;"><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Please select rows!</p>
				</div>

			</div>
		</div>
	</div>
</div>
</div>
<?php require_once('footer.php');	?> 
</body>
</html>
