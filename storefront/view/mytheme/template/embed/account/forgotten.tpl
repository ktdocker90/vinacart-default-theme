{{ head }}
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-key"></i> {{heading_title }}</span>
  <span class="subtext"></span>
</h1>

{% if success %}
<div class="alert alert-success">
<button type="button" class="close" data-dismiss="alert">&times;</button>
{{ success }}
</div>
{% endif %}

{% if error %}
<div class="alert alert-error alert-danger">
<button type="button" class="close" data-dismiss="alert">&times;</button>
{{error }}
</div>
{% endif %}

<div class="contentpanel">
	{{ form.form_open }}
	
	<h4 class="heading4">{{ help_text }}</h4>
	<div class="registerbox form-horizontal">
		<fieldset>
		
		{%	for field_name,field in form.fields %}
		
			<div class="form-group">
				<label class="control-label col-sm-4">{{ _context['entry_' ~ field_name] }} </label>
				<div class="input-group col-sm-4">
				    {{ form.fields[field_name] }}
				</div>
			</div>		
		{% endfor %}
		</fieldset>
	</div>

	{{ _this.getHookVar('password_forgotten_sections') }}
	
	<div class="form-group">
	    <div class="col-sm-12">
	        <button class="btn btn-orange pull-right" title="{{ form.continue.name }}" type="submit">
	            <i class="fa fa-check"></i>
	            {{ form.continue.name }}
	        </button>
	        <a href="{{ back }}" class="btn btn-default mr10" title="{{ form.back.text }}">
	            <i class="fa fa-arrow-left"></i>
	            {{ form.back.text }}
	        </a>
	    </div>	
	</div>
	
	</form>
</div>
{{ footer }}