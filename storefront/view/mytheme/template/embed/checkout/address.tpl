{{ head }}
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-book"></i> {{ heading_title }}</span>
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

<div class="contentpanel addresses">
	<div class="col-md-6 col-xs-12">
	<section class="old_address">
	<h4 class="heading4">{{ text_entries }}</h4>
	{% if addresses %}
	  {{ form0.form_open }}
	
		<div class="registerbox form-horizontal">
			<table class="table table-striped">
			{% for address in addresses %}
				<tr>
					<td class="align_left">{{ address.radio }}</td>
					<td class="align_left"><label class="control-label inline" for="address_1_address_id{{ address.address_id }}" style="cursor: pointer;">{{address.address }}</label></td>
				</tr>
			{% endfor %}
			</table>
	
			<div class="form-group">
			    <div class="col-md-12">
			    	<button class="btn btn-orange pull-right" title="{{ form0.continue.name }}" type="submit">
			    	    <i class="fa fa-arrow-right"></i>
			    	    {{ form0.continue.name }}
			    	</button>
			    </div>
			</div>						
		</div>		
	</form>
	</section>
	</div>
	
	<div class="col-md-6 col-xs-12">
	<section class="new_address">
	<h4 class="heading4">{{ text_new_address }}</h4>
	{% endif %}
	{{form.form_open }}
	
	<div class="registerbox">
		<fieldset>
		
			{% set field_list = ['firstname' : 'firstname',
								'lastname' : 'lastname',
								'company' : 'company', 
								'address_1' : 'address_1', 
								'address_2' : 'address_2', 
								'city' : 'city',
								'zone' : 'zone',
								'postcode' : 'postcode',
								'country' : 'country_id', 
								] %}
			
		{%	for field_name,field_id in field_list %}
		
			<div class="form-group {% if _context['error_'~field_name] %} has-error {% endif %}">
				<label class="control-label col-md-4">{{ _context['entry_' ~ field_name] }}</label>
				<div class="input-group col-md-6">
				    {{form[field_id] }}
				</div>
				<span class="help-block">{{_context['error_' ~ field_name] }} </span>
			</div>		
		{% endfor %}
			{{ _this.getHookVar('new_address_sections') }}

			<div class="form-group">
				<div class="col-md-12">
					<button class="btn btn-orange pull-right" title="{{ form.continue.name }}" type="submit">
					    <i class="fa fa-arrow-right"></i>
					    {{ form.continue.name }}
					</button>
				</div>
			</div>				
		</fieldset>	
	</div>	
	</form>
	</section>
	</div>

</div>

<script type="text/javascript">

{% set cz_url = html.getURL('common/zone', '&zone_id='~ zone_id) %}
$('#Address2Frm_country_id').change(function() {
    $('select[name=\'zone_id\']').load('{{ cz_url }}&country_id=' + $(this).val());
});
$('select[name=\'zone_id\']').load('{{ cz_url }}&country_id='+$('#Address2Frm_country_id').val());

</script>
{{ footer }}