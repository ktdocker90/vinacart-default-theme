
{{ head }} 
<h1 class="heading1">
  <span class="maintext">{{ heading_title }} </span>
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

<div class="contentpanel">

    {% if coupon_status %} 
    <h4 class="heading4">{{ text_coupon }} </h4>
	<div class="registerbox">
		{{ form0.form_open }} 
		<div class="form-inline">
			<label class="checkbox">{{ entry_coupon }} </label>
		    {{ form0.coupon }} 
		    {{ form0.submit }} 
		</div>
		</form>
	</div>
    {% endif %} 

	{{ form.form_open }} 

	{% if shipping_methods  %} 			
	<div id="active_shippings">
	<h4 class="heading4">{{ text_shipping_method }} </h4>	
	<p>{{ text_shipping_methods }} </p>		
	<div class="registerbox">		
        <table class="table table-striped table-bordered">
        {% for shipping_method in shipping_methods %} 
          <tr>
            <td colspan="3"><b>{{ shipping_method.title }} </b></td>
          </tr>
          {% if not shipping_method.error %} 
          {% for quote in shipping_method.quote %} 
			  <tr>
				<td width="5%"><label for="shipping_shipping_method{{ quote.id }} ">{{ quote.radio }} </label></td>
				<td><label for="shipping_shipping_method{{ quote.id }} " title="{{ has_value(quote.description) ? quote.description : ''}} " style="cursor: pointer;">
				{% set icon = shipping_method.icon %}
					{% if  icon|length >0  %}

					{% if  is_file(constant('DIR_RESOURCE') ~ icon.image  )  %}
						<span class="shipping_icon mr10"><img src="resources/{{ icon.image}} " title="{{ icon.title}} " /></span>
					{% elseif  icon.resource_code is not empty %} 
						<span class="shipping_icon mr10">{{ icon.resource_code}} </span>
					{% endif %}
				{% endif %}

				{{ quote.title }} 
				</label></td>
				<td class="align_right"><label for="{{ quote.id }} " style="cursor: pointer;">{{ quote.text }} </label></td>
			  </tr>
          {% endfor %} 
          {% else %}
          
          <tr>
            <td colspan="3"><div class="error">{{ shipping_method.error }} </div></td>
          </tr>
          {% endif %} 
        {% endfor %} 
        </table>
	</div>
	</div>
	{% endif %}

	{{ _this.getHookVar('shipping_extensions_hook') }}

	{{ _this.getHookVar('payment_extensions_pre_hook') }}

	{% if payment_methods  %} 			
	<div style="display: none;" id="active_payments">
		<h4 class="heading4">{{ text_payment_method }} </h4>	
		<p>{{ text_payment_methods }} </p>		
		<div class="registerbox payment_palce_holder"></div>	
	</div>
	<div style="display: none;" id="hidden_payments">
	        {% if payment_methods %} 
	        	{% for ship_name, payment_methods_per_shipping in payment_methods %}  
	        <div class="payment_group {{ ship_name }}">
	        <table class="table table-striped table-bordered">
	          {% for payment_method in payment_methods_per_shipping %} 
	          <tr>
	            <td width="1">
				  {% if payment_method.is_redirect_payment  %} 	
				  
				  	<i class="fa fa-ban fa-fw" title="{{ text_unavailable }} "></i>
				  {% else %}  
				  		{{ payment_method.radio }} 
				  	{% endif %}
				  
				</td>
	            <td><label for="guest_payment_method{{ payment_method.id }} " style="cursor: pointer;">
				{% set icon = payment_method.icon %}

				{% if icon|length>0  %}  
					{% if is_file(constant('DIR_RESOURCE') ~ icon.image  %}
						<span class="payment_icon mr10"><img src="resources/{{ icon.image}} " title="{{ icon.title }} " /></span>
					{% elseif icon.resource_code is not empty %} 
						<span class="payment_icon mr10">{{ icon.resource_code }} </span>
					{% endif %} 									            
				{% endif %} 									            

	            {{ payment_method.title }} 
	            </label></td>
	          </tr>
	          {% endif %} 
	        </table>
	        </div>
	        	{% endfor %}  		          
	        {% endif %}
	</div>	
	{% endif %} 

	{{ _this.getHookVar('payment_extensions_hook') }}
	{{ _this.getHookVar('order_attributes') }}

	<h4 class="heading4">{{ text_comments }} </h4>	
	<div class="registerbox">		
		<div class="content">
			{{ form.comment }} 
     	</div>
		
		<div class="form-group">
			<div class="col-md-12 mt20">
    			{{ _this.getHookVar('buttons_pre') }}
				{{ buttons }} 
				{{ _this.getHookVar('buttons_post') }}
    		</div>
		</div>			
	</div>
	
	</form>
</div>

<script type="text/javascript">		
	if ($("input[name=shipping_method]:checked").length > 0) {
		var shp_name = '';
		shp_name = $("input[name=shipping_method]:checked").val().split('.');
		shp_name = shp_name[0];
		show_payment(shp_name);	

	} else if ( $('#active_shippings').length == 0 ) {
		//no shipping at all show all payments
		show_payment('no_shipping');
	}
		
	$('input[name=shipping_method]').click( function(){
		var selection = $(this).val().split('.');
		//hide and unselect other methods. 
		show_payment(selection[0]);
	} );	
	
	function show_payment( shp_name ) {
		$('#active_payments').show();
		$('.payment_palce_holder').html('');
		$('.payment_palce_holder').html( $('#hidden_payments .'+shp_name).html() );
	}
</script>
{{ footer }} 