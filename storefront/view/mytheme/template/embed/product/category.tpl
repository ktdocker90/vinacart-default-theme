{{ head }}
<h1 class="heading1">
  <span class="maintext">{{ heading_title }}</span>
  <span class="subtext"></span>
</h1>

	<div class="content container-fluid">

	{% if description %}
	<div style="margin-bottom: 15px;">{{ description }}</div>
	{% endif %}

	{% if not categories and not products %}
	<div class="content">{{ text_error }}</div>
	{% endif %}

	{% if categories %}
	<ul class="thumbnails row">
	    {% for i in range(0, categories|length) %}
	     <li class="col-md-2 col-sm-2 col-xs-6 align_center">
	    	<a href="{{categories[ i ].href }}">
	    		{{ categories[ i ].thumb.thumb_html }}
	    	</a>
	    	<div class="mt10 align_center" style="height: 40px;">
	    	<a href="{{ categories[ i ].href }}">{{ categories[ i ].name }}</a>
	    	</div>
	    </li>
	    {% endfor %}
	</ul>
	{% endif %}

	{% if products %}
	<div class="sorting well">
	  <form class=" form-inline pull-left">
	    {{ text_sort }}&nbsp;&nbsp;{{ sorting }}
	  </form>

	</div>

	{% include templateResource('/template/pages/product/product_listing.tpl') %}

	<div class="sorting well">
		{{ pagination_bootstrap }}
		<div class="btn-group pull-right">
		</div>
	</div>	
	{% endif %}

		
</div>

<script type="text/javascript">

$('#sort').change(function () {
	Resort();
});

function Resort() {
	url = '<?php echo $url; ?>';
	url += '&sort=' + $('#sort').val();
	url += '&limit=' + $('#limit').val();
	location = url;
}
</script>
{{ footer }}
