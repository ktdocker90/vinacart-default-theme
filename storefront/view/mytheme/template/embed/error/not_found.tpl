{{ head }} 
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-frown"></i> {{ heading_title }} </span>
  <span class="subtext"></span>
</h1>

<div class="contentpanel text-center">

	{{ text_error }} 
	
</div>

<div class="container-fluid cart_total">

	<div class="col-md-6 mt20 pull-left">
	    <button onclick="goBack()" class="btn btn-default" title="{{ button_back }} ">
	    	<i class="fa fa-arrow-left"></i>
	    	{{ button_back }}
	    </button>
	</div>

</div>
{% if back_url%} 
	<script type="application/javascript">
		$(document).ready(function () {
			goBack = function () {
				location = '{{ back_url }}';
			}
		});
	</script>
{% endif %} 
{{ footer }} 
