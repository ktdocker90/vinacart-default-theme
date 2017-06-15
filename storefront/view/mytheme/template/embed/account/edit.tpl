
{{ head }} 
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-edit"> </i>{{ heading_title }} </span>
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
			{% for field_name,field in form.fields %}
		
			<div class="form-group {% if _context['error_'~field_name] %} has-error {% endif %}">
				<label class="control-label col-md-4">{{ _context['entry_'~field_name] }} </label>
				<div class="input-group col-md-4">
				    {{ field }} 
				</div>
				<span class="help-block">{{ _context['error_'~field_name] }} </span>
			</div>		
			{% endfor %}		
			
		
		{{ _this.getHookVar('customer_attributes') }}
	
		</fieldset>
	</div>

	<div class="form-group">
	    <div class="col-md-12">
	    	<button class="btn btn-orange pull-right" title="{{ form.continue.name}}" type="submit">
	    	    <i class="{{ form.continue.icon }}"></i>
	    	    {{ form.continue.name}}
	    	</button>
			<a href="{{ back }} " class="btn btn-default mr10" title="{{ form.back.text}}">
			    <i class="{{ form.back.icon }}"></i>
			    {{ form.back.text}}
			</a>
	    </div>
	</div>
	
</form>
</div>
{{ footer }} 