<? extend('master.php') ?>
<? startblock('extra_head') ?>


<script type="text/javascript" language="javascript">
    $(document).ready(function() {
        var timezone_name = "<?php echo isset($timezone_name) ? $timezone_name : ''; ?>";
       
        $('#timezone_name_id').val(timezone_name);
        build_grid("timezone_grid","",<? echo $grid_fields; ?>,<? echo $grid_buttons; ?>);
        $('.checkall').click(function () {
            $('.chkRefNos').prop('checked', $(this).prop('checked')); 
        });
        $("#timezone_search_btn").click(function(){
            
            post_request_for_search("timezone_grid","","timezone_search");
        });        
        $("#id_reset").click(function(){ 
            clear_search_request("timezone_grid","");
        });
        
    });
</script>
<? endblock() ?>

<? startblock('page-title') ?>
<?= $page_title ?>
<? endblock() ?>

<? startblock('content') ?>        
<style>	
	
.pure-button-primary {
	width:140px;color:#fff; background-color:#79C447; border-radius:4px; font-family:arial; text-align:center;box-shadow:0px 1px 1px #406826;padding:5px 5px 5px 5px;border:2px #63a139;cursor:pointer;font-family: 'Lato', sans-serif;
}
</style>


<section class="slice color-three">
	<div class="w-section inverse p-0">
   	    <div class="col-12">
            	<div class="portlet-content mb-4"  id="search_bar" style="cursor:pointer; display:none">
                    	<?php echo $form_search; ?>
    	        </div>
            </div>
    </div>
</section>

<section class="slice color-three pb-4">
	<div class="w-section inverse p-0">
    	        <div class="card col-md-12 pb-4">      
                        <form method="POST" action="del/0/" enctype="multipart/form-data" id="ListForm">
                            <table id="timezone_grid" align="left" style="display:none;"></table>
                        </form>
                </div>  
    </div> 
</section>

<? endblock() ?>	

<? end_extend() ?>  
 
 
