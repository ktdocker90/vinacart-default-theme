{{ head }} 
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-book"></i> {{ heading_title }} </span>
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
	<h4 class="heading4">{{ text_edit_address }} </h4>
	<div class="registerbox form-horizontal">
		<fieldset>
				{% set field_list = {'firstname': 'firstname',
								'lastname' : 'lastname',
								'company' : 'company', 
								'address_1' : 'address_1', 
								'address_2' : 'address_2', 
								'city' : 'city',
								'postcode' : 'postcode',
								'country' : 'country_id', 
								'zone' : 'zone_id'} %}
								
			
			{% for field_name, field_id in field_list %} 
		
			<div class="form-group {% if _context['error_'~ field_name] %}has-error {% endif %}">
				<label class="control-label col-sm-4 col-md-4">{{ _context['entry_'~field_name] }} </label>
				<div class="input-group col-sm-6 col-md-4">
				    {{ form.field_id }} 
				</div>
				<span class="help-block">{{ _context['error_'~field_name] }} </span>
			</div>		
			{% endfor %}		
			
			<div class="form-group">
				<label class="control-label col-sm-4 col-md-4">{{ entry_default }} </label>
				<div class="input-group">
				    {{ form.default }} 
				</div>
			</div>		
	
			{{ _this.getHookVar('address_edit_sections') }}
			<div class="form-group">
				<div class="col-md-12">
					<button class="btn btn-orange pull-right" title="{{ form.submit.name}}" type="submit">
					    <i class="{{ form.submit.icon }}"></i>
					    {{ form.submit.name}}
					</button>
					<a href="{{ back }} " class="btn btn-default mr10" title="{{ form.back.text}}">
					    <i class="{{ form.back.icon }}"></i>
					    {{ form.back.text}}
					</a>
				</div>
			</div>
			
		</fieldset>
	</div>
	</form>
</div>


<script type="text/javascript"><!--
{% set cz_url = html.getURL('common/zone', '&zone_id='~ zone_id) %}
$('#AddressFrm_country_id').change(function() {
    $('select[name=\'zone_id\']').load('{{ cz_url }}&country_id=' + $(this).val());
});
$('select[name=\'zone_id\']').load('{{ cz_url }}&country_id=' + $('#AddressFrm_country_id').val());
//--></script>

{{ footer }} 