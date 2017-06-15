{# populate product div on client side #}
(function(){
	var html = '';
	if($('#{{target}} .abantecart_name')){
		$('#{{ target }} .abantecart_name').html('{{ product.name }}');
	}

	if($('#{{ target }} .abantecart_image')){
		html = '<a data-href="{{ product_details_url }}"  data-id="{{ product.product_id }}" data-html="true" data-target="#abc_embed_modal" data-backdrop="static" data-keyboard="false" data-toggle="abcmodal" href="#" class="product_thumb" data-original-title="">'
			+ '{{ product.thumbnail.thumb_html }}</a>';
		$('#{{ target }} .abantecart_image').html(html);
	}

{% if product.price and display_price %}
	html ='';
	if($('{{ target }} .abantecart_price')){
	{% if product.special %}
			html = '<div class="priceold">{{ product.price }}</div>'+
					'<div class="pricenew">{{ product.special }}</div>';
		{% else %}
			html = '<div class="oneprice">{{ product.price }}</div>'
		{% endif %}

		$('#{{ target }} .abantecart_price').html(html);
	}
{% endif %}

{% if product.rating %}
	html ='';
	if($('{{ target }} .abantecart_rating')){
		html = '{{ '<img src="' ~ constant('AUTO_SERVER')~ templateResource('/image/stars_' ~ product.rating|number_format ~ '.png') ~ '" alt="' ~ product.stars ~ '" />'}}';
		$('#{{ target }} .abantecart_rating').html(html);
	}
{% endif %}

{% if product.quantity and not (product.track_stock and not product.in_stock) and not product.call_to_order %}
	html ='';
	if($('{{ target }} .abantecart_quantity')){
		html = '<span class="abantecart_quantity_text">{{ text_qty }}</span>&nbsp;<input type="text" size="3" class="abantecart_quantity_field" placeholder="{{ text_qty }}" value="{{ product.quantity.value }}" id="product_quantity" name="{{ product.quantity.name }}"></div>';
		$('#{{ target }} .abantecart_quantity').html(html);
	}
{% endif %}

{% if product.button_addtocart %}
	html ='';
	if($('{{ target }} .abantecart_addtocart')){
		{% if product.call_to_order or (product.track_stock and not product.in_stock) %}
		html ='';
		{% else %}
		html ='<button {{ product.button_addtocart.attr }} title="{{ product.button_addtocart.text }}" class="abantecart_button" id="{{ product.button_addtocart.id }}" type="button">{{ product.button_addtocart.text }}</button>';
		{% endif %}

		$('#{{ target }} .abantecart_addtocart').html(html);
	}
{% endif %}

{% if product.blurb %}
	if($('#{{ target }} .abantecart_blurb')){
		$('#{{ target }} .abantecart_blurb').html('{{ product.blurb }}');
	}
{% endif %}
{{ _this.getHookVar('embed_product_js') }}

})();
