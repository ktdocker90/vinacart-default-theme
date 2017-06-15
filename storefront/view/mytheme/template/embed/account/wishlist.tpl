
{{ head }} 
<h1 class="heading1">
	<span class="maintext"><i class="fa fa-star"></i> {{ heading_title }} </span>
</h1>

{% if success %} 
<div class="alert alert-success">
<button type="button" class="close" data-dismiss="alert">&times;</button>
{{ success }} 
</div>
{% endif %} 

{% if error %} 
<div class="alert alert-error alert-danger">
<button type="button" class="close" data-dismiss="alert">&times;</button>
{{ error }} 
</div>
{% endif %} 

<div class="contentpanel">
	<div class="container-fluid wishlist product-list">
		<table class="table table-striped table-bordered">
			<tr>
				<th class="align_center">{{ column_image }} </th>
				<th class="align_left">{{ column_name }} </th>
				<th class="align_left">{{ column_model }} </th>
				<th class="align_right">{{ column_price }} </th>
				<th class="align_right">{{ column_added }} </th>
				<th class="align_center">{{ column_actions }} </th>
			</tr>
			{% for product in products %} 
				<tr class="wishlist_{{ product.product_id }}">
					<td class="align_center">
						<a href="{{ product.href }} ">{{ product.thumb.thumb_html }} </a>
					</td>
					<td class="align_left">
						<a href="{{ product.href }} ">{{ product.name }} </a>
					</td>
					<td class="align_left">{{ product.model }} </td>
					
					{% if display_price %} 
					<td class="align_right">
						{% if product.special %} 
						    <div class="pricenew">{{ product.special }}</div>
						    <div class="priceold">{{ product.price }}</div>
						{% else %}   
						    <div class="oneprice">{{ product.price }}</div>
						{% endif %} 					
					</td>
					{% endif %} 
					
					<td class="align_right">{{ product.added }} </td>
					<td class="align_center">

					{% if display_price %} 
						{% if product.call_to_order%} 
							<a data-id="{{ product.product_id }}" href="#"
								   class="btn call_to_order">{{ text_call_to_order}}&nbsp;&nbsp;<i class="fa fa-phone"></i></a>
						{% elseif product.track_stock  and  not product.in_stock %} 
							<span class="nostock">{{ product.no_stock_text }} </span>
						{% else %}   
							<a href="{{ product.add }} " class="btn btn-sm btn-primary">
								<i class="fa fa-shopping-cart fa-fw"></i>
							</a>
						{% endif %} 
					{% endif %} 
						
						<a href="#" onclick="wishlist_remove('{{ product.product_id }}'); return false;" class="btn btn-sm btn-default btn-remove"><i class="fa fa-trash-o fa-fw"></i></a>
					</td>
				</tr>
			 {% endfor %}
			{{ _this.getHookVar('more_wishlist_products') }}
		</table>

		<div class="pull-right mb20">
			{{ _this.getHookVar('top_wishlist_buttons') }}
			<a href="{{ continue }} " class="btn btn-default mr10">
				<i class="fa fa-arrow-right"></i>
				{{ button_continue }} 
			</a>
			<a href="{{ cart }} " class="btn btn-orange">
				<i class="fa fa-shopping-cart"></i>
				{{ button_cart }} 
			</a>
			{{ _this.getHookVar('bottom_wishlist_buttons') }}
		</div>
	</div>

</div>
<script type="text/javascript"><!--

	function wishlist_remove(product_id) {
		var wclass = '.wishlist_'+product_id;
		var dismiss = '<button type="button" class="close" data-dismiss="alert">&times;</button>';
		$.ajax({
			type: 'POST',
			url: '{{ html.getURL('product/wishlist/remove') }}&product_id='+product_id,
			dataType: 'json',
			beforeSend: function () {
				$('.success, .warning, .alert').remove();
				$(wclass+' .btn-remove i').hide();
				$(wclass+' .btn-remove').append('<i class="wait fa fa-spinner fa-spin"></i>');
			},
			complete: function () {
				$('.wait').remove();
			},
            error: function (jqXHR, exception) {
            	var text = jqXHR.statusText + ": " + jqXHR.responseText;
				$('.alert').remove();
				$('.wishlist').before('<div class="alert alert-error alert-danger">' + dismiss + text + '</div>');
				$(wclass+' .btn-remove i').show();
			},
			success: function (data) {
				if (data.error) {
					$('.alert').remove();
					$('.wishlist').before('<div class="alert alert-error alert-danger">' + dismiss + data.error + '</div>');
					$(wclass+' .btn-remove i').show();
				} else {
					$('.wishlist .alert').remove();
					$(wclass).remove();
				}
			}
		});
	}

//--></script>

{{ footer }} 