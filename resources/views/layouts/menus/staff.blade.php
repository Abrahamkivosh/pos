<li><a href="{{ route('dashboard.index') }}"><i class="ti-dashboard"></i> <span>{{ _lang('Dashboard') }}</span></a></li>

@if(has_permission('customers.index'))
<li><a href="{{ route('customers.index')  }}"><i class="fas fa-user-friends"></i><span>{{ _lang('Customers') }}</span></a></li>
@endif

<li>
	<a href="javascript: void(0);"><i class="fas fa-box"></i><span>{{ _lang('Product & Services') }}</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
	<ul class="nav-second-level" aria-expanded="false">
		@if(has_permission('products.index'))
        <li class="nav-item"><a class="nav-link" href="{{ route('products.index') }}">{{ _lang('Product & Services') }}</a></li>
        @endif
		@if(has_permission('product_units.index'))
		<li class="nav-item"><a class="nav-link" href="{{ route('product_units.index') }}">{{ _lang('Product Units') }}</a></li>
		@endif
	</ul>
</li>

@if(has_permission('vendors.index'))
<li><a href="{{ route('vendors.index') }}"><i class="fas fa-user-friends"></i><span>{{ _lang('Vendors') }}</span></a></li>
@endif

<li>
	<a href="javascript: void(0);"><i class="fas fa-shopping-basket"></i><span>{{ _lang('Sales') }}</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
	<ul class="nav-second-level" aria-expanded="false">
		@if(has_permission('invoices.index'))
        <li class="nav-item"><a class="nav-link" href="{{ route('invoices.index') }}">{{ _lang('Invoices') }}</a></li>
		@endif

		@if(has_permission('quotations.index'))
        <li class="nav-item"><a class="nav-link" href="{{ route('quotations.index') }}">{{ _lang('Quotations') }}</a></li>
		@endif

		@if(has_permission('recurring_invoices.index'))
		@if(package()->recurring_invoice == 1)
        <li class="nav-item"><a class="nav-link" href="{{ route('recurring_invoices.index') }}">{{ _lang('Recurring Invoices') }}</a></li>
		@endif
		@endif
	</ul>
</li>

<li>
	<a href="javascript: void(0);"><i class="fas fa-shopping-bag"></i><span>{{ _lang('Purchases') }}</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
	<ul class="nav-second-level" aria-expanded="false">
		@if(has_permission('purchases.create'))
        <li class="nav-item"><a class="nav-link" href="{{ route('purchases.create') }}">{{ _lang('New Purchase') }}</a></li>
        @endif

		@if(has_permission('purchases.index'))
		<li class="nav-item"><a class="nav-link" href="{{ route('purchases.index') }}">{{ _lang('Purchase History') }}</a></li>
		@endif
	</ul>
</li>

@if(has_permission('invoice_templates.index'))
@if(package()->invoice_builder == 1)
<li><a href="{{ route('invoice_templates.index') }}"><i class="fas fa-palette"></i><span>{{ _lang('Invoice Templates') }}</span></a></li>
@endif
@endif

<li>
	<a href="javascript: void(0);"><i class="fas fa-university"></i><span>{{ _lang('Accounting') }}</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
	<ul class="nav-second-level" aria-expanded="false">
		@if(has_permission('accounts.index'))
        <li class="nav-item"><a class="nav-link" href="{{ route('accounts.index') }}">{{ _lang('Bank & Cash Accounts') }}</a></li>
        @endif

		@if(has_permission('transactions.index'))
		<li class="nav-item"><a class="nav-link" href="{{ route('transactions.index') }}">{{ _lang('Transactions') }}</a></li>
        @endif

		@if(has_permission('transaction_categories.index'))
		<li class="nav-item"><a class="nav-link" href="{{ route('transaction_categories.index') }}">{{ _lang('Transaction Categories') }}</a></li>
        @endif

		@if(has_permission('transaction_methods.index'))
		<li class="nav-item"><a class="nav-link" href="{{ route('transaction_methods.index') }}">{{ _lang('Transaction Methods') }}</a></li>
		@endif
	</ul>
</li>

<li>
	<a href="javascript: void(0);"><i class="far fa-chart-bar"></i><span>{{ _lang('Reports') }}</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
	<ul class="nav-second-level" aria-expanded="false">
		@if(has_permission('reports.account_balances'))
		<li class="nav-item"><a class="nav-link" href="{{ route('reports.account_balances') }}">{{ _lang('Account Balances') }}</a></li>
		@endif

		@if(has_permission('reports.account_statement'))
		<li class="nav-item"><a class="nav-link" href="{{ route('reports.account_statement') }}">{{ _lang('Account Statement') }}</a></li>
		@endif

		@if(has_permission('reports.profit_and_loss'))
		<li class="nav-item"><a class="nav-link" href="{{ route('reports.profit_and_loss') }}">{{ _lang('Profit & Loss Report') }}</a></li>
		@endif

		@if(has_permission('reports.transactions_report'))
		<li class="nav-item"><a class="nav-link" href="{{ route('reports.transactions_report') }}">{{ _lang('Transaction Report') }}</a></li>
		@endif

		@if(has_permission('reports.income_by_customer'))
		<li class="nav-item"><a class="nav-link" href="{{ route('reports.income_by_customer') }}">{{ _lang('Income by Customer') }}</a></li>
		@endif

		@if(has_permission('reports.purchase_by_vendor'))
		<li class="nav-item"><a class="nav-link" href="{{ route('reports.purchase_by_vendor') }}">{{ _lang('Purchases by Vendor') }}</a></li>
        @endif

		@if(has_permission('reports.tax_report'))
		<li class="nav-item"><a class="nav-link" href="{{ route('reports.tax_report') }}">{{ _lang('Tax Report') }}</a></li>
		@ENDIF
	</ul>
</li>