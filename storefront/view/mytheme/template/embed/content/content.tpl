{{ head }} 
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-list"></i> {{ heading_title }} </span>
  <span class="subtext"></span>
</h1>

<div class="contentpanel">
	<h4 class="heading4">{{ description }} </h4>

	<div class="content">
	  <div class="row">
	    <div class="col-md-12 pull-left">
		{{ _this.getHookVar('pre_content') }}
		{{ content }} 
		{{ _this.getHookVar('post_content') }}
	    </div>
	  </div>
	</div>

	<a href="{{ continue }} " class="btn btn-default pull-right mr10  mb10" title="">
		<i class="fa fa-arrow-right"></i>
		{{ button_continue.text}}
	</a>
	{{ _this.getHookVar('post_content_button') }}

</div>
{{ footer }} 