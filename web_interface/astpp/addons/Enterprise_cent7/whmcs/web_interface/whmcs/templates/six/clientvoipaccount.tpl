{literal}
<style>
.btn-line-warning, .btn-line-warning a {
    color: #f59c1a;
    background-color: transparent;
    border-color: #f59c1a;
    text-decoration: none;
}
.login-box {
text-align: center;
background: #f5f5f5;
padding: 10px 20px;
/*width: 600px;*/
margin: auto;
border: 1px solid #eee;
border-radius: 4px;
font-size:18px;
margin-bottom: 20px;
}
.login-btn {
padding: 7px 20px;
border-radius: 4px;
background: #058 !important;
color: #fff;
display: block;
width: 160px;
text-align: center;
margin: 10px auto;
font-size:18px !important;
border: 1px solid #058;
}

.login-btn:hover{
background: transparent !important;
color: #058 !important;
border: 1px solid #058;
padding: 7px 20px;
border-radius: 4px;
display: block;
width: 160px;
text-align: center;
margin: 10px auto;
text-decoration: none;
font-size:18px !important;
}

</style>
     <script type="text/javascript">
	//	alert('{/literal}{$astpp_url}{literal}whmcs/whmcs_login_as_customer/{/literal}{$user_id}{literal}')
		window.open('{/literal}{$astpp_url}{literal}whmcs/whmcs_login_as_customer/{/literal}{$user_id}{literal}', '_blank');
     </script>
{/literal}

<div class="col-md-12" style="padding:0px;">
	<div class="login-box">
	<div class="heading">
		Please wait you are login in new page in few moment or click on below button.
	</div>
	<a href='{$astpp_url}whmcs/whmcs_login_as_customer/{$user_id}' target='blank'class="login-btn">Continue</a>
</div>
</div>
</body>
</html>
