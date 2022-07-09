    <? extend('left_panel_master.php') ?>
<? startblock('extra_head') ?>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/jquery.validate.min.js"></script>
<script type="text/javascript" language="javascript">
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
    function showdiv(key1,key2) {
        document.getElementById(key1).style.display = "none";
        document.getElementById(key2).style.display = "block";
    }
    function save_speed_dial(speed_num) {
        var accountid= "<?= $account_data['id'] ?>";
        var speed_dial="speed_dial_"+speed_num;
        var speeddial_number =document.getElementById(speed_dial).value;
        if (speeddial_number == '') {
			$('#speed_dial_'+speed_dial).addClass("borderred");
            document.getElementById('error_speed_dial_'+speed_num).innerHTML='<i class="fa fa-exclamation-triangle error_triangle"></i><span class="popup_error error  p-0">Please enter number</span>';
            document.getElementById(speed_dial).focus();
            return false;
        }else if (!/^[A-Za-z0-9]+$/.test(speeddial_number)) {
            $('#error_'+speed_dial).text( "Please enter only alpha-numeric value" );
            document.getElementById(speed_dial).focus();
            return false;
        }
        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>/user/user_speeddial_save/",
            data:{destination:speeddial_number,number:speed_num},
            success:function(response) {
                window.location.reload();
            }
        }); 
    }
    function remove_save_speed_dial(speed_num){
        var accountid= "<?= $account_data['id'] ?>";
        var speed_dial="speed_dial_"+speed_num;
        var speeddial_number =document.getElementById(speed_dial).value;
	var result = confirm("Are you sure want to delete speed dial record?");
	if(result == true) {
		$.ajax({
		    type : "POST",
		    url  : "<?= base_url() ?>/user/user_speeddial_remove/",
		    data : {destination:speeddial_number,number:speed_num },
		    success:function() {
                window.location.reload();
		    }
		});
	   }
    }
</script>
<script type="text/javascript">
  $(document).ready(function(){
      $('.page-wrap').addClass('addon_wrap');
  });
</script>
<script type="text/javascript">
  $(document).ready(function(){
      $(".breadcrumb li a").removeAttr("data-ripple",""); 
  });
</script>
<style>
    label.error {
        float: left; color: red;
        padding-left: .3em; vertical-align: top;  
        padding-left:40px;
        margin-top:20px;
        width:1500% !important;
    }
    .form-control
    {
        height:33px;
    }
</style>
<?php endblock() ?>
<? startblock('page-title') ?>
<?= $page_title ?>
<? endblock() ?>
<?php startblock('content') ?>
<div id="main-wrapper">   
    <div id="content" class="container-fluid">   
        <div class="row"> 
            <div class="col-md-12 color-three border_box"> 
                <div class="float-left m-2 lh19">
                    <nav aria-label="breadcrumb">
						<ol class="breadcrumb m-0 p-0">
						
						<?php if($account_data['type']==0 || $account_data['type']==3){ ?>
								<li class="breadcrumb-item"><a href=<?= base_url() . "user/user_myprofile/"; ?>><?php echo gettext('My Account')?></a></li>
						  <?php }else{?>	
							<li class="breadcrumb-item"><a href="#"><?php echo gettext('Configuration')?></a></li>
						<?php } ?>	
						<li class="breadcrumb-item active">
                            <a href="<?= base_url()."user/user_speeddial/"; ?>"><?php echo gettext('Speed Dial')?></a>
                        </li>
                        </ol>
                    </nav>
                </div>	
                <div class="m-2 float-right">
                        <a class="btn btn-light btn-hight" href="<?= base_url()."user/user_myprofile/"; ?>"> <i class="fa fa-fast-backward" aria-hidden="true"></i><?php echo gettext('Back');?></a>
                </div>
            </div>
            <div class="my-4 slice color-three float-left content_border col-md-12">
                <div id="floating-label" class="card pb-4">
                     <form class="row px-4" method="post" name="myform_speed" id="myform_speed" action="#" enctype="multipart/form-data">
                        <div class="col-md-12 alert-dark mb-4">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-2 col-2"><label class=""><?php echo gettext('Speed Dial')." (#".gettext("Digits").")";?></label></div>
                                        <div class="col-md-8 col-6"><label class=""><?php echo gettext('Extension');?></label></div>
                                        <div class="col-md-2 col-4 text-right"><label class=""><?php echo gettext('Action');?></label></div>
                                    </div>
                                </div>
                        </div>
                        <div class="col-md-12">
                                <?php
								$res = $this->db_model->getSelect("*", "speed_dial", array("accountid" => $account_data['id']));
								if ($res->num_rows() > 0) {
									$result = $res->result_array();
								} else {
									$result = 0;
								}
								for ($i = 0; $i <= 9; $i++) {
									?>
                                   
                                        <div class="col-md-12 float-left p-2 card" id="key<?php echo $i; ?><?php echo $i + 1; ?>" style="display:block;">
                                            <div class="col-md-2 col-2 float-left">
													<label class="col-md-2 control-label"><?php echo $i; ?></label>
                                            </div>   



                                            <div class="col-md-8 col-6 float-left">
                                                <label class="col-md-12" name="speed_dial" size="16"> 
												<?php
												if (isset($speeddial[$i]) && !empty($speeddial[$i])) {
														echo $speeddial[$i];
													}
                                                ?>
                                                </label>
                                            </div>
                                            <div class="col-md-2 col-4 float-left">
                                                <a  class="btn text-danger ml-2 float-right" onclick="remove_save_speed_dial('<?php echo $i; ?>')" title="Delete" name="click0<?php echo $i; ?>" id="click0<?php echo $i; ?>"><i class="fa fa-trash"></i></a>
												 <a  class="btn text-secondary float-right" onclick="showdiv('key<?php echo $i; ?><?php echo $i + 1; ?>','key<?php echo $i; ?><?php echo $i + 2; ?>')"  title="Edit"><i class="fa fa-pencil-square-o"></i></a>
                                             </div>
                                        </div>
                                        
                                        <div class="col-md-12 float-left p-2 card" id="key<?php echo $i; ?><?php echo $i + 2; ?>" style="display:none;"> 
											<div class="col-md-2 col-2 float-left">
													<label class="col-md-2">
														
															<?php echo $i; ?>
													</label>
                                            </div>
                                            <div class="col-md-8 col-6 float-left">
														<input class="form-control" name="speed_dial_<?php echo $i; ?>" id="speed_dial_<?php echo $i; ?>" size="16" type="text"  onkeypress="return isNumberKey(event)" value="<?php if (isset($speeddial[$i]) && !empty($speeddial[$i])) {
																echo $speeddial[$i];
																} ?>">
														<div class="tooltips error_div float-left p-0"  style="display: block;" id="error_speed_dial_<?php echo $i; ?>"></div> 												
                                            </div>
                                            <div class="col-md-2 col-4 float-left">
                                                <a onclick="remove_save_speed_dial('<?php echo $i; ?>')" class="btn text-danger float-right mx-2" title="Delete" name="click0<?php echo $i; ?>" id="click0<?php echo $i; ?>"><i class="fa fa-trash"></i></a>
												<a onclick="save_speed_dial('<?php echo $i; ?>')" class="btn text-info float-right" title="Save" name="click<?php echo $i; ?>" id="click<?php echo $i; ?>"><i class="fa fa-floppy-o"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
											<div class="col-md-2 col-2 float-left"></div>
											<div class="col-8 col-12 float-left">	
                                       			<span class="p-2" style="color:red;" id="error_speed_dial_<?php echo $i; ?>"></span>   
											</div>
											<div class="col-md-4 col-sm-12 float-left"></div>					
										</div>
<?php } ?>
                                </div>                
                            </form>
                        </div>                
                    
            </div>  
        </div>
    </div> 
</div>
<? endblock() ?>	
<? startblock('sidebar') ?>
Filter by
<? endblock() ?>
<? end_extend() ?>  
