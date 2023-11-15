<form method="post" class="ajax-screen-submit" autocomplete="off" action="{{ route('features.update', $id) }}" enctype="multipart/form-data">
	{{ csrf_field()}}
	<input name="_method" type="hidden" value="PATCH">
	<div class="row px-2">
		<div class="col-md-12">
			<div class="form-group">
				<label class="control-label">{{ _lang('Bootstrap Icon') }}</label>
				<a href="https://icons.getbootstrap.com/" class="float-right" target="_blank">{{ _lang('BROWSE ICONS') }}</a>
				<input type="text" class="form-control" name="icon" value="{{ $feature->icon }}" required>
			</div>
		</div>

		<div class="col-md-12">
			<div class="form-group">
				<label class="control-label">{{ _lang('Title') }}</label>
				<input type="text" class="form-control" name="trans[title]" value="{{ $feature->translation->title }}" required>
			</div>
		</div>

		<div class="col-md-12">
			<div class="form-group">
				<label class="control-label">{{ _lang('Description') }}</label>
				<textarea class="form-control" name="trans[content]" rows="8" required>{{ $feature->translation->content }}</textarea>
			</div>
		</div>

		<div class="col-md-6">
			<div class="form-group">
				<label class="control-label">{{ _lang('Status') }}</label>
				<select class="form-control auto-select" data-selected="{{ $feature->status }}" name="status" required>
					<option value="1">{{ _lang('Active') }}</option>
					<option value="0">{{ _lang('Deactivate') }}</option>
				</select>
			</div>
		</div>

		<div class="col-md-6">
			<div class="form-group">
				<label class="control-label">{{ _lang('Language') }}</label>
				<select class="form-control" name="model_language" required>
					{{ load_language(get_language()) }}
				</select>
			</div>
		</div>

		<div class="col-md-12 mt-2">
			<div class="form-group">
			    <button type="submit" class="btn btn-primary "><i class="ti-check-box mr-2"></i>{{ _lang('Update') }}</button>
		    </div>
		</div>
	</div>
</form>

