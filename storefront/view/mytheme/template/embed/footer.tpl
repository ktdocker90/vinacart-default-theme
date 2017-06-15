<script type="text/javascript" src="{{ templateResource('/javascript/easyzoom.js') }} "></script>
<script type="text/javascript" src="{{ templateResource('/javascript/jquery.validate.js') }} "></script>
<script type="text/javascript" defer src="{{ templateResource('/javascript/custom.response.js') }} "></script>

<!-- google analytics -->
{% if google_analytics %}
	{% set ga_data = registry.get('google_analytics_data') %}
	
	<script type="text/javascript">

		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', '{{ google_analytics }}']);
		_gaq.push(['_trackPageview']);

		{% if ga_data%}
		_gaq.push(['_set', 'currencyCode', '{{ ga_data.currency_code }}']);
		_gaq.push(['_addTrans',
			'{{ ga_data.transaction_id }}',
			'{{ ga_data.store_name }}',
			'{{ ga_data.total }}',
			'{{ ga_data.tax }}',
			'{{ ga_data.shipping }}',
			'{{ ga_data.city }}',
			'{{ ga_data.state }}',
			'{{ ga_data.country }}'
		]);
		_gaq.push(['_trackTrans']);
		{% endif %}

		(function () {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();

	</script>

{% endif %} 

{% for script in scripts_bottom %} 
	<script type="text/javascript" src="{{ script }} "></script>
 {% endfor %}

 {{ _this.getHookVar('vnc_footer') }}
 
</body>
</html>