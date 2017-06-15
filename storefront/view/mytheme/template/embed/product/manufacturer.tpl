{{ head }} 
	<h1 class="heading1">
		<span class="maintext">{{ heading_title }} </span>
  <span class="subtext">
	  <img style="width: {{ config.get('config_image_grid_width') }} px;"
	       src="{{ manufacturer_icon }} "/>
  </span>
	</h1>

	<div class="content container-fluid">

		{% if products %} 
			<!-- Sorting + pagination-->
			<div class="sorting well">
				<form class=" form-inline pull-left">
					{{ text_sort }} &nbsp;&nbsp;{{ sorting }} 
				</form>

			</div>
			<!-- end sorting-->

			{% include templateResource('/template/pages/product/product_listing.tpl' ) %}

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

		$('#sort').on('change', Resort);

		function Resort() {
			url = '{{ url }} ';
			url += '&sort=' + $('#sort').val();
			url += '&limit=' + $('#limit').val();
			location = url;
		}
		//--></script>
{{ footer }} 