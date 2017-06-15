
{{ head }} 
{% if success %} 
	<h1 class="heading1">
	  <span class="maintext"><i class="fa fa-thumbs-up"></i> {{ text_subscribe_register }} </span>
	  <span class="subtext"></span>
	</h1>

	<div class="contentpanel">

	<section class="mb10">
		<p></p>
		<p>{{ success }} </p>
	</section>
	</div>

	<div class="form-group">
		<div class="input-group">
			<div class="pull-right col-md-2 mt10 mb40">
				{{ continue }}
			</div>
		</div>
	</div>

{% else %}  
	<h1 class="heading1">
	  <span class="maintext"><i class="fa fa-group"></i> {{ text_subscribe_register }} </span>
	  <span class="subtext"></span>
	</h1>

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
		{% if form %}
			{% for field_name, field in form %}  
			<div class="form-group {{ _context['error_'~field_name]? 'has-error' :  '' }}">
				<label class="control-label col-sm-4">{{ _context['entry_'~field_name] }} </label>
				<div class="input-group col-sm-4">
				    {{ field }} 
				</div>
				<span class="help-block">{{ _context['error_'~field_name] }} </span>
			</div>		
			{% endfor %}
		{% endif %}	
		</fieldset>
	</div>

	{{ _this.getHookVar('subscriber_hookvar') }}
	
	<div class="form-group">
	    <div class="col-md-12">
			<div class="pull-left col-sm-8">
				{{ create_account }}
			</div>
	    	<div class="pull-right col-sm-4">
				{{ continue }}
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

 {% endif %}
{{ footer }} 