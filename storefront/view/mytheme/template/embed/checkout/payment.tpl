
{{ head }} 
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-credit-card"></i> {{ heading_title }} </span>
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

<div class="embed_contentpanel">

	<h4 class="heading4">{{ text_payment_address }} </h4>
	<div class="registerbox">
		<table class="table table-striped table-bordered">
		{{ _this.getHookVar('payment_extensions_pre_address_hook') }}
		<tr>
			<td><address>{{ address }} </address></td>
			<td>
			<div class="form-group">
				<label class="control-label">{{ text_payment_to }} </label>
				<div class="input-group">
					<a href="{{ change_address_href }} " class="btn btn-default mr10" title="{{ button_change_address }}">
					    <i class="fa fa-edit"></i>
					    {{ button_change_address }}
					</a>				
				</div>
			</div>									
			</td>
		</tr>
		{{ _this.getHookVar('payment_extensions_post_address_hook') }}
		</table>		
	</div>

    
	{% if coupon_status %}
		{{ coupon_form }}
	{% endif %}

    {% if balance %} 
		<h4 class="heading4">{{ text_balance }} </h4>
    	<div class="registerbox">
			<table class="table table-striped table-bordered">
				<tr><td>{{ balance }}&nbsp;&nbsp;&nbsp;&nbsp;{{ apply_balance_button }} </td></tr>
			</table>
		</div>

    {% endif %} 

	{{ _this.getHookVar('payment_extensions_pre_hook') }}

	{{ form.form_open }}	

	{# nopayment needed if full balance is used #}
	{% if not used_balance_full  %}
	
		{% if payment_methods  %} 			
		<h4 class="heading4">{{ text_payment_method }} </h4>	
		<p>{{ text_payment_methods }} </p>		
		<div class="registerbox">		
	        <table class="table table-striped table-bordered">
				{{ _this.getHookVar('payment_extensions_pre_payments_hook') }}
				{% for payment_method in payment_methods %} 
				<tr>
				  <td style="width:1px;">
				  {% if payment_method.is_redirect_payment  %} 	
				  
				  	<i class="fa fa-ban fa-fw" title="{{ text_unavailable }} "></i>
				  	{% else %}  
				  		{{ payment_method.radio }} 
				  	{% endif %}
				  
				  </td>
				  <td><label for="payment_payment_method{{ payment_method.id }} " style="cursor: pointer;">
					{% set icon = payment_method.icon %}
					{% if icon|length>0 %}  
						{% if  is_file(constant('DIR_RESOURCE') ~ icon.image  %}
							<span class="payment_icon mr10"><img src="resources/{{ icon.image}} " title="{{ icon.title }} " /></span>
						{% elseif  icon.resource_code is not empty %} 
							<span class="payment_icon mr10">{{ icon.resource_code }} </span>
						{% endif %}
					{% endif %}

					{{ payment_method.title }} 
				  </label></td>
				</tr>
				{% endfor %} 
				{{ _this.getHookVar('payment_extensions_post_payments_hook') }}
			</table>
		</div>
		 {% endif %}
		{{ _this.getHookVar('payment_extensions_hook') }}
	{% endif %} 
	
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
<script type="text/javascript"><!--

	$('input[name^=\'payment_method\']').change(function () {
		var $form = $(this).closest('form');
		var $agree = $form.find('input[name^=\'agree\']');
		if($agree.length && !$agree.is(':checked')) {
			$agree.focus();
		} else {
			$form.submit(); return false;
		}		
	});

	$('input[name^=\'agree\']').change(function () {
		var $form = $(this).closest('form');
		var $payment = $form.find('input[name^=\'payment_method\']');
		if($payment.length && !$payment.is(':checked')) {
			$payment.focus();
		} else {
			$form.submit(); return false;
		}		
	});

//--></script>
{{ footer }} 