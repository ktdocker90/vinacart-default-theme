
{{ head }} 
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-truck"></i> {{ heading_title }} </span>
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

	{{ form.form_open }}
	<h4 class="heading4">{{ text_shipping_address }} </h4>
	<div class="registerbox">
		<table class="table table-striped table-bordered">
		<tr>
			<td><address>{{ address }} </address></td>
			<td>
			<div class="form-group">
				<label class="control-label">{{ text_shipping_to }} </label>
				<div class="input-group">
					<a href="{{ change_address_href }} " class="btn btn-default mr10" title="{{ button_change_address}}">
					    <i class="fa fa-edit"></i>
					    {{ button_change_address }}
					</a>				
				</div>
			</div>									
			</td>
		</tr>
		</table>		
	</div>
		
	{% if shipping_methods  %} 			
	<h4 class="heading4">{{ text_shipping_method }} </h4>	
	<p>{{ text_shipping_methods }} </p>		
	<div class="registerbox">		
        <table class="table table-striped table-bordered">
        {% for shipping_method in shipping_methods %} 
          <tr>
            <td colspan="3"><b>{{ shipping_method.title }} </b></td>
          </tr>
          {% if not shipping_method.error %} 
          {% for quote in shipping_method.quote %} 
			  <tr>
				<td style="width: 5%">{{ quote.radio }} </td>
				<td>
				<label for="shipping_shipping_method{{ quote.id }} " title="{{ has_value(quote.description) ? quote.description : ''}} " style="cursor: pointer;">
				{% set icon = shipping_method.icon %}
				{% if  icon|length>0  %}
					{% if  is_file(constant('DIR_RESOURCE') ~ icon.image ) %}
						<span class="shipping_icon mr10"><img src="resources/{{ icon.image}} " title="{{ icon.title}}" /></span>
					{% elseif icon.resource_code is not empty %} 
						<span class="shipping_icon mr10">{{ icon.resource_code}} </span>
					{% endif %}
				{% endif %}
				{{ quote.title }} 
				</label>
				</td>
				<td class="align_right"><label for="shipping_shipping_method{{ quote.id }} " style="cursor: pointer;">{{ quote.text }} </label></td>
			  </tr>
          {% endfor %} 
          {% else %}   
          <tr>
            <td colspan="3"><div class="error">{{ shipping_method.error }} </div></td>
          </tr>
          {% endif %} 
         
        </table>
	</div>
	 {% endif %}

	{{ _this.getHookVar('shipping_extensions_hook') }}
	
	{{ _this.getHookVar('order_attributes') }}
	
	<div class="registerbox">		
		<div class="form-group">
    		<div class="col-md-12 mt20 mb20">
    			{{ _this.getHookVar('buttons_pre') }}
				{{ buttons }} 
				{{ _this.getHookVar('buttons_post') }}
    		</div>
		</div>
	</div>
	</form>
</div>
<script type="text/javascript"><!--

	$('input[name^=\'shipping_method\']').change(function () {
		$(this).closest('form').submit(); return false;
	});

//--></script>
{{ footer }} 