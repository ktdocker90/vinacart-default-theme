<a href="{{ back }} " class="btn btn-default mr10 pull-left" title="{{ form.back.text}}">
	<i class="fa fa-arrow-left"></i>
	{{ form.back.text}}
</a>
<button class="btn btn-orange pull-right ml10" title="{{ form.continue.name}}" type="submit">
	<i class="fa fa-arrow-right"></i>
	{{ form.continue.name}}
</button>

{% if text_agree %} 
<label class="checkbox pull-right">
	{{ form.agree }} 
	{{ text_agree }}  <a class="mr10" href="{{ text_agree_href }} " onclick="openModalRemote('#returnPolicyModal', '{{ text_agree_href }} '); return false;"><b>{{ text_agree_href_text }} </b></a>
</label>


<div id="returnPolicyModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="returnPolicyModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="returnPolicyModalLabel">{{ text_agree_href_text }} </h3>
	</div>
	<div class="modal-body">
	</div>
	<div class="modal-footer">
		<button class="btn default" data-dismiss="modal" aria-hidden="true">{{ text_close }} </button>
	</div>
</div>
</div>  
</div>
{% endif %} 
