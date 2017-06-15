{{ head }} 
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-envelope"></i> {{ heading_title }} </span>
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

<div class="content container-fluid mr20 ml20">
	<h4 class="heading4">{{ text_edit_address }} </h4>

	<div class="content-fluid">
	  <div class="row">
	    <div class="col-sm-6 col-md-6 pull-left">
	    <b>{{ text_address }} </b><br />
	      {{ store }} <br />
	      <address>{{ address }} </address>
	    </div>
	    <div class="col-sm-6 col-md-6 pull-right">
	      {% if telephone %} 
	      <b>{{ text_telephone }} </b><br />
	      {{ telephone }} <br />
	      <br />
	      {% endif %} 
	      
	      {% if fax %} 
	      <b>{{ text_fax }} </b><br />
	      {{ fax }} 
	      {% endif %} 
	    </div>
	  </div>

	  <div class="row mt40">
	  {{ form_output }} 
	  </div>
	</div>

</div>
{{ footer }} 