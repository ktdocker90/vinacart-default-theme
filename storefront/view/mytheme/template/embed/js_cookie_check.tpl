//set mark about 3d party cookie
 (function(){
	abc_cookie_allowed = {{  allowed ? 'true' : 'false' }};
	abc_token_value = '{{ abc_token }}';
	var abc_cookie_value = encodeURIComponent('{{ abc_token }}');
	document.cookie = "abantecart_token="+abc_cookie_value;
 })();
