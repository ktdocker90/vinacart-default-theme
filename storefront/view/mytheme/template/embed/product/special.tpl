{{ head }} 
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-info-sign"></i> {{ heading_title }} </span>
  <span class="subtext"></span>
</h1>

<div class="contentpanel">

	{% if products %} 
	<!-- Sorting + pagination-->
	<div class="sorting well">
	  <form class=" form-inline pull-left">
	    {{ text_sort }} &nbsp;&nbsp;{{ sorting }} 
	  </form>
	  <div class="btn-group pull-right">
	    <button class="btn" id="list"><i class="fa fa-th-list"></i>
	    </button>
	    <button class="btn btn-orange" id="grid"><i class="fa fa-th"></i></button>
	  </div>
	</div>
	<!-- end sorting-->

	 {% include templateResource('/template/pages/product/product_listing.tpl'  ) %}
		
	<!-- Sorting + pagination-->
	<div class="sorting well">
		{{ pagination_bootstrap}} 
		<div class="btn-group pull-right">
		</div>
	</div>
	<!-- end sorting-->
	
{% endif %} 		

		
</div>

<script type="text/javascript"><!--
$('#sort').change(function () {
	Resort();
});

function Resort() {
	url = '{{ url }} ';
	url += '&sort=' + $('#sort').val();
	url += '&limit=' + $('#limit').val();
	location = url;
}
//--></script>
{{ footer }} 