{{ head }} 
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-thumbs-up"></i> {{ heading_title }} </span>
  <span class="subtext"></span>
</h1>

<div class="container-fluid">

<section class="mb40">
	<p>{{ text_message }} </p>
	
	<a href="{{ continue }} " class="btn btn-default mr10" title="{{ continue_button.text}}">
	    <i class="fa fa-arrow-right"></i>
	    {{ continue_button.text}}
	</a>
</section>

</div>
{{ footer }} 