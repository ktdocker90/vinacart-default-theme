
{{ head }} 
<h1 class="heading1">
	<span class="maintext"><i class="fa fa-cloud-download"></i> {{ heading_title }} </span>
	<span class="subtext"></span>
</h1>

<div class="contentpanel">

	{% for download in downloads %} 
		<div class="container-fluid mt20">
			<div style="width: 45%; float: left; margin-bottom: 2px;">
				<b>{{ text_order }} </b> {{ download.order_id }} </div>
			<div style="width: 45%; float: right; margin-bottom: 2px; text-align: right;">
				<b>{{ text_size }} </b> {{ download.size }} </div>
			<div class="content" style="clear: both;">
				<div style="padding: 5px;">
					<table class="download-list">
						<tr>
							<td style="width: 40%"><div>{{ download.thumbnail.thumb_html }} </div>
								<div>{{ text_name~' '~ download.name }}
									{% if download.attributes%}
									
									<br><div class="download-list-attributes">
										{% for name, value in download.attributes %}
											<small>- {{name}} {{ value is iterable ? value|join(' ') : value }}</small>
										{% endfor %}
									</div>
									{% endif %} 
								<br>{{ text_date_added}}  {{ download.date_added }} </div>
							</td>
							<td style="width: 20%">{% if download.remaining %} {{ text_remaining }}  {{ download.remaining }} {% endif %}</td>
							<td style="width: 20%">{% if download.expire_date %} {{ text_expire_date }}  {{ download.expire_date }}{% endif %} </td>
							<td rowspan="2" >
							{% if download.text %} 
								<a class="btn btn-primary disabled">
		    				    <i class="fa fa-download"></i>
		    		    		{{ download.text }} 
								</a>
							{% else %}   
								<a href="{{ download.button.href }}" class="btn btn-primary">
		    				    <i class="fa fa-download"></i>
		    		    		{{ download.button.text }}
								</a>
							{% endif %} 
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	 {% endfor %}

	<div class="container-fluid">{{ pagination_bootstrap }} </div>

	<div class="container-fluid">
		<div class="col-md-12 mt20">
			<a href="{{ button_continue.href}}" class="btn btn-default pull-right">
	    		    <i class="fa fa-arrow-right"></i>
	    		    {{ button_continue.text}}
			</a>
		</div>
	</div>

</div>
{{ footer }} 