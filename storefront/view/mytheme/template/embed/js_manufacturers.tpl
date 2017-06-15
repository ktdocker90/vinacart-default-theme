{# populate category div on client side  #}
(function(){
	var html = '';

{% for manufacturer in manufacturers %}  
	{% set target = targets[manufacturer.manufacturer_id] %}

	if($('#{{ target }} .abantecart_name')){
		html = '<a data-href="{{ manufacturer.details_url }}" data-backdrop="static" data-keyboard="false" data-id="{{ manufacturer.manufacturer_id }}" data-html="true" data-target="#abc_embed_modal" data-toggle="abcmodal" href="#">'
			+ '{{ manufacturer.name }}</a>';
		$('#{{ target }} .abantecart_name').html(html);
	}

	if($('#{{ target }} .abantecart_image')){
		html = '<a data-href="{{ manufacturer.details_url }}" data-backdrop="static" data-keyboard="false" data-id="{{ manufacturer.manufacturer_id }}" data-html="true" data-target="#abc_embed_modal" data-toggle="abcmodal" href="#" class="category_thumb">'
			+ '{{ manufacturer.thumbnail.thumb_html }}</a>';
		$('#{{ target }} .abantecart_image').html(html);
	}

	if($('#{{ target }} .abantecart_products_count')){
		$('#{{ target }} .abantecart_products_count').html('({{ manufacturer.products_count}})');
	}
{% endfor %}
 

})();
