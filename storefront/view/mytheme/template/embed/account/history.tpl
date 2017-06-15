{{ head }}
<h1 class="heading1">
	<span class="maintext"><i class="fa fa-briefcase"></i> {{ heading_title }}</span>
	<span class="subtext"></span>
</h1>

<div class="contentpanel">

	{% for order in orders %}
		
	<div class="container-fluid mt20">
	    <div style="width: 49%; float: left; margin-bottom: 2px;"><b>{{ text_order }}</b>
	    	#{{ order.order_id }}</div>
	    <div style="width: 49%; float: right; margin-bottom: 2px; text-align: right;">
	    	<b>{{ text_status }}</b> {{ order.status }}</div>
	    <div class="content" style="clear: both; padding: 5px;">
	    	<div style="padding: 5px;">
	    		<table width="100%">
	    			<tr>
	    				<td>{{ text_date_added }} {{order.date_added }}</td>
	    				<td>{{ text_customer }} {{ order.name }}</td>
	    				<td rowspan="2" style="text-align: right;">{{ order.button }}</td>
	    			</tr>
	    			<tr>
	    				<td>{{ text_products }} {{order.products }}</td>
	    				<td>{{ text_total}} {{order.total }}</td>
	    			</tr>
	    		</table>
	    	</div>
	    </div>
	</div>
	{% endfor %}

	<div class="container-fluid">{{ pagination_bootstrap }}</div>

	<div class="container-fluid">
		<div class="col-md-12 mt20 pull-left">
		    <a href="{{ continue }}" class="btn btn-default mr10" title="{{button_back }}">
		    	<i class="fa fa-arrow-left"></i>
		    	{{button_back }}
		    </a>
		</div>
	</div>

</div>

<script type="text/javascript">
	function viewOrder(order_id) {
		location = '<?php echo $order_url; ?>&order_id=' + order_id;
	}
</script>
{{ footer }}