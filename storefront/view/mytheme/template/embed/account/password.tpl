
{{ head }} 
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-key"></i> {{ heading_title }} </span>
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
	{{ form_open }} 
	
	<h4 class="heading4">{{ text_password }} </h4>
	<div class="registerbox form-horizontal">
		<fieldset>
			{% set	field_list = ['current_password', 'password', 'confirm'] %}
			
			{% for field_name in field_list %}
		
			<div class="form-group {% if _context['error_'~field_name] %} has-error {% endif %}">
				<label class="control-label col-sm-4">{{ _context['entry_'~field_name] }} </label>
				<div class="input-group col-sm-4">
				    {{ _context[field_name] }} 
				</div>
				<span class="help-block">{{ _context['error_'~field_name] }} </span>
			</div>		
			{% endfor %}
			
		</fieldset>
	</div>

	{{ _this.getHookVar('password_edit_sections') }}
	
	<div class="form-group">
	    <div class="col-sm-12">
	    	<button class="btn btn-orange pull-right" title="{{ submit.name}}" type="submit">
	    	    <i class="{{ submit.icon }} fa"></i>
	    	    {{ submit.name}}
	    	</button>
	    	<a href="{{ back }} " class="btn btn-default mr10" title="{{ button_back.text}}">
	    	    <i class="{{ button_back.icon }}"></i>
	    	    {{ button_back.text}}
	    	</a>
	    </div>
	</div>
	</form>
</div>
{{ footer }} 