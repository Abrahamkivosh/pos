@extends('layouts.app')

@section('content')
<link rel="stylesheet" href="{{ asset('backend/assets/css/invoice.css?v=1.0') }}">
@include('layouts.others.invoice-css')
<div class="row">
	<div class="col-lg-8 offset-lg-2">
		@include('backend.user.invoice.action')
		@include('backend.user.invoice.template.loader')
	</div>
</div>
@endsection