{{ head }}
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-edit"> </i>{{ heading_title }}</span>
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
{{error_warning }}
</div>
{% endif %}

{{ form.form_open }}
<div class="contentpanel">
	<table class="table table-striped notification-table">
		<thead>
			<tr>

				<th>{{ text_sendpoint }}</th>
				{% for protocol in protocols %}
					<th>{{ protocol.title }}</th>
				{% endfor %}
			</tr>
		</thead>
		<tbody>
		{% for sendpoint in form.fields.sendpoints %}
			<tr>
				<td>{{ sendpoint.title }}</td>
				{% for protocol in protocols  %}
					<td>{{ sendpoint.values[protocol.name]	}}</td>
				{% endfor %}


		{% endfor %}
		</tbody>

		{% if transactions|length %}
			{% for trn in transactions %}
		<tr>
			<td>{{ trn.customer_transaction_id }}</td>
			<td>{{ trn.date_added }}</td>
			<td>{{ trn.transaction_type }}</td>
			<td>{{ trn.debit }}</td>
			<td>{{ trn.credit }}</td>
			<td class="col-md-4">{{ trn.description }}</td>
		</tr>
		{{ _this.getHookVar('account_transactions_row_hook_var') }}
			{% endfor %}
		{% endif %}
	</table>

	
	<div class="form-group">
	    <div class="col-md-12">
	    	<button class="btn btn-orange pull-right" title="{{ form.continue.name }}" type="submit">
	    	    <i class="{{ form.continue.icon }} fa"></i>
	    	    {{ form.continue.name }}
	    	</button>
	    	<a href="{{ back }}" class="btn btn-default mr10" title="{{ form.back.text }}">
	    	    <i class="{{ form.back.icon }}"></i>
	    	    {{ form.back.text }}
	    	</a>
	    </div>
	</div>

</div>

</form>
{{ footer }}