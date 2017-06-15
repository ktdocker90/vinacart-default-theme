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

	<h4 class="heading4">{{ text_address_book }} </h4>
    {% for result in addresses %} 
    <div class="genericbox border-bottom">
      <table width="100%">	
        <tr>
          <td><address>{{ result.address }} </address></td>
          <td class="pull-right">
          	{{ result.button_edit }}
          		{% if  not result.default  %}
          			{{ result.button_delete }}
          		{% endif %}
          	</td>
        </tr>
      </table>
    </div>
    {% endfor %}

	<div class="col-md-12 col-xs-12 pull-right mt20 mb20">
		<a href="{{ back }} " class="btn btn-default mr10" title="{{ button_back.text}}">
		    <i class="{{ button_back.icon }}"></i>
		    {{ button_back.text}}
		</a>
		<a href="{{ insert }}  " class="btn btn-orange pull-right" title="{{ button_insert.text}}">
		    <i class="{{ button_insert.icon }}"></i>
		    {{ button_insert.text}}
		</a>
	</div>

</div>

{{ footer }} 