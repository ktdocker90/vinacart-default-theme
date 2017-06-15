
{{ head }} 
<h1 class="heading1">
	<span class="maintext"><i class="fa fa-pushpin"></i> {{ heading_title }} </span>
	<span class="subtext"></span>
</h1>

{% if success %} 
	<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		{{ success }} 
	</div>
{% endif %} 

{% if error_warning %} 
	<div class="alert alert-error alert-danger">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		{{ error_warning }} 
	</div>
{% endif %} 

<div id="returnPolicyModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="returnPolicyModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="returnPolicyModalLabel">{{ text_accept_agree_href_link }} </h3>
	</div>
	<div class="modal-body">
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">{{ text_close }} </button>
	</div>
</div>
</div>  
</div>

<div class="contentpanel">
	{{ form.form_open }} 
	<p>{{ text_accept_agree }}<a onclick="openModalRemote('#returnPolicyModal', '{{ text_accept_agree_href }} '); return false;"
				href="{{ text_accept_agree_href }} "><b>{{ text_accept_agree_href_link }} </b></a></p>


	{% if shipping_method %} 
		<h4 class="heading4">{{ text_shipping }} </h4>
		<table class="table confirm_shippment_options">
			<tr>
				<td class="align_left">{{ shipping_firstname ~ ' ' ~ shipping_lastname }} 
					<br/>{{ telephone }} </td>
				<td class="align_left">
					<address>
					{{ shipping_address_1 ~ ' ' ~ shipping_address_2 }} <br/>
					{{ shipping_city ~ ' ' ~ shipping_zone ~ ' ' ~ shipping_postcode }} <br/>
					{{ shipping_country }}
					</address>
				</td>
				<td class="align_left">{{ shipping_method }} </td>
				<td class="align_right">
					<a class="btn btn-default btn-xs" href="{{ checkout_shipping_edit }} ">
						<i class="fa fa-edit"></i>
						{{ text_edit_shipping }} 
					</a>
				</td>
			</tr>
		</table>
	{% endif %} 

		{% if payment_method or balance or _this.getHookVar('payment_method' ) %}

		<h4 class="heading4">{{ text_payment}} </h4>

		<table class="table confirm_payment_options">

			{% if payment_method %} 
				<tr>
					<td class="align_left">{{ payment_firstname ~ ' ' ~ payment_lastname }} 
						<br/>{{ telephone }} </td>
					<td class="align_left">
						<address>
						{{ payment_address_1 ~ ' ' ~ payment_address_2 }} <br/>
						{{ payment_city ~ ' ' ~ payment_zone ~ ' ' ~ payment_postcode }} <br/>
						{{ payment_country }}
						</address>
					</td>
					<td class="align_left">{{ payment_method }} </td>
					<td class="align_right">
						<a class="btn btn-default btn-xs" href="{{ checkout_payment_edit }} ">
							<i class="fa fa-edit"></i>
							{{ text_edit_payment }} 
						</a>
						<a class="btn btn-default btn-xs" href="{{ checkout_payment_edit }} ">
							<i class="fa fa-check-square-o"></i>
							{{ text_add_coupon }} 
						</a>
					</td>
				</tr>
			{% endif %}

			{% if balance%}
				<tr>
					<td class="align_left">{{ balance }}</td>
					<td class="align_left">&nbsp;</td>
					<td class="align_left">&nbsp;</td>
					<td class="align_right">
						{% if disapply_balance %} 
						<a class="btn btn-default btn-xs" href="{{ disapply_balance.href }} ">
							<i class="fa fa-edit"></i>
							{{ disapply_balance.text }} 
						</a>
						{% endif %}
					</td>
				</tr>

			{% endif %}

			{% if _this.getHookVar('payment_method')%}
				<tr>
					<td class="align_left">{{ _this.getHookVar('payment_method_title') }}</td>
					<td class="align_left">&nbsp;</td>
					<td class="align_left">&nbsp;</td>
					<td class="align_right">{{ _this.getHookVar('payment_method') }} </td>
				</tr>
			{% endif %}	

		</table>
	{% endif %} 

	<h4 class="heading4">{{ text_cart_items}} 
		<a class="pull-right mr10 btn btn-default btn-xs" href="{{ cart }} ">
			<i class="fa fa-shopping-cart"></i>
			{{ text_edit_basket }} 
		</a>
	</h4>
	<table class="table confirm_products">
		{% for product in products %} 
			<tr>
				<td><a href="{{ product.href }} ">{{ product.thumb.thumb_html }} </a></td>
				<td><a href="{{ product.href }} "
					   class="checkout_heading">{{ product.name }} </a>
					{% for option in product.option %} 
						<br/>
						&nbsp;
						<small title="{{ option.title}}"> - {{ option.name }}  {{ option.value }} </small>
					{% endfor %}
					 </td>
				<td>{{ product.price }} </td>
				<td>{{ product.quantity }} </td>
				<td class="checkout_heading">{{ product.total }} </td>
			</tr>
		{% endfor %} 
		{{ _this.getHookVar('list_more_product_last') }}
	</table>

	{% if comment %} 
		<h4 class="heading4">{{ text_comment }} </h4>
		<div class="container mb10">{{ comment }} </div>
	{% endif %} 

	{{ _this.getHookVar('order_attributes') }}

	<div class="confirm_total">
	
		<div class="cart-info col-md-5">
			<table class="table table-striped table-bordered">
			    {% for total in totals %} 
			    	<tr>
			    		<td>
			    			<span class="extra bold {% if total.id  is  'total' %}totalamout {% endif %}">{{ total.title }} </span>
			    		</td>
			    		<td>
			    			<span class="bold {% if total.id  is  'total' %}totalamout {% endif %}">{{ total.text }} </span>
			    		</td>
			    	</tr>
			    {% endfor %} 
			</table>
		</div>
		
		<div class="col-md-6 col-md-offset-1 payment_confirmation mt10">
			{{ _this.getHookVar('payment_pre') }}
			<div id="payment">{{ payment }} </div>
			{{ _this.getHookVar('payment_post') }}
		</div>
		
	</div>

</div>
{{ footer }} 