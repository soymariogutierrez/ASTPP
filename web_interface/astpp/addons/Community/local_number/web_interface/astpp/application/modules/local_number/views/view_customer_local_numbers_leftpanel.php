<? extend('left_panel_master.php') ?>
<? startblock('extra_head') ?>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/validate.js"></script>
<script type="text/javascript" language="javascript">
    
    $(document).ready(function() {
        build_grid("dids_list","<?php echo base_url()."local_number/customer_local_number_forwarding_json/$edit_id"; ?>",<? echo $grid_fields; ?>,"");

        $("#country_id" ).change(function() {
            var country_id = $('#country_id').val();
            var url        = '<?php echo base_url()."local_number/local_number_province/"; ?>';
            var accountid  = '<?php echo $edit_id; ?>';

            $.ajax({
                type : "POST",
                url  : url,
                data : { country_id : country_id, accountid : accountid },
                success:function(response) {

                    $("#province_id").html(response);  
                    $('.selectpicker').selectpicker('refresh');      
                    $(".country_id").removeClass("col-md-5");  
                    $(".country_id").addClass("col-md-3"); 
                    $(".province_id").removeClass("col-md-5");  
                    $(".province_id").addClass("col-md-3");
                    // Kinjal issue no 1635 
                    $(".city_id").replaceWith('<select class="col-md-12 form-control form-control-lg  selectpicker city_id" data-live-search="true" id="city_id" name="city_name"><option>--Select--</option></select>');
                    $(".local_number_id").replaceWith('<select class="col-md-12 form-control form-control-lg  selectpicker local_number_id" data-live-search="true" id="local_number_id" name="local_number_id"><option>--Select--</option></select>');
                    $('.selectpicker').selectpicker('refresh'); 
                    // END
                }
            });
        });
	$("#country_id" ).change();
        $("#province_id" ).change(function() {
            var country_id = $('#country_id').val();
            var province   = $('#province_id').val();
            var url        = '<?php echo base_url()."local_number/local_number_city/"; ?>';
            var accountid  = '<?php echo $edit_id; ?>';
            $.ajax({
                type  : "POST",
                url   : url,
                data  : { country_id : country_id, accountid : accountid, province : province },
                success:function(response) {
                    $("#city_id").html(response);  
                    $('.selectpicker').selectpicker('refresh');      
                    $(".province_id").removeClass("col-md-5");  
                    $(".province_id").addClass("col-md-3"); 
                    $(".city_id").removeClass("col-md-5");  
                    $(".city_id").addClass("col-md-3");  
                    // Kinjal issue no 1635 
                    $(".local_number_id").replaceWith('<select class="col-md-12 form-control form-control-lg  selectpicker local_number_id" data-live-search="true" id="local_number_id" name="local_number_id"><option>--Select--</option></select>');
                    $('.selectpicker').selectpicker('refresh');  
                    // END
                }
            });
        });
        // Kinjal issue no 1635 
        $('body').on("change","#city_id",function(){
        // END
            var country_id = $('#country_id').val();
            var province   = $('#province_id').val();
            var city       = $('#city_id').val();
            var url        = '<?php echo base_url()."local_number/local_number_customer/"; ?>';
            var accountid  = '<?php echo $edit_id; ?>';
            $.ajax({
                type : "POST",
                url  : url,
                data : { country_id : country_id, accountid : accountid, city : city, province : province },
                success:function(response) {
                    $("#local_number_id").html(response);  
                    $('.selectpicker').selectpicker('refresh');      
                    $(".city_id").removeClass("col-md-5");  
                    $(".city_id").addClass("col-md-3"); 
                    $(".local_number_id").removeClass("col-md-5");  
                    $(".local_number_id").addClass("col-md-3");  
                }
            });
        });
        $("#left_panel_quick_search").keyup(function(){
            quick_search("accounts/customer_details_search/customer_local_number/");
         });
    });
  function form_submit(){
    var local_number_id = $('#local_number_id').val();
    var flag            = 0;
    document.getElementById("local_err").innerHTML  = "";
    document.getElementById("name_err").innerHTML   = "";
    document.getElementById("number_err").innerHTML = "";
    if(local_number_id == ''){
        flag = 1
        document.getElementById("local_err").innerHTML="Please select Local Number";
        return false;
    }
    var name = $('#name').val();
    if(name == ''){
        flag = 1
        document.getElementById("name_err").innerHTML="Please Enter Destination Name";
        return false;
    }
    var number = $('#number').val();
    if(number == ''){
        flag = 1
        document.getElementById("number_err").innerHTML="Please Enter Destination Number";
        return false;
    }
    if(flag == 0){
        document.getElementById("local_num").submit();
    }
  }
</script>
<style>
    #err
    {
        height:20px !important;width:100% !important;float:left;
    }
    label.error {
        float: left; color: red;
        padding-left: .3em; vertical-align: top;  
        padding-left:0px;
        margin-top:-10px;
        width:100% !important;
       
    }
</style>
<? endblock() ?>
<? startblock('page-title') ?>
<?= $page_title ?>
<? endblock() ?>
<? startblock('content') ?>  
 <?php $permissioninfo = $this->session->userdata('permissioninfo');?>
<div id="main-wrapper">
    <div id="content" class="container-fluid">
        <div class="row">
            <div class="col-md-12 color-three border_box"> 
                <div class="float-left m-2 lh19">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="<?= base_url()."accounts/".strtolower($accounttype)."_list/"; ?>"><?= gettext(ucfirst($accounttype)); ?>s</a></li>
                                    <li class="breadcrumb-item">
                                        <a href="<?= base_url()."accounts/".strtolower($accounttype)."_edit/".$edit_id."/"; ?>"> <?= gettext("Profile"); ?> </a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        <a href="<?= base_url()."accounts/".strtolower($accounttype)."_dids/".$edit_id."/"; ?>"><?= $page_title; ?></a>
                                    </li>
                            </ol>
                        </nav>
                </div>
                <div class="m-2 float-right">
                        <a class="btn btn-light btn-hight" href="<?= base_url()."accounts/".strtolower($accounttype)."_edit/".$edit_id."/"; ?>"> <i class="fa fa-fast-backward" aria-hidden="true"></i> Back</a>
                </div>
            </div>
            <div class="p-4 col-md-12">
                <div class="col-md-12">
                    <?php
                      if ($permissioninfo['login_type'] == '2' or $permissioninfo['login_type'] == '-1' or $permissioninfo['login_type'] == '0' or $permissioninfo['login_type'] == '3'){ ?>
                    <div class="float-left" id="left_panel_add">
                        <span class="btn btn-line-warning"> <i class="fa fa-plus-circle fa-lg"></i><?= gettext("Add"); ?></span>
                    </div>
                    <?php } ?>
                     <!-- Rupa issue 1636 Local Number - Searching with local number not working in customer edit page -->
                     <?php  if(((isset($permissioninfo['local_number']['local_number_list']['search'])) && ($permissioninfo['local_number']['local_number_list']['search']==0)  && ($permissioninfo['login_type'] == '2'  or $permissioninfo['login_type'] == '0' or $permissioninfo['login_type'] == '3')) or $permissioninfo['login_type'] == '-1'){ ?>
                   <!--END-->
                    <div id="show_search" class="float-right col-md-4 p-0">
                        <input type="text" name="left_panel_quick_search" id="left_panel_quick_search" class="form-control form-control-lg m-0" value="<?php echo $this->session->userdata('left_panel_search_'.$accounttype.'_animap')?>" placeholder="Search"/>
                    </div>
                    <?php } ?>
                </div> 
                <div class="my-4 slice color-three float-left content_border col-md-12" id="left_panel_form" style="cursor: pointer; display: none;">
                    <div id="floating-label" class="card pb-4">
                        <h3 class="bg-secondary text-light p-2 rounded-top"><?= gettext("Local Number"); ?></h3>
                        <form class="row px-4" method="post" id="local_num" name="local_num" action="<?= base_url()."local_number/local_number_action/add/$edit_id/"; ?>" enctype="multipart/form-data">
                            <div class="col-md-4 form-group">
                                <label for="Country" class="col-md-3 p-0 control-label"><?= gettext("Country"); ?> : </label>                               
                                 <?php
                                $country_arr = array("id" => "country_id", "name" => "country_id", "class" => "country_id");
                                $country = form_dropdown($country_arr, $this->db_model->build_dropdown_country_camel("id,country", "countrycode", "", ""), $country_id);
                                echo $country;
                                ?>
                            </div>
                            <div class="col-md-4 form-group">
                                    <label class="col-md-3 p-0 control-label"><?= gettext("Province"); ?> : </label>
                                    <? echo $province; ?>
                                    <span id="err"></span>
                            </div>
                            <div class="col-md-4 form-group">
                                <label class="col-md-3 p-0 control-label"><?= gettext("City"); ?> : </label>
                                     <? echo $city; ?>
                                 <span id="err"></span>
                             </div>
                            <div class="col-md-4">
                                <div class='col-md-12 form-group p-0'>
                                    <label class="col-md-12 p-0 control-label"><?= gettext("Local Number"); ?>* : </label>
                                    <? echo $local_number; ?>
                                </div>  
                                <span id="local_err" style="color:red;"></span>
                            </div>
                            <div class="col-md-4">
                                <div class='col-md-12 form-group p-0'>
                                    <label class="col-md-12 p-0 control-label"><?= gettext("Destination Name"); ?>* : </label>
                                    <input type="text" class="col-md-12 form-control form-control-lg" name="name" id="name">
                                </div>
                                <span id="name_err" style="color:red;"></span>
                            </div>
                            <div class="col-md-4">
                                <div class='col-md-12 form-group p-0'>
                                    <label class="col-md-12 p-0 control-label"><?= gettext("Destination Number"); ?>* : </label>
                                    <input type="text" class="col-md-12 form-control form-control-lg" name="number" id="number">
                                </div>  
                               <span id="number_err" style="color:red;"></span>
                            </div>
                            <div class="col-md-12 text-center">
                                 <input class=" btn btn-success btn-lg" name="action" value=<?= gettext("Save") ?> type="button" 
                                 onclick = "form_submit();">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-12 color-three slice float-left content_border mt-4">
                    <div class="card col-md-12 pb-4">
                        <table id="dids_list" align="left" style="display:none;"></table>
                    </div>   
                </div>
            </div>
        </div>
    </div>
</div>
<? endblock() ?>
<? end_extend() ?>
