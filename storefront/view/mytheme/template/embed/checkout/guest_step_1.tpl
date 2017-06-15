
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
	{{ form.form_open }} 

	<h4 class="heading4">{{ text_your_details }} </h4>
	<div class="registerbox form-horizontal">
		<fieldset>
			{% for field_name,field in form.fields.general %}
		
			<div class="form-group {% if _context['error_'~field_name] %}has-error {% endif %}">
				<label class="control-label col-sm-4 col-md-4">{{ _context['entry_'~field_name] }} </label>
				<div class="input-group col-sm-4 col-md-4">
				    {{ field }} 
				</div>
				<span class="help-block">{{ _context['error_'~field_name] }} </span>
			</div>		
			{% endfor %}		
			
		
		{{ _this.getHookVar('guest_details_attributes') }}
	
		</fieldset>
	</div>	

	<h4 class="heading4">{{ text_your_address }} </h4>
	<div class="registerbox form-horizontal">
		<fieldset>
			{% for field_name, field in form.fields.address %} 
		
			<div class="form-group {% if _context['error_'~field_name] %}has-error {% endif %}">
				<label class="control-label col-sm-4 col-md-4">{{ _context['entry_'~field_name] }} </label>
				<div class="input-group col-sm-4 col-md-4">
				    {{ field }} 
				</div>
				<span class="help-block">{{ _context['error_'~field_name] }} </span>
			</div>		
			{% endfor %}
	
			{{ _this.getHookVar('address_entry_section') }}

			<div class="form-group">
				<label class="control-label col-sm-4 col-md-4"></label>
				<div class="input-group col-sm-4 col-md-4">
				    {{ form.shipping_indicator }} 
				</div>
			</div>		
		</fieldset>
	</div>
			
	<!-- start shipping address -->
	<div id="shipping_details" style="{{ shipping_addr ? 'display:block;' : 'display:none;' }}">
	<h4 class="heading4">{{ text_shipping_address }} </h4>
		<div class="registerbox form-horizontal">
		<fieldset>
				{% set	field_list = {'firstname' : 'shipping_firstname',
								'lastname' : 'shipping_lastname',
								'company' : 'shipping_company', 
								'address_1' : 'shipping_address_1', 
								'address_2' : 'shipping_address_2', 
								'city' : 'shipping_city',
								'postcode' : 'shipping_postcode',
								'country' : 'shipping_country', 
								'zone' : 'shipping_zone'} %}

								
			
			{% for field_name, field in form.fields.shipping %} 
		
			<div class="form-group {% if _context['error_'~field_id] %}has-error{% endif %}">
				<label class="control-label col-sm-4 col-md-4">{{ _context['entry_'~field_name] }} </label>
				<div class="input-group col-sm-4 col-md-4">
					<!--
					{# if field_name  is  'country'  or  field_name  is  'zone' %}
						{{ _context[form.field_id~"_id"] }} 
					{% else %}   
				   		{{ field }} 
				   	{% endif #}
-->
				   	{{field}}
				   	
				</div>
				<span class="help-block">{{ _context['error_'~field_id] }} </span>
			</div>		
			{% endfor %}		
			
		</fieldset>
		</div>      
	</div>
	<!-- end shipping address -->     
      
	<div class="form-group">
	    <div class="col-md-12 mt20">
	    	<button class="btn btn-orange pull-right" title="{{ form.continue.name}}" type="submit">
	    	    <i class="fa fa-arrow-right"></i>
	    	    {{ form.continue.name}}
	    	</button>
	    	<a href="{{ back }} " class="btn btn-default mr10" title="{{ form.back.text}}">
	    	    <i class="fa fa-arrow-left"></i>
	    	    {{ form.back.text}}
	    	</a>
	    </div>
	</div>
	</form>
</div>

<script type="text/javascript"><!--

$('#guestFrm_shipping_indicator').change( function(){
	(this.checked) ? $('#shipping_details').show() : $('#shipping_details').hide();
});
{% set cz_url = html.getURL('common/zone', '&zone_id='~ zone_id) %}
$('#guestFrm_country_id').change(function() {
    $('select[name=\'zone_id\']').load('{{ cz_url }}&country_id=' + $(this).val());
});
$('select[name=\'zone_id\']').load('{{ cz_url }}&country_id='+$('#guestFrm_country_id').val());

{% set cz_url = html.getURL('common/zone', '&zone_id='~ shipping_zone_id) %}
$('#guestFrm_shipping_country_id').change(function() {
	$('select[name=\'shipping_zone_id\']').load('{{ cz_url }}&country_id=' + $(this).val());
});
$('select[name=\'shipping_zone_id\']').load('{{ cz_url }}&country_id='+$('#guestFrm_shipping_country_id').val());
//--></script>
{{ footer }} 