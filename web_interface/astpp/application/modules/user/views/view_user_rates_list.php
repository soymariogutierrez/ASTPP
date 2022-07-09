<? extend('master.php') ?>
<? startblock('extra_head') ?>

<script type="text/javascript" language="javascript">
    $(document).ready(function() {
        build_grid("user_rates_grid","",<? echo $grid_fields; ?>,<? echo $grid_buttons; ?>);
        $("#user_rates_list_search_btn").click(function(){
            post_request_for_search("user_rates_grid","","user_rates_list_search");
        });        
        $("#id_reset").click(function(){
            clear_search_request("user_rates_grid","");
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
            	<div class="portlet-content mb-4"  id="search_bar" style="display:none">
                    	<?php echo $form_search; ?>
    	        </div>
        </div>
    </div>
</section>

<section class="slice color-three padding-b-20">
	<div class="w-section inverse no-padding">
    	<div class="">
        	<div class="">
                <div class="card col-md-12 pb-4">      
                        <form method="POST" action="del/0/" enctype="multipart/form-data" id="ListForm">
                            <table id="user_rates_grid" align="left" style="display:none;"></table>
                        </form>
                </div>  
            </div>
        </div>
    </div>
</section>

<? endblock() ?>	
<? end_extend() ?>  
