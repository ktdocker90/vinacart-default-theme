
{{ head }} 
<h1 class="heading1">
	<span class="maintext"><i class="fa fa-shopping-cart"></i> {{ heading_title }} </span>
	{% if weight %} 
		<span class="subtext">({{ weight }} )</span>
	{% endif %} 
</h1>

{% if success %} 
	<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		{{ success }} 
	</div>
{% endif %} 

{% if error_warning|length > 0 %}
	{% for error in error_warning %}
		
		<div class="alert alert-error alert-danger">
			<strong>{{ error}} </strong>
		</div>
	{% endfor %}
{% endif %}

{{ form.form_open }}

<div class="contentpanel">
	<div class="container-fluid cart-info product-list">
		<table class="table table-striped table-bordered">
			<tr>
				<th class="align_center">{{ column_image }} </th>
				<th class="align_left">{{ column_name }} </th>
				<th class="align_left">{{ column_model }} </th>
				<th class="align_right">{{ column_price }} </th>
				<th class="align_center">{{ column_quantity }} </th>
				<th class="align_right">{{ column_total }} </th>
				<!-- <th class="align_center">{{ column_remove }} {# remove button column  #} </th> -->
			</tr>
			{% if products|length > 0 %}
			{% for product in products %} 
				{% set product_id = preg_replace('#\:.+#', '', product.key) %}
            	{% set index = loop.index ~ '_' ~product_id %}

				<tr>
					<td class="align_center">
						<!-- product image -->
						<a href="{{ product.href }} ">{{ product.thumb.thumb_html }} </a>
					</td>
					<td class="align_left">
						<!-- product name & link -->
						<a href="{{ product.href }} ">
							{{ product.name }} 
						</a>
						<!-- out of stock note -->
						{% if not product.stock %} 
							<span style="color: #FF0000; font-weight: bold;">***</span>
						{% endif %}

						<div>
							<!-- product options choosed -->
							{% for option in product.option %} 
								{% set _option = getModel('vnc_catalog_product').filterProductOptionData(option.option) %}
								{% if _option.value %} 
									{% set option = option|merge({value: _option.value}) %}
	                            {% else %} 
	                            	{% set option=option|merge({value : _option.value}) %}
	                            {% endif %}
								-
								<small title="{{ option.title}}">{{ option.name }}  {{ option.value }} </small><br/>
							{% endfor %} 
						</div>
					</td>
					<td class="align_left">{{ product.model }} </td>
					<td class="align_right">{{ product.price }} </td>
					<td class="align_center">
						<div class="input-group" style="width:140px;margin-bottom: 10px;">
							<span class="input-group-btn">
		                          <button type="button" class="btn btn-danger btn-number qtyminus" field='quantity{{ index }}' data-type="minus" data-field="quant[2]">
		                            <span class="glyphicon glyphicon-minus"></span>
		                          </button>
		                    </span>
		                    <!-- quantity input field  --> {# product.quantity #}
		                    <input type='text' data-key="{{ product.key }}" name='quantity{{ index }}' value="{{ fieldValue(product.quantity,'value') }}" class='qty form-control input-number' min="1" max="100"/>
		                    <span class="input-group-btn">
		                          <button type="button" class="btn btn-success btn-number qtyplus" data-type="plus" field='quantity{{ index }}' data-field="quant[2]">
		                              <span class="glyphicon glyphicon-plus"></span>
		                          </button>
		                    </span>
						</div>
						<a href="javascript:void(0)" class="update_cart_btn btn btn-sm btn-default" data-callback="hw_update_cart_callback">
                        	<i class="fa fa-check"></i></a>
                    <a href="{{ product.remove_url }}" data-key="{{ product.key }}" data-callback="hw_update_cart_callback" class="remove_cart_item_btn btn btn-sm btn-default">
                    	<i class="fa fa-trash-o fa-fw"></i></a>
						
					</td>
					<td class="align_right"><span class="cart_item_total">{{ product.total }}</span> </td>
					<!--
					<td class="align_center">
						<a href="{{ product.remove_url }} " class="btn btn-sm btn-default"><i class="fa fa-trash-o fa-fw"></i></a>
					</td>
				-->
				</tr>
			 {% endfor %}
			 {% else %}
				 <tr>
					<td colspan="6">{{ text_empty_cart }}</td>
				</tr>
			 {% endif %}
			{{ _this.getHookVar('list_more_product_last') }}
		</table>

		<div class="pull-right mb20">
			{{ _this.getHookVar('pre_top_cart_buttons') }}

			{% if form.checkout %} 
				<a href="#" onclick="save_and_checkout('{{ checkout_rt }} '); return false;" id="cart_checkout1" class="btn btn-orange pull-right" title="{{ button_checkout }} ">
					<i class="fa fa-shopping-cart"></i>
					{{ button_checkout }} 
				</a>
			{% endif %} 
			<!-- update button -->
			<!--
			<button title="{{ button_update }} " class="btn btn-default pull-right mr10" id="cart_update"
					value="{{ form.update.form}}" type="submit">
				<i class="fa fa-refresh"></i>
				{{ button_update }} 
			</button>
		-->
			{{ _this.getHookVar('post_top_cart_buttons') }}
		</div>
	</div>
	</form>

{% if estimates_enabled  or  coupon_status %}
	{% set pull_side = 'pull-right' %}
	{% if estimates_enabled %}
		{% set pull_side = 'pull-left' %}
	{% endif %}
	
	<div class="cart-info coupon-estimate container-fluid">
		<!-- ## Coupon Code section -->
		{% if coupon_status %} 
			<div class="{{ pull_side }}  coupon">
				<table class="table table-striped ">
					<tr>
						<!-- text Apply Coupon Code -->
						{% if coupon_status %} 
							<th class="align_center">{{ text_coupon_codes }}</th>
						{% endif %} 
					</tr>
					<tr>
						<td>
							<!-- Coupon Code form -->
							{% if coupon_status %}
								{{ coupon_form }}
							{% endif %}
							
						</td>
					</tr>
				</table>
			</div>
		{% endif %}

		<!-- estimates section -->
		{% if estimates_enabled %} 
			<div class="pull-right estimate">
				<table class="table table-striped">
					<tr>
						<th class="align_center">{{ text_estimate_shipping_tax }}</th>
					</tr>
					<tr>
						<td>
							<div class="registerbox form-horizontal">
								{{ form_estimate.form_open }} 
								<!-- country_zones field -->
								<div class="form-group">
									<label class="control-label col-sm-4">{{ text_estimate_country }} </label>
									<div class="input-group col-sm-8">
									{{ form_estimate.country_zones }} 
									</div>
								</div>																			
								
								<div class="shippings-offered form-group">
									<label class="control-label col-sm-4">{{ text_estimate_shipments }} </label>
									<div class="shipments input-group col-sm-8">
										{{ form_estimate.shippings }} 
									</div>
								</div>
								</form>
							</div>
						</td>
					</tr>
				</table>
			</div>
		{% endif %} 

	</div>
{% endif %} 

	<div class="container-fluid cart_total">
	    <div class="col-md-6 cart-info totals pull-right table-responsive">
	    	<table id="totals_table" class="table table-striped table-bordered">
	    		<!--
	    		<?php /* Total now loaded with ajax. ?>
	    		<?php foreach ($totals as $total) { ?>
	    			<tr>
	    				<td><span class="extra bold <?php if ($total['id'] == 'total') echo 'totalamout'; ?>"><?php echo $total['title']; ?></span></td>
	    				<td><span class="bold <?php if ($total['id'] == 'total') echo 'totalamout'; ?>"><?php echo $total['text']; ?></span></td>
	    			</tr>
	    		<?php } ?>
	    		<?php */ ?>
	    	-->
	    	</table>
	    	
	    	{{ _this.getHookVar('pre_cart_buttons') }}

	    	<a href="{{ continue }} " class="btn btn-default mr10  mb10" title="">
	    		<i class="fa fa-arrow-right"></i>
	    		{{ text_continue_shopping }}
	    	</a>
	    	<!-- checkout button if allowed -->
	    	{% if form.checkout %} 
	    		<a href="#" onclick="save_and_checkout('{{ checkout_rt }} '); return false;" id="cart_checkout2" class="btn btn-orange pull-right" title="{{ button_checkout }} ">
	    			<i class="fa fa-shopping-cart"></i>
	    			{{ button_checkout }} 
	    		</a>
	    	{% endif %} 
	
	    	{{ _this.getHookVar('post_cart_buttons') }}
	    </div>
	</div>
</div>
<script type="text/javascript">
	//by hoangweb
    jQuery(document).ready(function() {
        $.vnc_btn_plus_minus({
            plusBtn:'.qtyplus',
            minusBtn: '.qtyminus',
            min: 1,
            onchange: function(obj, val) {
                $.overlayMsg();

                hw_update_cart({quantity: val, cart_item_id: $(obj).data('key') }, function(res) {
                    console.log('update-cart:',res);
                    $(obj).closest('tr').find('.cart_item_total:eq(0)').html(res['products'][$(obj).data('key')].total);
                    $.unblockUI();

                    if($('#estimate_country_zones').length  ) display_shippings();
                    else display_totals();
                    //update cart_top widget
                    get_cart_content();
                });
            }
        });  //by hoang
    });

		jQuery(function ($) {

			display_shippings();

			$(document).on("change", '#estimate_country_zones', function () {
				//zone is changed, need to reset poscode
				$("#estimate input[name=\'postcode\']").val('')
				display_shippings();
			})

			$(document).on("change", '#shippings', function () {
				display_totals();
			})

			$('#estimate').submit(function () {
				display_shippings();
				return false;
			});
			
		});

		var save_and_checkout = function(url) { 
			//first update cart and then follow the next step
			var input = $("<input>").attr("type", "hidden").attr("name", "next_step").val(url);
			$('#cart').append($(input));
			$('#cart').submit();
		}		
		
		var  display_shippings = function() {
			var postcode = encodeURIComponent($("#estimate input[name=\'postcode\']").val());
			var country_id = encodeURIComponent($('#estimate_country').val());
			var zone_id = $('#estimate_country_zones').val();

			var replace_obj = $('.shippings-offered .shipments');
			replace_obj;
			$.ajax({
				type: 'POST',
				url: '{{ html.getURL('r/checkout/cart/change_zone_get_shipping_methods') }}',
				dataType: 'json',
				data: 'country_id=' + country_id + '&zone_id=' + zone_id + '&postcode=' + postcode,
				beforeSend: function () {
					$(replace_obj).html('<div class="progress progress-striped active" style="width: 170px;"><div class="bar" style="width: 100%;"></div></div>');
				},
				complete: function () {
				},
				success: function (data) {
					$(replace_obj).html('');
					$('.shippings-offered label.control-label').hide();
					if (data && data.selectbox) {
						if (data.selectbox != '') {
							$(replace_obj).show();
							$('.shippings-offered label.control-label').show();
							$(replace_obj).css('visibility', 'visible');
							$(replace_obj).html(data.selectbox);
						}
					}
					display_totals();
				}
			});

		}

		//load total with AJAX call
		var display_totals = function () {
			var shipping_method = '';
			var coupon = encodeURIComponent($("#coupon input[name=\'coupon\']").val());
			shipping_method = encodeURIComponent($('#shippings :selected').val());
			if (shipping_method == 'undefined') {
				shipping_method = '';
			}
			$.ajax({
				type: 'POST',
				url: '{{ html.getURL('r/checkout/cart/recalc_totals') }}',
				dataType: 'json',
				data: 'shipping_method=' + shipping_method + '&coupon=' + coupon,
				beforeSend: function () {
					var html = '';
					html += '<tr>';
					html += '<td><div class="progress progress-striped active"><div class="bar" style="width: 100%;"></div></div></td>';
					html += '</tr>';
					$('.cart-info.totals table#totals_table').html(html);
				},
				complete: function () {
				},
				success: function (data) {
					if (data && data.totals.length) {
						var html = '';
						for (var i = 0; i < data.totals.length; i++) {
							var grand_total = '';
							if (data.totals[i].id == 'total') {
								grand_total = 'totalamout';
							}
							html += '<tr>';
							html += '<td><span class="extra bold ' + grand_total + '">' + data.totals[i].title + '</span></td>';
							html += '<td><span class="bold ' + grand_total + '">' + data.totals[i].text + '</span></td>';
							html += '</tr>';
						}
						$('.cart-info.totals table#totals_table').html(html);
					}
				}
			});
		}

		var  show_error = function(parent_element, message) {
			var html = '<div class="alert alert-error alert-danger">' + message + '</div>';
			$(parent_element).before(html);
		}

</script>
{{ footer }} 