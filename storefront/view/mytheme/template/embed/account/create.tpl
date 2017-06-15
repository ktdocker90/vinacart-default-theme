
{{ head }} 
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-group"></i> {{ heading_title }} </span>
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
	
	<p>{{ text_account_already }} </p>
	
	<h4 class="heading4">{{ text_your_details }} </h4>
	<div class="registerbox form-horizontal">
		<fieldset>

			{% for field_name,field in form.fields.general %}
		
			<div class="form-group {{ _context['error_'~field_name]? 'has-error' :  '' }} ">
				<label class="control-label col-sm-4">{{ _context['entry_'~field_name] }} </label>
				<div class="input-group col-sm-4">
				    {{ field }} 
				</div>
				<span class="help-block">{{ _context['error_'~field_name] }} </span>
			</div>		
			{% endfor %}		
			
		</fieldset>
	</div>

	<h4 class="heading4">{{ text_your_address }} </h4>
	<div class="registerbox form-horizontal ">
		<fieldset>

			{% for field_name, field in form.fields.address %} 
		
			<div class="form-group {% if _context['error_'~field_name] %}has-error {% endif %} ">
				<label class="control-label col-sm-4">{{ _context['entry_'~field_name] }} </label>
				<div class="input-group col-sm-4">
				    {{ field }} 
				</div>
				<span class="help-block">{{ _context['error_'~field_name] }} </span>				
			</div>		
			{% endfor %}
			
		</fieldset>
	</div>
	
	<h4 class="heading4 ">{{ text_your_password }} </h4>
	<div class="registerbox form-horizontal">
		<fieldset>
			<div class="form-group {% if error_password %}has-error {% endif %}">
				<label class="col-sm-4 control-label">{{ entry_password }} </label>
				<div class="input-group col-sm-4">
				    {{ form.fields.password.password }} 
				</div>
				<span class="help-block">{{ error_password }} </span>
			</div>
			<div class="form-group {% if error_confirm %}has-error {% endif %}">
				<label class="col-sm-4 control-label">{{ entry_confirm }} </label>
				<div class="input-group col-sm-4">
				    {{ form.fields.password.confirm }} 
				</div>
				<span class="help-block">{{ error_confirm }} </span>
			</div>
		</fieldset>
	</div>
	
	{{ _this.getHookVar('customer_attributes') }}
	
	<h4 class="heading4 ">{{ text_newsletter }} </h4>
	<div class="registerbox form-horizontal">
		<fieldset>
			<div class="form-group">
				<label class="col-sm-4 control-label">{{ entry_newsletter }} </label>
				<div class="input-group col-sm-4">
				    {{ form.fields.newsletter.newsletter }} 
				</div>
			</div>
		</fieldset>
		{% if form.captcha %} 
		<fieldset>
			<div class="form-group {% if error_captcha %}has-error {% endif %}">
				{% if form.captcha.type is  'recaptcha' %} 
				<label class="col-sm-4 control-label"></label>
				{% else %}   
				<label class="col-sm-4 control-label">{{ entry_captcha }} </label>
				{% endif %} 
				<div class="input-group col-sm-4">
				    {{ form.fields.newsletter.captcha }} 
				</div>
				<span class="help-block">{{ error_captcha }} </span>
			</div>
		</fieldset>
		{% endif %} 
	</div>


	<div class="form-group">
		<div class="col-md-12">
	{% if text_agree %} 
			<label class="col-md-6 mt10 mb10">
				{{ text_agree }} <a href="{{ text_agree_href }} " onclick="openModalRemote('#privacyPolicyModal','{{ text_agree_href }} '); return false;"><b>{{ text_agree_href_text }} </b></a>

				{{ form.agree }} 
			</label>

	{% endif %}     	
	    	<div class="col-md-2 mt10 mb40">
	    		<button class="btn btn-orange pull-right" title="{{ form.continue.name}}" type="submit">
	    		    <i class="fa fa-check"></i>
	    		    {{ form.continue.name}}
	    		</button>
	    	</div>	
	    </div>
	</div>
	
</form>
</div>

<div id="privacyPolicyModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="privacyPolicyModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="privacyPolicyModalLabel">{{ text_agree_href_text }} </h3>
	</div>
	<div class="modal-body">
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">{{ text_close }} </button>
	</div>
</div>
</div>
</div>  

<script type="text/javascript"><!--
{% set cz_url = html.getURL('common/zone', '&zone_id='~ zone_id) %}
$('#AccountFrm_country_id').change( function(){
    $('select[name=\'zone_id\']').load('{{ cz_url }}&country_id=' + $(this).val());
});
$('select[name=\'zone_id\']').load('{{ cz_url }}&country_id='+ $('#AccountFrm_country_id').val());

//--></script>

{{ footer }} 