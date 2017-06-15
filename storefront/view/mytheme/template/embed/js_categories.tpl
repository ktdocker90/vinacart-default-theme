{# populate category div on client side  #}
(function(){
	var html = '';

{% for category in categories %}  
	{% set target = targets[category.category_id] %}

	if($('#{{ target }} .abantecart_name')){
		html = '<a data-href="{{ category.details_url }}"  data-id="{{ category.category_id }}" data-backdrop="static" data-keyboard="false" data-html="true" data-target="#abc_embed_modal" data-toggle="abcmodal" href="#" class="category_thumb">'
			+ '{{ category.name }}</a>';
		$('#{{ target }} .abantecart_name').html(html);
	}

	if($('#{{ target }} .abantecart_image')){
		html = '<a data-href="{{ category.details_url }}"  data-id="{{ category.category_id }}" data-backdrop="static" data-keyboard="false" data-html="true" data-target="#abc_embed_modal" data-toggle="abcmodal" href="#" class="category_thumb" data-original-title="">'
			+ '{{ category.thumbnail.thumb_html }}</a>';
		$('#{{ target }} .abantecart_image').html(html);
	}

	if($('#{{ target }} .abantecart_products_count')){
		$('#{{ target }} .abantecart_products_count').html('({{ category.products_count}})');
	}

{% endfor %}

})();
