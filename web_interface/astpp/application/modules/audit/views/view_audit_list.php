<? extend('master.php') ?>
<? startblock('extra_head') ?>
<style>
.mt-0 {
	
}
</style>
<script type="text/javascript" language="javascript">
    $(document).ready(function() {
        build_grid("auditlist","",<? echo $grid_fields; ?>,<? echo $grid_buttons; ?>);
        $('.checkall').click(function () {
            $('.chkRefNos').attr('checked', this.checked); 
        });
         $("#audit_search_btn").click(function(){
            post_request_for_search("auditlist","","audit_search");
        });        
        $("#id_reset").click(function(){ 
            clear_search_request("auditlist","");
        });
      
        var from_date = date + " 00:00:00";
        var to_date = date + " 23:59:59";
        $("#customer_cdr_from_date").datetimepicker({
            value:from_date,
            uiLibrary: 'bootstrap4',
            iconsLibrary: 'fontawesome',
            modal:true,
            format: 'yyyy-mm-dd HH:MM:ss',
            footer:true
         });  
         $("#customer_cdr_to_date").datetimepicker({
             value:to_date,
            uiLibrary: 'bootstrap4',
            iconsLibrary: 'fontawesome',
            modal:true,
            format: 'yyyy-mm-dd HH:MM:ss',
            footer:true
         });  
        
    });
</script>
<? endblock() ?>
<? startblock('page-title') ?>
<?= $page_title ?>
<? endblock() ?>
<? startblock('content') ?>
<section class="slice color-three">
	<div class="w-section inverse p-0">
		<div class="col-12">
			<div class="portlet-content mb-4" id="search_bar"
				style="cursor: pointer; display: none">
                        <?php echo $form_search; ?>
                </div>
		</div>
	</div>
</section>
<section class="slice color-three pb-4">
	<div class="w-section inverse p-0">
		<div class="card col-md-12 pb-4">
			<form method="POST" action="del/0/" enctype="multipart/form-data"
				id="ListForm">
				<table id="auditlist" align="left" style="display: none;"></table>
			</form>
		</div>
	</div>
	</div>
</section>
<? endblock() ?>	
<? end_extend() ?>  
