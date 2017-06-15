{{ head }} 

{% if error %} 
	<div class="alert alert-error alert-danger">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>{{ error is iterable ? error|join('<br>') : error }} </strong>
	</div>
{% endif %} 

<div id="product_details" class="container-fluid">
		<!-- Product Details-->
		<div class="row">
			<!-- Left Image-->
			<div class="col-md-6 col-sm-6 text-center">
			<ul class="thumbnails mainimage smallimage">
			{% if images|length > 1 %}
			    {% for image in images %}
			    <li class="producthtumb">
			        {% if image.origin != "external" %}
			        
				    	<a href="{{ image.main_url}} " data-standard="{{ image.thumb2_url}} ">
			        	<img src="{{ image.thumb_url }} " alt="{{ image.title }} " title="{{ image.title }} " />
				    	</a>
			        {% endif %} 
			    </li>
			    {% endfor %}
			 {% endif %}
			</ul>

			<div class="mainimage bigimage easyzoom easyzoom--overlay easyzoom--with-thumbnails">
			{% if images|length > 0 %}
				<!-- NOTE: ZOOM is not supported for embeded image tags -->
				{% if image_main.origin == 'external' %}
				
				    <a class="html_with_image">
				    {{ image_main.main_html}}									
				    </a>
				{% else %}  
				    {% set image_url = image_main.main_url %}
				    {% set thumb_url = image_main.thumb_url %}
				
				    <a class="local_image"
				       href="{{image_url }}"
				       target="_blank"
				       title="{{ image_main.title }}">
				    	<img width="{{ config.get('config_image_thumb_width') }}"
				    	    height="{{ config.get('config_image_thumb_height') }}"
							src="{{ thumb_url }}"
							alt="{{ image['title'] }}"
							title="{{ image['title'] }}" />
				        <i class="fa fa-arrows"></i>
				    </a>
				{% endif %} 
			{% endif %}					 
				
			</div>
			</div>
			
			<!-- Right Details-->
			<div class="col-md-6 col-sm-6">
				<div class="row">
					<div class="col-sm-12">
						<h1 class="productname"><span class="bgnone">{{ heading_title }}</span></h1>
						<span class="blurb">{{ product_info.blurb }}</span>
						<div class="productprice">
							
							{% if display_price %}
								<div class="productpageprice jumbotron">
									{% if special %}
										<div class="productfilneprice">
											<span class="spiral"></span>{{ special }}</div>
										<span class="productpageoldprice">{{ price }}</span>
									{% else %}
										<span class="productfilneprice"></span><span
												class="spiral"></span>{{ price }}
									{% endif %}
								</div>
							{% endif %}

							{% if average %}
								<ul class="rate">
									{% for i in range(1,5) %}
										{% if i <= average %}
											<li class="on"></li>
										{% else %}
											<li class="off"></li>
										{% endif %}
									{% endfor %}
									
								</ul>
							{% endif %}
						</div>

						<div class="quantitybox">
							{% if display_price %}
								{{ form.form_open }}
								<fieldset>
									{% if options %}
										{% for option in options %}
											<div class="form-group">
												{% if option.html.type != 'hidden' %}
												<label class="control-label">{{ option.name }}</label>
												{% endif %}
												<div class="input-group col-sm-10">
													{{ option.html }}
												</div>
											</div>
										{% endfor %}
									{% endif %}

									{{ _this.getHookVar('extended_product_options') }}

									{% if discounts %}
										<div class="form-group">
											<label class="control-label">{{ text_discount }}</label>
											<table class="table table-striped">
												<thead>
													<th>{{text_order_quantity }}</th>
													<th>{{ text_price_per_item }}</th>
												</thead>
											{% for discount in discounts %}
												<tr>
													<td>{{ discount.quantity }}</td>
													<td>{{ discount.price }}</td>
												</tr>
											{% endfor %}
											</table>
										</div>
									{% endif %}

									{% if not product_info.call_to_order %}
									<div class="form-group mt20">
										<div class="input-group col-sm-4">
											<span class="input-group-addon">{{ text_qty }}</span>
											{{ form.minimum }}
										</div>
										{% if minimum > 1 %}
											<div class="input-group ">{{ text_minimum }}</div>
										{% endif %}
										{% if maximum > 0 %}
											<div class="input-group ">{{ text_maximum }}</div>
										{% endif %}
									</div>

									<div class="form-group mt20 mb10 total-price-holder">
										<label class="control-label">{{ text_total_price }}
											<span class="total-price"></span>
										</label>
									</div>
									{% endif %}

									{% if product_info.free_shipping and product_info.shipping_price <= 0 %}
									<div class="alert alert-info mt10 mb10 free-shipping-holder">
										<label class="control-label">{{ text_free_shipping }}</label>
									</div>
									{% endif %}

									<div>
										{{ form.product_id ~ form.redirect }}
									</div>

									<div class="mt20 ">
										{% if not product_info.call_to_order %}
											{% if track_stock and not in_stock %}
											<ul class="productpagecart">
												<li><span class="nostock">{{stock }}</span></li>
											</ul>
											{% else %}
											<ul class="productpagecart">
												<li>
													{% if not _this.getHookVar('product_add_to_cart_html') %}
													<a href="#" onclick="$(this).closest('form').submit(); return false;" class="cart">
														{{ button_add_to_cart }}
													</a>
													{% else %}
												        {{ _this.getHookVar('product_add_to_cart_html') }}
												    {% endif %}
												</li>
											</ul>

											{% endif %}
										{% else %}
											<ul class="productpagecart call_to_order">
												<li><a href="#" class="call_to_order"><i class="fa fa-phone"></i>  
													{{ text_call_to_order }}</a></li>
											</ul>
										{% endif %}
										<a class="productprint btn btn-large" href="javascript:window.print();">
											<i class="fa fa-print"></i> {{ button_print }}
										</a>
										{{ _this.getHookVar('buttons') }}
									</div>

									
									{%	if in_wishlist %}
											{% set whislist = ' style="display: none;" ' %}
											{% set nowhislist = '' %}
										{% else %}
											{% set nowhislist = ' style="display: none;" ' %}
											{% set whislist = '' %}
										{% endif %}
									
									{% if is_customer %}
									<div class="wishlist">
										<a class="wishlist_remove btn btn-large" href="#" onclick="wishlist_remove(); return false;" {{nowhislist}}>
											<i class="fa fa-trash-o"></i> {{button_remove_wishlist}}
										</a>
										<a class="wishlist_add btn btn-large" href="#" onclick="wishlist_add(); return false;" {{whislist}}>
											<i class="fa fa-plus-square"></i> {{ button_add_wishlist }}
										</a>
									</div>
									{% endif %}
								</fieldset>
								</form>
							{% elseif not product_info.call_to_order %}
								<div class="form-group">
									<label class="control-label">
										{{ text_login_view_price }}
									</label>
								</div>
							{% endif %}

						</div>
					</div>
				</div>
			</div>
		</div>
</div>

<div id="productdesc" class="container-fluid">
	<div class="row">
		<div class="col-md-12 productdesc">
			<ul class="nav nav-tabs" id="myTab">
				<li class="active"><a href="#description">{{ tab_description }}</a></li>
				{% if review_status %}
					<li><a href="#review">{{ tab_review }}</a></li>
				{% endif %}

				{% if tags %}
					<li><a href="#producttag">{{text_tags }}</a></li>
				{% endif %}

				{% if related_products %}
					<li><a href="#relatedproducts">{{ tab_related }} ({{related_products|length }})</a></li>
				{% endif %}

				{% if downloads %}
					<li><a href="#productdownloads">{{ tab_downloads }}</a></li>
				{% endif %}

				{{ _this.getHookVar('product_features_tab') }}
			</ul>
			<div class="tab-content">

				<div class="tab-pane active" id="description">
					{{ description }}

					<ul class="productinfo">
						{% if stock %}
							<li>
								<span class="productinfoleft">{{ text_availability }}</span> {{ stock }}
							</li>
						{% endif %}
						{% if model %}
							<li><span class="productinfoleft">{{ text_model }}</span> {{ model }}
							</li>
						{% endif %}
						{% if manufacturer %}
							<li>
								<span class="productinfoleft">{{ text_manufacturer }}</span>
								<a href="{{ manufacturers }}">
									{% if manufacturer_icon %}
										<img alt="{{ manufacturer }}"
										     src="{{ manufacturer_icon }}"
											 title="{{ manufacturer }}"
											 style="width: {{ config.get('config_image_grid_width') }}px;"/>
									{% else %}
										{{ manufacturer }}
									{% endif %}
								</a>
							</li>
						{% endif %}
					</ul>

				</div>

				{% if review_status %}
					<div class="tab-pane" id="review">
						<div id="current_reviews" class="mb20"></div>
						<div class="heading" id="review_title"><h4>{{ text_write }}</h4></div>
						<div class="content">
							<fieldset>
								<div class="form-group">
									<div class="form-inline">
										<label class="control-label col-md-3 pull-left">{{ entry_rating }} 
											<span class="red">*</span></label>
										{{ rating_element }}
									</div>
								</div>
								<div class="form-group mt40">
									<div class="form-inline">
										<label class="control-label col-md-3">{{ entry_name }} <span class="red">*</span></label>
										{{ review_name }}
									</div>
								</div>
								<div class="form-group">
									<div class="form-inline">
										<label class="control-label col-md-3">{{ entry_review }} 
											<span class="red">*</span></label>
										{{ review_text }}
									</div>
									<div class="input-group">{{ text_note }}</div>
								</div>
								{% if review_recaptcha %}
								<div class="clear form-group">
								    <div class="form-inline col-md-6 col-md-offset-1 col-sm-6">
								    	{{ review_recaptcha }}
								    </div>	
								    <div class="form-inline col-md-5 col-sm-6">								    
								    	{{ review_button }}
								    </div>
								</div>
								{% else %}
								<div class="clear form-group">
									<label class="control-label">{{ entry_captcha }} 
										<span class="red">*</span></label>
	
							    	<div class="form-inline">
							    		<label class="control-label col-md-3">
							    			<img src="{{ captcha_url }}" id="captcha_img" alt=""/>
							    		</label>
							    		{{ review_captcha }} 
							    		{{ review_button }}
							    	</div>
								</div>
								{% endif %}
							</fieldset>
						</div>
					</div>
				{% endif %}

				{% if tags %}
					<div class="tab-pane" id="producttag">
						<ul class="tags">
							{% for tag in tags %}
							<li><a href="{{ tag.href }}"><i class="fa fa-tag"></i>{{ tag.tag }}</a></li>
							{% endfor %}
						</ul>
					</div>
				{% endif %}

				{% if related_products %}
					<div class="tab-pane" id="relatedproducts">
						<ul class="row side_prd_list">
						{% for related_product in related_products  %}
							{% set related_products = related_products|merge({'rating_image': related_product.rating ? "<img src='" ~ templateResource('/image/stars_' ~ related_product.rating ~ '.png') ~ "' alt='" ~ related_product.stars ~ "' width='64' height='12' />" : ''}) %}

							{% if not display_price %}
								{% set related_product=related_product|merge({price: '', special:''}) %}
							{% endif %}
							
								<li class="col-md-3 col-sm-4 col-xs-6 related_product">
									<a href="{{ related_product.href }}">{{ related_product.image.thumb_html }}</a>
									<a class="productname"
									   href="{{ related_product.href }}">{{ related_product.name }}</a>
									<span class="procategory">{{ item.rating }}</span>

									<div class="price">
										{% if related_product.special %}
											<span class="pricenew">{{ related_product.special }}</span>
											<span class="priceold">{{ related_product.price }}</span>
										{% else %}
											<span class="oneprice">{{ related_product.price }}</span>
										{% endif %}
									</div>
								</li>
						{% endfor %}
						</ul>
					</div>
				{% endif %}

				{% if downloads %}
					<div class="tab-pane" id="productdownloads">
						<ul class="list-group">
							{% for download in downloads %}
							<li class="list-group-item">
								<a class="pull-right btn btn-default" href="{{ download.button.href }}"><i class="fa fa-download"></i> {{ download.button.text}}</a>
								<div>{{ download.name }}
									<div class="download-list-attributes">
								{% for name,value in download.attributes %}
									<small>- {{name}}: {{ value is iterable ? value|join(' ') : value }}</small>
								{% endfor %}
									</div>
								</div>
							</li>
							{% endfor %}
						</ul>
					</div>
				{% endif %}

				{{ _this.getHookVar('product_features') }}

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

	var orig_imgs = $('ul.bigimage').html();
	var orig_thumbs = $('ul.smallimage').html();

	jQuery(function ($) {

		start_easyzoom();

		//if have product options, load select option images 
		var $select = $('input[name^=\'option\'], select[name^=\'option\']'); 
		if ($select.length) {
			//if no images for options are present, main product images will be used. 
			//if atleast one image is present in the option, main images will be replaced.
			load_option_images($select.val(), '{{ product_id }}');
		}

		display_total_price();

		$('#current_reviews .pagination a').on('click', function () {
			$('#current_reviews').slideUp('slow');
			$('#current_reviews').load(this.href);
			$('#current_reviews').slideDown('slow');
			return false;
		});

		reload_review('{{ product_review_url }}');
	});

	$('#product_add_to_cart').click(function () {
		$('#product').submit();
	});
	$('#review_submit').click(function () {
		review();
	})
	
	//process clicks in review pagination
	$('#current_reviews').on('click', '.pagination a', function () {
		reload_review($(this).attr('href'));
		return false;
	})

	/* Process images for product options */
	$('input[name^=\'option\'], select[name^=\'option\']').change(function () {
		load_option_images($(this).val(), '{{ product_id }}');
		display_total_price();
	});

	$('input[name=quantity]').keyup(function () {
		display_total_price();
	});

	function start_easyzoom() {
		// Instantiate EasyZoom instances
		var $easyzoom = $('.easyzoom').easyZoom();
		
		// Get an instance API
		var api1 = $easyzoom.filter('.easyzoom--with-thumbnails').data('easyZoom');
		//clean and reload esisting events 
		api1.teardown();
		api1._init();
		
		// Setup thumbnails
		$('.thumbnails').on('click', 'a', function(e) {
		   var $this = $(this);
		   e.preventDefault();
		   // Use EasyZoom's `swap` method
		   api1.swap($this.data('standard'), $this.attr('href'));
		});
	}

	function load_option_images( attribute_value_id, product_id ) {
		$.ajax({
			type: 'POST',
			url: '{{ option_resources_url }}&attribute_value_id='+attribute_value_id+'&product_id='+product_id,
			dataType: 'json',
			success: function (data) {
				var html1 = '';
				var html2 = '';
				
				if (data.main) {
					if (data.main.origin == 'external') {
						html1 = '<a class="html_with_image">';
						html1 += data.main.main_html + '</a>';						
					} else {
				    	html1 = '<a href="' + data.main.main_url + '">';
				    	html1 += '<img src="' + data.main.thumb_url + '" style="width:'+data.main.thumb_width+'px; height:'+data.main.thumb_height+'px;"/>';
				    	html1 += '<i class="fa fa-arrows"></i></a>';
				    }			
				}				
				if (data.images) {
					for (img in data.images) {
						html2 += '<li class="producthtumb">';
						var img_url = data.images[img].main_url;
						var tmb_url = data.images[img].thumb_url;
						var tmb2_url = data.images[img].thumb2_url;
						if (data.images[img].origin != 'external') {
							html2 += '<a href="'+img_url+'" data-standard="'+tmb2_url+'"><img src="' + tmb_url + '" alt="' + data.images[img].title + '" title="' + data.images[img].title + '" /></a>';
						}
						html2 += '</li>';
					}
				} else {
					html1 = orig_imgs;
					html2 = orig_thumbs;
				}
				$('div.bigimage').html(html1);
				$('ul.smallimage').html(html2);
				start_easyzoom();
			}
		});
	}

	function display_total_price() {

		$.ajax({
			type: 'POST',
			url: '{{ calc_total_url }}',
			dataType: 'json',
			data: $("#product").serialize(),

			success: function (data) {
				if (data.total) {
					$('.total-price-holder').show();
					$('.total-price-holder').css('visibility', 'visible');
					$('.total-price').html(data.total);
				}
			}
		});

	}

	function reload_review( url) {
		$('#current_reviews').load(url);
	}

	function review() {
		var dismiss = '<button type="button" class="close" data-dismiss="alert">&times;</button>';

		{% if review_recaptcha %}
		var captcha = '&g-recaptcha-response=' + encodeURIComponent($('textarea[name=\'g-recaptcha-response\']').val());
		{% else %}
		var captcha = '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val());
		{% endif %}

		$.ajax({
			type: 'POST',
			url: '{{ product_review_write_url }}',
			dataType: 'json',
			data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + captcha,
			beforeSend: function () {
				$('.success, .warning').remove();
				$('#review_button').attr('disabled', 'disabled');
				$('#review_title').after('<div class="wait"><i class="fa fa-spinner fa-spin"></i> {{ text_wait }}</div>');
			},
			complete: function () {
				$('#review_button').attr('disabled', '');
				$('.wait').remove();
				{% if review_recaptcha %}
    				grecaptcha.reset();
    			{% endif %}
			},
            error: function (jqXHR, exception) {
            	var text = jqXHR.statusText + ": " + jqXHR.responseText;
				$('#review .alert').remove();
				$('#review_title').after('<div class="alert alert-error alert-danger">' + dismiss + text + '</div>');
			},
			success: function (data) {
				if (data.error) {
					$('#review .alert').remove();
					$('#review_title').after('<div class="alert alert-error alert-danger">' + dismiss + data.error + '</div>');
				} else {
					$('#review .alert').remove();
					$('#review_title').after('<div class="alert alert-success">' + dismiss + data.success + '</div>');

					$('input[name=\'name\']').val('');
					$('textarea[name=\'text\']').val('');
					$('input[name=\'rating\']:checked').attr('checked', '');
					$('input[name=\'captcha\']').val('');
				}
				$('img#captcha_img').attr('src', $('img#captcha_img').attr('src') + '&' + Math.random());
			}
		});
	}

	function wishlist_add() {
		var dismiss = '<button type="button" class="close" data-dismiss="alert">&times;</button>';
		$.ajax({
			type: 'POST',
			url: '{{ product_wishlist_add_url }}',
			dataType: 'json',
			beforeSend: function () {
				$('.success, .warning').remove();
				$('.wishlist_add').hide();
				$('.wishlist').after('<div class="wait"><i class="fa fa-spinner fa-spin"></i> {{text_wait }}</div>');
			},
			complete: function () {
				$('.wait').remove();
			},
            error: function (jqXHR, exception) {
            	var text = jqXHR.statusText + ": " + jqXHR.responseText;
				$('.wishlist .alert').remove();
				$('.wishlist').after('<div class="alert alert-error alert-danger">' + dismiss + text + '</div>');
				$('.wishlist_add').show();
			},
			success: function (data) {
				if (data.error) {
					$('.wishlist .alert').remove();
					$('.wishlist').after('<div class="alert alert-error alert-danger">' + dismiss + data.error + '</div>');
					$('.wishlist_add').show();
				} else {
					$('.wishlist .alert').remove();
					//$('.wishlist').after('<div class="alert alert-success">' + dismiss + data.success + '</div>');
					$('.wishlist_remove').show();
				}
			}
		});
	}

	function wishlist_remove() {
		var dismiss = '<button type="button" class="close" data-dismiss="alert">&times;</button>';
		$.ajax({
			type: 'POST',
			url: '{{ product_wishlist_remove_url }}',
			dataType: 'json',
			beforeSend: function () {
				$('.success, .warning').remove();
				$('.wishlist_remove').hide();
				$('.wishlist').after('<div class="wait"><i class="fa fa-spinner fa-spin"></i> {{text_wait }}</div>');
			},
			complete: function () {
				$('.wait').remove();
			},
            error: function (jqXHR, exception) {
            	var text = jqXHR.statusText + ": " + jqXHR.responseText;
				$('.wishlist .alert').remove();
				$('.wishlist').after('<div class="alert alert-error alert-danger">' + dismiss + text + '</div>');
				$('.wishlist_remove').show();
			},
			success: function (data) {
				if (data.error) {
					$('.wishlist .alert').remove();
					$('.wishlist').after('<div class="alert alert-error alert-danger">' + dismiss + data.error + '</div>');
					$('.wishlist_remove').show();
				} else {
					$('.wishlist .alert').remove();
					//$('.wishlist').after('<div class="alert alert-success">' + dismiss + data.success + '</div>');
					$('.wishlist_add').show();
				}
			}
		});
	}

</script>
{{ footer }}