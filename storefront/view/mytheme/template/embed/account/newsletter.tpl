
{{ head }} 
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-bullhorn"></i> {{ heading_title }} </span>
  <span class="subtext"></span>
</h1>

<div class="contentpanel">
	{{ form.form_open }} 
	
	<div class="registerbox form-horizontal">
		<fieldset>
			<div class="form-group">
				<label class="control-label col-sm-4">{{ entry_newsletter }} </label>
				<div class="input-group col-sm-4">
				    {{ form.newsletter }} 
				</div>
			</div>		
		</fieldset>
	</div>

	{{ _this.getHookVar('newsletter_edit_sections') }}
	
	<div class="form-group">
	    <div class="col-md-12">
	    	<button class="btn btn-orange pull-right" title="{{ form.continue.name}}" type="submit">
	    	    <i class="{{ form.continue.icon }} fa"></i>
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