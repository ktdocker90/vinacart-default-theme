{{ head }} 
	<h1 class="heading1">
		<span class="maintext"><i class="fa fa-search"></i> {{ heading_title }} </span>
		<span class="subtext"></span>
	</h1>

	<div class="content container-fluid">

		<h4 class="heading4">{{ text_critea }} </h4>

		<div class="form-inline">
			<fieldset>
				<div class="form-group col-xs-6 col-sm-2 col-lg-2">
					<div class="input-group">
						{{ keyword }} &nbsp;
					</div>
				</div>
				<div class="form-group col-xs-6 col-sm-2 col-lg-2">
					<div class="input-group">
						{{ category }} &nbsp;
					</div>
				</div>
				<div class="form-group col-xs-12 col-sm-3 col-lg-3">
					<div class="input-group">
						{{ description }} &nbsp;
					</div>
				</div>
				<div class="form-group col-xs-12 col-sm-3 col-lg-3">
					<div class="input-group">
						{{ model }} &nbsp;
					</div>
				</div>
				<div class="form-group col-xs-12 col-sm-2 col-lg-2">
					<div class="input-group">
						{{ submit }} 
					</div>
				</div>
			</fieldset>
		</div>

		<h4 class="heading4">{{ text_search }} </h4>
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


		{% else %}  
			<div>
				{{ text_empty }} 
			</div>
		{% endif %} 

	</div>

	<script type="text/javascript"><!--
		$('#keyword').keydown(function (e) {
			if (e.keyCode == 13) {
				contentSearch();
			}
		});
		$('#search_button').click(function (e) {
			contentSearch();
		});

		$('#sort').change(function () {
			contentSearch();
		});

		function contentSearch() {
			url = '{{ html.getURL('product/search', '&limit='~limit) }} ';

			var keyword = $('#keyword').attr('value');

			if (keyword) {
				url += '&keyword=' + encodeURIComponent(keyword);
			}

			var category_id = $('#category_id').attr('value');

			if (category_id) {
				url += '&category_id=' + encodeURIComponent(category_id);
			}

			if ($('#description').is(':checked')) {
				url += '&description=1';
			}

			if ($('#model').is(':checked')) {
				url += '&model=1';
			}
			url += '&sort=' + $('#sort').val();

			location = url;
		}
		//--></script>
{{ footer }} 