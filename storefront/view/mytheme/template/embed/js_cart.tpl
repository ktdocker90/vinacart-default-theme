{# show html content of cart in float div on client side  #}
 (function(){
	$('.abantecart-widget-cart').remove();
	{% if cart_count%}
		html = '<a class="abantecart-widget-cart" data-href="{{ cart_url }}" data-html="true" data-target="#abc_embed_modal" data-toggle="abcmodal" href="#" title="{{ text_view }}"> \
				<div class="abantecart-widget-cart"> \
					<div class="cart_count"> \
						{{ cart_count }}  \
					</div>	\
				</div></a>';
		$('body').append(html);
	{% endif %} 
 })();
 