<form method="post" class="ajax-screen-submit" autocomplete="off" action="{{ route('transactions.store') }}" enctype="multipart/form-data">
	{{ csrf_field() }}
	<div class="row px-2">
	    <div class="col-md-6">
			<div class="form-group">
				<label class="control-label">{{ _lang('Date') }}</label>						
				<input type="text" class="form-control datetimepicker" name="trans_date" value="{{ old('trans_date', now()) }}" required>
			</div>
		</div>
		
		@if(isset($_GET) && $_GET['type'] == 'income')
		<div class="col-md-6">
			<div class="form-group">
				<label class="control-label">{{ _lang('Income Category') }}</label>						
				<select class="form-control auto-select select2-ajax" data-selected="{{ old('transaction_category_id') }}" name="transaction_category_id"
				data-table="transaction_categories" data-value="id" data-display="name" data-where="4" data-title="{{ _lang('New Category') }}" 
				data-href="{{ route('transaction_categories.create') }}?type=income" required>
					<option value="">{{ _lang('Select One') }}</option>
				</select>
			</div>
		</div>
		<input type="hidden" name="type" value="income">
		@elseif(isset($_GET) && $_GET['type'] == 'expense')
		<div class="col-md-6">
			<div class="form-group">
				<label class="control-label">{{ _lang('Expense Category') }}</label>						
				<select class="form-control auto-select select2-ajax" data-selected="{{ old('transaction_category_id') }}" name="transaction_category_id"
				data-table="transaction_categories" data-value="id" data-display="name" data-where="5" data-title="{{ _lang('New Category') }}" 
				data-href="{{ route('transaction_categories.create') }}?type=expense" required>
					<option value="">{{ _lang('Select One') }}</option>
				</select>
			</div>
		</div>
		<input type="hidden" name="type" value="expense">
		@endif

		<div class="col-md-6">
			<div class="form-group">
				<label class="control-label">{{ _lang('Account') }}</label>	
				<select class="form-control auto-select select2-ajax" data-selected="{{ old('account_id') }}" name="account_id"
				data-table="accounts" data-value="id" data-display="account_name" data-divider=" - " data-display2="currency" data-where="3" data-title="{{ _lang('Add New Account') }}" 
				data-href="{{ route('accounts.create') }}" required>
					<option value="">{{ _lang('Select One') }}</option>
				</select>
			</div>
		</div>

		<div class="col-md-6">
			<div class="form-group">
				<label class="control-label">{{ _lang('Payment Method') }}</label>						
				<select class="form-control auto-select select2-ajax" data-selected="{{ old('method') }}" name="method"
				data-table="transaction_methods" data-value="name" data-display="name" data-where="8" data-title="{{ _lang('New Method') }}" 
				data-href="{{ route('transaction_methods.create') }}" required>
					<option value="">{{ _lang('Select One') }}</option>
				</select>
			</div>
		</div>

		<div class="col-md-6">
			<div class="form-group">
				<label class="control-label">{{ _lang('Amount') }}</label>	
				<input type="text" class="form-control float-field" name="amount" value="{{ old('amount') }}" aria-describedby="amount-addon" required>
			</div>
		</div>

		<div class="col-md-6">
			<div class="form-group">
				<label class="control-label">{{ _lang('Reference') }}</label>						
				<input type="text" class="form-control" name="reference" value="{{ old('reference') }}">
			</div>
		</div>

		<div class="col-md-12">
			<div class="form-group">
				<label class="control-label">{{ _lang('Description') }}</label>						
				<textarea class="form-control" name="description">{{ old('description') }}</textarea>
			</div>
		</div>

		<div class="col-md-12">
			<div class="form-group">
				<label class="control-label">{{ _lang('Attachment') }}</label></br>						
				<input type="file" class="dropify" name="attachment">
			</div>
		</div>
	
		<div class="col-md-12 mt-2">
		    <div class="form-group">
			    <button type="submit" class="btn btn-primary"><i class="ti-check-box mr-2"></i>{{ _lang('Submit') }}</button>
		    </div>
		</div>
	</div>
</form>
