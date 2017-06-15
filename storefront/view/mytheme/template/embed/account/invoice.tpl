
{{ head }} 
<h1 class="heading1">
	<span class="maintext"><i class="fa fa-file"></i> {{ heading_title }} </span>
	<span class="subtext"></span>
</h1>

<div class="contentpanel">

	<div class="container-fluid table-responsive">
		<table class="table table-striped table-bordered">
			<tr>
				<td>{% if invoice_id %} 
						<b>{{ text_invoice_id }} </b><br/>
						{{ invoice_id }} <br/>
						<br/>
					{% endif %} 
					<b>{{ text_order_id }} </b><br/>
					#{{ order_id }} <br/>
					<br/>
					<b>{{ column_status }} </b><br/>
					{{ status }} <br/>
					<br/>
					<b>{{ text_email }} </b><br/>
					{{ email }} <br/>
					<br/>

					{% if telephone %} 
						<b>{{ text_telephone }} </b><br/>
						{{ telephone }} <br/>
						<br/>
					{% endif %} 

					{% if fax %} 
						<b>{{ text_fax }} </b><br/>
						{{ fax }} <br/>
						<br/>
					{% endif %} 

					{% if shipping_method %} 
						<b>{{ text_shipping_method }} </b><br/>
						{{ shipping_method }} <br/>
						<br/>
					{% endif %} 
					<b>{{ text_payment_method }} </b><br/>
					{{ payment_method }} </td>

				<td>{% if shipping_address %} 
						<b>{{ text_shipping_address }} </b><br/>
						<address>{{ shipping_address }} </address>
					{% endif %} 
				</td>
				<td><b>{{ text_payment_address }} </b><br/>
					<address>{{ payment_address }} </address>
				</td>
			</tr>
		</table>
	</div>
	<div class="container-fluid invoice_products table-responsive">
		<table class="table table-striped table-bordered">
			<tr>
				<th class="align_left">{{ text_image }} </th>
				<th class="align_left">{{ text_product }} </th>
				<th class="align_left">{{ text_model }} </th>
				<th class="align_right">{{ text_quantity }} </th>
				<th class="align_right">{{ text_price }} </th>
				<th class="align_right">{{ text_total }} </th>
			</tr>
			{% for product in products %} 
				<tr>
					<td align="left" valign="top">{{ product.thumbnail.thumb_html }} </td>
					<td class="align_left  valign_top"><a
								href="{{ str_replace('%ID%', product.id, product_link ) }}">{{ product.name}} </a>
						{% for option in product.option %} 
							<br/>
							&nbsp;
							<small title="{{ option.title}}"> - {{ option.name }}  {{ option.value }} </small>
						{% endfor %}
						 </td>

					<td class="align_left valign_top">{{ product.model }} </td>
					<td class="align_right valign_top">{{ product.quantity }} </td>
					<td class="align_right valign_top">{{ product.price }} </td>
					<td class="align_right valign_top">{{ product.total }} </td>
				</tr>
			 
			{{ _this.getHookVar('list_more_product_last') }}
		</table>

		<div class="col-md-4 col-xs-6 pull-right">
			<table class="table table-striped table-bordered">
				{% for total in totals %} 
					<tr>
						<td class="align_right">{{ total.title }} </td>
						<td class="align_right">{{ total.text }} </td>
					</tr>
				 {% endfor %}
			</table>
		</div>
	</div>

	{% if comment %} 
		<div class="container-fluid">
			<h4 class="heading4">{{ text_comment }} </h4>

			<div class="content">{{ comment }} </div>
		</div>
	{% endif %} 

	{{ _this.getHookVar('order_attributes') }}

	{% if historys %} 
		<div class="container-fluid">
			<h4 class="heading4">{{ text_order_history }} </h4>
			<table class="table table-striped table-bordered">
				<tr>
					<th class="align_left">{{ column_date_added }} </th>
					<th class="align_left">{{ column_status }} </th>
					<th class="align_left">{{ column_comment }} </th>
				</tr>
				{% for history in historys %} 
					<tr>
						<td class="valign_top">{{ history.date_added }} </td>
						<td class="valign_top">{{ history.status }} </td>
						<td class="valign_top">{{ history.comment }} </td>
					</tr>
				{% endfor %} 
			</table>
		</div>
	 {% endif %} 

	<div class="form-group">
		<div class="mt20 mb40">
		    <a href="{{ continue }} " class="btn btn-default mr10" title="{{ button_back }} ">
		    	<i class="fa fa-arrow-left"></i>
		    	{{ button_back }}
		    </a>
		    {{ _this.getHookVar('hk_additional_buttons') }}
		    <a href="javascript:window.print();" class="btn btn-orange mr10 pull-right"
		       title="{{ button_print.text}}">
		    	<i class="{{ button_print.icon }}"></i>
		    	{{ button_print.text}}
		    </a>
		</div>
	</div>

	</form>
</div>
{{ footer }} 