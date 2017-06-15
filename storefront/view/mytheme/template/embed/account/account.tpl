
{{ head }} 
<h1 class="heading1">
	<span class="maintext"><i class="fa fa-user"></i> {{ heading_title }} </span>
	<span class="subtext">{{ customer_name }} </span>
	{% if balance%}
	<span class="subtext">{{ balance }} </span>
	{% endif %}
</h1>

{% if success %} 
<div class="alert alert-success">
<button type="button" class="close" data-dismiss="alert">&times;</button>
{{ success }} 
</div>
{% endif %} 

{{ _this.getHookVar('account_top') }}

<ul class="nav-dash">
	<li>
	<a title="{{ text_information }} " data-toggle="tooltip" href="{{ information }} " data-original-title="{{ text_information }} ">
	<i class="fa fa-edit"></i>
	</a>
	</li>
	<li>
	<a title="{{ text_password }} " data-toggle="tooltip" href="{{ password }} " data-original-title="{{ text_password }} ">
	<i class="fa fa-key"></i>
	</a>
	</li>
	<li>
	<a title="{{ text_address }} " data-toggle="tooltip" href="{{ address }} " data-original-title="{{ text_address }} ">
	<i class="fa fa-book"></i> <span class="badge badge-success">{{ total_adresses }} </span>
	</a>
	</li>
	{{ _this.getHookVar('account_dash_icons') }}
	<li>
	<a title="{{ text_account_wishlist }} " data-toggle="tooltip" href="{{ wishlist }} " data-original-title="{{ text_account_wishlist }} ">
	<i class="fa fa-star"></i> <span class="badge badge-success">{{ total_wishlist }} </span>
	</a>
	</li>
	<li>
	<a title="{{ text_history }} " data-toggle="tooltip" href="{{ history }} " data-original-title="{{ text_history }} ">
	<i class="fa fa-briefcase"></i> <span class="badge badge-success">{{ total_orders }} </span>
	</a>
	</li>
	<li>
	<a title="{{ text_transactions }} " data-toggle="tooltip" href="{{ transactions }} " data-original-title="{{ text_transactions }} ">
	<i class="fa fa-money"></i> <span class="badge badge-success">{{ balance_amount }} </span>
	</a>
	</li>
	{{ _this.getHookVar('account_order_dash_icons') }}
	{% if config.get('config_download' ) %}
	<li>
	<a title="{{ text_download}} " data-toggle="tooltip" href="{{ download }} " data-original-title="{{ text_download }} ">
	<i class="fa fa-cloud-download"></i> <span class="badge badge-success">{{ total_downloads }} </span>
	</a>
	</li>
	{% endif %} 
	<li>
	<a title="{{ text_newsletter }} " data-toggle="tooltip" href="{{ newsletter }} " data-original-title="{{ text_newsletter }} ">
	<i class="fa fa-bullhorn"></i>
	</a>
	</li>
	{{ _this.getHookVar('account_newsletter_dash_icons') }}
	<li>
	<a title="{{ text_logout }} " data-toggle="tooltip" href="{{ logout }} " data-original-title="{{ text_logout }} ">
	<i class="fa fa-unlock"></i>
	</a>
	</li>
</ul>

<div class="dash-tiles row">
	<div class="col-md-3 col-sm-6">
	<a title="{{ text_address }} " data-toggle="tooltip" href="{{ address }} " data-original-title="{{ text_address }} ">
		<div class="dash-tile dash-tile-ocean clearfix">
			<div class="dash-tile-header">
			<div class="dash-tile-options">
			<div class="btn"><i class="fa fa-cog"></i></div>
			</div>
			{{ text_address }} 
			</div>
			<div class="dash-tile-icon"><i class="fa fa-book"></i></div>
			<div class="dash-tile-text">{{ total_adresses }} </div>
		</div>
	</a>	
	</div>
	<div class="col-md-3 col-sm-6">
	<a title="{{ text_history }} " data-toggle="tooltip" href="{{ history }} " data-original-title="{{ text_history }} ">
		<div class="dash-tile dash-tile-flower clearfix">
			<div class="dash-tile-header">
			<div class="dash-tile-options">
			<div class="btn"><i class="fa fa-cog"></i></div>
			</div>
			{{ text_history }} 
			</div>
			<div class="dash-tile-icon"><i class="fa fa-briefcase"></i></div>
			<div class="dash-tile-text">{{ total_orders }} </div>
		</div>
	</a>	
	</div>
	{% if config.get('config_download' ) %}
	<div class="col-md-3 col-sm-6">
	<a title="{{ text_download}} " data-toggle="tooltip" href="{{ download }} " data-original-title="{{ text_download }} ">
		<div class="dash-tile dash-tile-oil clearfix">
			<div class="dash-tile-header">
			<div class="dash-tile-options">
			<div class="btn"><i class="fa fa-cog"></i></div>
			</div>
			{{ text_download }} 
			</div>
			<div class="dash-tile-icon"><i class="fa fa-cloud-download"></i></div>
			<div class="dash-tile-text">{{ total_downloads }} </div>
		</div>
	</a>	
	</div>
	{% endif %}
	<div class="col-md-3 col-sm-6">
	<a title="{{ text_transactions }} " data-toggle="tooltip" href="{{ transactions }} " data-original-title="{{ text_transactions }} ">
		<div class="dash-tile dash-tile-balloon clearfix">
			<div class="dash-tile-header">
			<div class="dash-tile-options">
			<div class="btn"><i class="fa fa-cog"></i></div>
			</div>
			{{ text_transactions }} 
			</div>
			<div class="dash-tile-icon"><i class="fa fa-money"></i></div>
			<div class="dash-tile-text">{{ balance_amount }} </div>
		</div>
	</a>
	</div>
	{{ _this.getHookVar('account_sections') }}
</div>	

{{ _this.getHookVar('account_bottom') }}

{{ footer }} 