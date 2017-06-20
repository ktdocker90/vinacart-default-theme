{{ head }}
<h1 class="heading1">
  <span class="maintext"><i class="fa fa-lock"></i> {{ heading_title }}</span>
  <span class="subtext"></span>
</h1>

{% if success %}
<div class="alert alert-success">
<button type="button" class="close" data-dismiss="alert">&times;</button>
{{ success }}
</div>
{% endif %}

{% if error %}
<div class="alert alert-error alert-danger">
<button type="button" class="close" data-dismiss="alert">&times;</button>
{{ error }}
</div>
{% endif %}

<div class="contentpanel">

<div class="col-sm-6 newcustomer">
	<h2 class="heading2">{{ text_i_am_new_customer }}</h2>
	<div class="loginbox">
		<h4 class="heading4">{{ text_checkout }}</h4>
		{{ form1.form_open }}
		<fieldset>
			<div class="form-group mt20">
		      {{ form1.register }}
			</div>
		{% if guest_checkout %}
			<div class="form-group mt20">
		      {{ form1.guest }}
			</div>
		{% endif %}
			<div class="form-group mt20 mb40">
		      {{ text_create_account }}
			</div>
			<button type="submit" class="btn btn-orange pull-right"  title="{{ form1.continue.name }}">
				<i class="{{ form1.continue.icon }} fa"></i>
				{{ form1.continue.name }}
			</button>
		</fieldset>
		</form>
	</div>
</div> 

<div class="col-sm-6 returncustomer">
	<h2 class="heading2">{{ text_returning_customer }}</h2>
	<div class="loginbox">
		<h4 class="heading4">{{ text_i_am_returning_customer }}</h4>
		{{ form2.form_open }}
			<fieldset>
				<div class="form-group">
				  <label class="control-label col-sm-4">
				  
				  	{% if  noemaillogin %}
				  		{{ entry_loginname }}
				  	{% else %}
				  		{{entry_email_address}}
				  	{% endif %}
				  
				  </label>
				  <div class="input-group col-sm-5">
					{{ form2.loginname }}
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-4">{{entry_password }}</label>
				  <div class="input-group col-sm-5">
					{{ form2.password }}
				  </div>
				</div>
				<a href="{{ forgotten_pass }}">{{text_forgotten_password}}</a>
				{% if noemaillogin %}
					&nbsp;&nbsp;<a href="{{ forgotten_login }}">{{ text_forgotten_login }}</a>
				{% endif %}
				<br>
				<br>
				<button type="submit" class="btn btn-orange pull-right"  title="{{ form2.login_submit.name }}">
					<i class="{{ form2.login_submit.icon }}"></i>
					{{ form2.login_submit.name }}
				</button>
			</fieldset>
		</form>
	</div>
	{{ _this.getHookVar('login_extension') }}
</div> 

</div>
{{ footer }}