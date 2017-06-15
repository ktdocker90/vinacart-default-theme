{{ head }} 
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-money"></i> {{ heading_title }} </span>
  <span class="subtext"></span>
</h1>

<div class="contentpanel">
	<table class="table table-striped transaction-table">
	<thead>
	<tr>
		<th>{{ text_transaction_id }} </th>
		<th>{{ text_date_added }} </th>
		<th>{{ text_transaction_type }} </th>
		<th>{{ text_debit }} </th>
		<th>{{ text_credit }} </th>
		<th >{{ text_transaction_description }} </th>
	</tr>
	</thead>
	{% if transactions|length %} 
		{% for trn in transactions %}
		<tr>
			<td>{{ trn.customer_transaction_id}} </td>
			<td>{{ trn.date_added }} </td>
			<td>{{ trn.transaction_type }} </td>
			<td>{{ trn.debit }} </td>
			<td>{{ trn.credit }} </td>
			<td class="col-md-4">{{ trn.description }} </td>
		</tr>
		{% endfor %}
	{% endif %}  
	</table>

		{% if transactions|length <=0  %}
	
		<div>{{ text_error}} </div>
	
	{% endif %}
	

	<div class="pagination">{{ pagination_bootstrap }} </div>
	
</div>

<div class="container-fluid cart_total mt10">

	<div class="col-md-6 mt20 pull-left">
	    <a href="{{ continue }} " class="btn btn-default mr10" title="{{ button_back }} ">
	    	<i class="fa fa-arrow-left"></i>
	    	{{ button_back }}
	    </a>
	</div>

	<div class="col-md-6 cart-info totals pull-right">
	    <table class="table table-striped table-bordered">
	    	<tr>
	    		<td>
	    			<span class="extra bold totalamout">{{ text_total }} </span>
	    		</td>
	    		<td>
	    			<span class="bold totalamout">{{ balance_amount }} </span>
	    		</td>
	    	</tr>
	    </table>
	</div>
</div>

{{ footer }} 