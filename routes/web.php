<?php

use App\Http\Controllers\BusinessTypeController;
use App\Http\Controllers\CurrencyController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\EmailSubscriberController;
use App\Http\Controllers\FaqController;
use App\Http\Controllers\FeatureController;
use App\Http\Controllers\LanguageController;
use App\Http\Controllers\MembershipController;
use App\Http\Controllers\NotificationTemplateController;
use App\Http\Controllers\PackageController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\PaymentGatewayController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SubscriptionPaymentController;
use App\Http\Controllers\TeamController;
use App\Http\Controllers\TestimonialController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\User\AccountController;
use App\Http\Controllers\User\BusinessController;
use App\Http\Controllers\User\BusinessSettingsController;
use App\Http\Controllers\User\CustomerController;
use App\Http\Controllers\User\InvoiceController;
use App\Http\Controllers\User\InvoiceTemplateController;
use App\Http\Controllers\User\OnlinePaymentController;
use App\Http\Controllers\User\PermissionController;
use App\Http\Controllers\User\ProductController;
use App\Http\Controllers\User\ProductUnitController;
use App\Http\Controllers\User\PurchaseController;
use App\Http\Controllers\User\QuotationController;
use App\Http\Controllers\User\RecurringInvoiceController;
use App\Http\Controllers\User\ReportController;
use App\Http\Controllers\User\RoleController;
use App\Http\Controllers\User\SystemUserController;
use App\Http\Controllers\User\TaxController;
use App\Http\Controllers\User\TransactionCategoryController;
use App\Http\Controllers\User\TransactionController;
use App\Http\Controllers\User\TransactionMethodController;
use App\Http\Controllers\User\VendorController;
use App\Http\Controllers\UtilityController;
use App\Http\Controllers\Website\WebsiteController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */


$ev = env('APP_INSTALLED', true) == true ? get_option('email_verification', 0) : 0;

Route::group(['middleware' => ['install']], function () use ($ev) {

	Auth::routes(['verify' => $ev == 1 ? true : false]);
	Route::get('/logout', 'Auth\LoginController@logout');

	$initialMiddleware = ['auth', 'saas'];
	if ($ev == 1) {
		array_push($initialMiddleware, 'verified');
	}

	Route::group(['middleware' => $initialMiddleware], function () {

		Route::get('dashboard', [DashboardController::class, 'index'])->name('dashboard.index');

		//Profile Controller
		Route::get('profile', [ProfileController::class, 'index'])->name('profile.index');
		Route::get('profile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
		Route::post('profile/update', [ProfileController::class, 'update'])->name('profile.update')->middleware('demo');
		Route::get('profile/change_password', [ProfileController::class, 'change_password'])->name('profile.change_password');
		Route::post('profile/update_password', [ProfileController::class, 'update_password'])->name('profile.update_password')->middleware('demo');
		Route::get('profile/notification_mark_as_read/{id}', [ProfileController::class, 'notification_mark_as_read'])->name('profile.notification_mark_as_read');
		Route::get('profile/show_notification/{id}', [ProfileController::class, 'show_notification'])->name('profile.show_notification');
		Route::get('membership/active_subscription', [MembershipController::class, 'index'])->name('membership.index');

		/** Admin Only Route **/
		Route::group(['middleware' => ['admin'], 'prefix' => 'admin'], function () {

			//User Management
			Route::get('users/{id}/login_as_user', [UserController::class, 'login_as_user'])->name('users.login_as_user');
			Route::get('users/get_table_data', [UserController::class, 'get_table_data']);
			Route::resource('users', UserController::class)->middleware("demo:PUT|PATCH|DELETE");

			//Subscription Payments
			Route::get('subscription_payments/get_table_data', [SubscriptionPaymentController::class, 'get_table_data']);
			Route::resource('subscription_payments', SubscriptionPaymentController::class)->except([
				'show', 'destroy',
			])->middleware("demo:PUT|PATCH|DELETE");

			Route::group(['middleware' => 'demo'], function () {
				//Package Controller
				Route::resource('packages', PackageController::class);

				//Payment Gateways
				Route::resource('payment_gateways', PaymentGatewayController::class)->except([
					'create', 'store', 'show', 'destroy',
				]);

				//Email Subscribers
				Route::match (['get', 'post'], 'email_subscribers/send_email', [EmailSubscriberController::class, 'send_email'])->name('email_subscribers.send_email');
				Route::get('email_subscribers/export', [EmailSubscriberController::class, 'export'])->name('email_subscribers.export');
				Route::get('email_subscribers/get_table_data', [EmailSubscriberController::class, 'get_table_data']);
				Route::get('email_subscribers', [EmailSubscriberController::class, 'index'])->name('email_subscribers.index');
				Route::delete('email_subscribers/{id}/destroy', [EmailSubscriberController::class, 'destroy'])->name('email_subscribers.destroy');

				//Page Controller
				Route::post('pages/store_default_pages/{slug?}', [PageController::class, 'store_default_pages'])->name('pages.default_pages.store');
				Route::get('pages/default_pages/{slug?}', [PageController::class, 'default_pages'])->name('pages.default_pages');
				Route::resource('pages', PageController::class)->except('show');

				//FAQ Controller
				Route::resource('faqs', FaqController::class)->except('show');

				//Features Controller
				Route::resource('features', FeatureController::class)->except('show');

				//Testimonial Controller
				Route::resource('testimonials', TestimonialController::class)->except('show');

				//Team Controller
				Route::resource('posts', PostController::class)->except('show');

				//Team Controller
				Route::resource('teams', TeamController::class)->except('show');

				//Business Type Controller
				Route::resource('business_types', BusinessTypeController::class)->except('show');

				//Currency List
				Route::resource('currency', CurrencyController::class);

				//Language Controller
				Route::get('languages/{lang}/edit_website_language', [LanguageController::class, 'edit_website_language'])->name('languages.edit_website_language');
				Route::resource('languages', LanguageController::class);

				//Utility Controller
				Route::match (['get', 'post'], 'administration/general_settings/{store?}', [UtilityController::class, 'settings'])->name('settings.update_settings');
				Route::post('administration/upload_logo', [UtilityController::class, 'upload_logo'])->name('settings.uplaod_logo');
				Route::get('administration/database_backup_list', [UtilityController::class, 'database_backup_list'])->name('database_backups.list');
				Route::get('administration/create_database_backup', [UtilityController::class, 'create_database_backup'])->name('database_backups.create');
				Route::delete('administration/destroy_database_backup/{id}', [UtilityController::class, 'destroy_database_backup'])->name('database_backups.destroy');
				Route::get('administration/download_database_backup/{id}', [UtilityController::class, 'download_database_backup'])->name('database_backups.download');
				Route::post('administration/remove_cache', [UtilityController::class, 'remove_cache'])->name('settings.remove_cache');
				Route::post('administration/send_test_email', [UtilityController::class, 'send_test_email'])->name('settings.send_test_email');

				//Notification Template
				Route::resource('notification_templates', NotificationTemplateController::class)->only([
					'index', 'edit', 'update',
				]);
			});

		});

		/** Subscriber Login **/
		Route::group(['middleware' => ['business'], 'prefix' => 'user'], function () {

			//Business Controller
			Route::get('business/{id}/users', [BusinessController::class, 'users'])->name('business.users');
			Route::resource('business', BusinessController::class)->except('show');

			//Permission Controller
			Route::get('roles/{role_id?}/access_control', [PermissionController::class, 'show'])->name('permission.show');
			Route::post('permission/store', [PermissionController::class, 'store'])->name('permission.store');
			Route::resource('roles', RoleController::class)->except('show');

			//User Controller
			Route::match (['get', 'post'], 'system_users/{userId}/{businessId}/change_role', [SystemUserController::class, 'change_role'])->name('system_users.change_role');
			Route::post('system_users/send_invitation', [SystemUserController::class, 'send_invitation'])->name('system_users.send_invitation');
			Route::delete('system_users/{id}/destroy', [SystemUserController::class, 'destroy'])->name('system_users.destroy');
			Route::get('system_users/invite/{businessId}', [SystemUserController::class, 'invite'])->name('system_users.invite');
			Route::get('system_users/{businessId}/invitation_history', [SystemUserController::class, 'invitation_history'])->name('invitation_history.index');
			Route::delete('invitation_history/{businessId}/destroy_invitation', [SystemUserController::class, 'destroy_invitation'])->name('invitation_history.destroy_invitation');

			//Business Settings Controller
			Route::post('business/{id}/send_test_email', [BusinessSettingsController::class, 'send_test_email'])->name('business.send_test_email');
			Route::post('business/{id}/store_email_settings', [BusinessSettingsController::class, 'store_email_settings'])->name('business.store_email_settings');
			Route::post('business/{id}/store_payment_gateway_settings', [BusinessSettingsController::class, 'store_payment_gateway_settings'])->name('business.store_payment_gateway_settings');
			Route::post('business/{id}/store_invoice_settings', [BusinessSettingsController::class, 'store_invoice_settings'])->name('business.store_invoice_settings');
			Route::post('business/{id}/store_currency_settings', [BusinessSettingsController::class, 'store_currency_settings'])->name('business.store_currency_settings');
			Route::post('business/{id}/store_general_settings', [BusinessSettingsController::class, 'store_general_settings'])->name('business.store_general_settings');
			Route::get('business/{id}/settings', [BusinessSettingsController::class, 'settings'])->name('business.settings');
		});

		/** Dynamic Permission **/
		Route::group(['middleware' => ['permission'], 'prefix' => 'user'], function () {

			//Dashboard Widget
			Route::get('dashboard/current_month_income_widget', 'DashboardController@current_month_income_widget')->name('dashboard.current_month_income_widget');
			Route::get('dashboard/current_month_expense_widget', 'DashboardController@current_month_expense_widget')->name('dashboard.current_month_expense_widget');
			Route::get('dashboard/due_invoice_amount_widget', 'DashboardController@due_invoice_amount_widget')->name('dashboard.due_invoice_amount_widget');
			Route::get('dashboard/due_purchase_amount_widget', 'DashboardController@due_purchase_amount_widget')->name('dashboard.due_purchase_amount_widget');
			Route::get('dashboard/cashflow_widget', 'DashboardController@cashflow_widget')->name('dashboard.cashflow_widget');
			Route::get('dashboard/account_balance_widget', 'DashboardController@account_balance_widget')->name('dashboard.account_balance_widget');
			Route::get('dashboard/income_by_category_widget', 'DashboardController@income_by_category_widget')->name('dashboard.income_by_category_widget');
			Route::get('dashboard/expense_by_category_widget', 'DashboardController@expense_by_category_widget')->name('dashboard.expense_by_category_widget');
			Route::get('dashboard/recent_transaction_widget', 'DashboardController@recent_transaction_widget')->name('dashboard.recent_transaction_widget');

			//Customers
			Route::get('customers/get_table_data', [CustomerController::class, 'get_table_data']);
			Route::resource('customers', CustomerController::class);

			//Vendors
			Route::get('vendors/get_table_data', [VendorController::class, 'get_table_data']);
			Route::resource('vendors', VendorController::class);

			//Product Controller
			Route::resource('product_units', ProductUnitController::class)->except('show');
			Route::get('products/getProducts/{type}', [ProductController::class, 'getProducts']);
			Route::get('products/getProduct/{id}', [ProductController::class, 'getProduct']);
			Route::get('products/get_table_data', [ProductController::class, 'get_table_data']);
			Route::resource('products', ProductController::class);

			//Invoices
			Route::match (['get', 'post'], 'invoices/{id}/send_email', [InvoiceController::class, 'send_email'])->name('invoices.send_email');
			Route::match (['get', 'post'], 'invoices/{id}/add_payment', [InvoiceController::class, 'add_payment'])->name('invoices.add_payment');
			Route::get('invoices/{id}/duplicate', [InvoiceController::class, 'duplicate'])->name('invoices.duplicate');
			Route::get('invoices/{id}/get_invoice_link', [InvoiceController::class, 'get_invoice_link'])->name('invoices.get_invoice_link');
			Route::get('invoices/{id}/export_pdf', [InvoiceController::class, 'export_pdf'])->name('invoices.export_pdf');
			Route::get('invoices/{id}/approve', [InvoiceController::class, 'approve'])->name('invoices.approve');
			Route::post('invoices/get_table_data', [InvoiceController::class, 'get_table_data']);
			Route::resource('invoices', InvoiceController::class);

			//Recurring Invoice
			Route::get('recurring_invoices/{id}/convert_recurring', [RecurringInvoiceController::class, 'convert_recurring'])->name('recurring_invoices.convert_recurring');
			Route::get('recurring_invoices/{id}/end_recurring', [RecurringInvoiceController::class, 'end_recurring'])->name('recurring_invoices.end_recurring');
			Route::get('recurring_invoices/{id}/duplicate', [RecurringInvoiceController::class, 'duplicate'])->name('recurring_invoices.duplicate');
			Route::get('recurring_invoices/{id}/approve', [RecurringInvoiceController::class, 'approve'])->name('recurring_invoices.approve');
			Route::post('recurring_invoices/get_table_data', [RecurringInvoiceController::class, 'get_table_data']);
			Route::resource('recurring_invoices', RecurringInvoiceController::class);

			//Quotation
			Route::match (['get', 'post'], 'quotations/{id}/send_email', [QuotationController::class, 'send_email'])->name('quotations.send_email');
			Route::get('quotations/{id}/convert_to_invoice', [QuotationController::class, 'convert_to_invoice'])->name('quotations.convert_to_invoice');
			Route::get('quotations/{id}/duplicate', [QuotationController::class, 'duplicate'])->name('quotations.duplicate');
			Route::get('quotations/{id}/get_quotation_link', [QuotationController::class, 'get_quotation_link'])->name('quotations.get_quotation_link');
			Route::get('quotations/{id}/export_pdf', [QuotationController::class, 'export_pdf'])->name('quotations.export_pdf');
			Route::post('quotations/get_table_data', [QuotationController::class, 'get_table_data']);
			Route::resource('quotations', QuotationController::class);

			//Purchase
			Route::match (['get', 'post'], 'purchases/{id}/add_payment', [PurchaseController::class, 'add_payment'])->name('purchases.add_payment');
			Route::get('purchases/{id}/duplicate', [PurchaseController::class, 'duplicate'])->name('purchases.duplicate');
			Route::post('purchases/get_table_data', [PurchaseController::class, 'get_table_data']);
			Route::resource('purchases', PurchaseController::class);

			//Accounts
			Route::get('accounts/{accountId}/{amount}/convert_due_amount', [AccountController::class, 'convert_due_amount']);
			Route::resource('accounts', AccountController::class);

			//Custom Invoice Template
			Route::get('invoice_templates/{id}/clone', [InvoiceTemplateController::class, 'clone'])->name('invoice_templates.clone');
			Route::get('invoice_templates/element/{element}', [InvoiceTemplateController::class, 'get_element']);
			Route::resource('invoice_templates', InvoiceTemplateController::class);

			//Transaction Categories
			Route::resource('transaction_categories', TransactionCategoryController::class)->except('show');

			//Transaction
			Route::get('transactions/get_table_data', [TransactionController::class, 'get_table_data']);
			Route::resource('transactions', TransactionController::class);

			//Transaction Methods
			Route::resource('transaction_methods', TransactionMethodController::class)->except('view');

			//Taxes
			Route::resource('taxes', TaxController::class);

			//Report Controller
			Route::get('reports/account_balances', [ReportController::class, 'account_balances'])->name('reports.account_balances');
			Route::match (['get', 'post'], 'reports/account_statement', [ReportController::class, 'account_statement'])->name('reports.account_statement');
			Route::match (['get', 'post'], 'reports/profit_and_loss', [ReportController::class, 'profit_and_loss'])->name('reports.profit_and_loss');
			Route::match (['get', 'post'], 'reports/transactions_report', [ReportController::class, 'transactions_report'])->name('reports.transactions_report');
			Route::match (['get', 'post'], 'reports/income_by_customer', [ReportController::class, 'income_by_customer'])->name('reports.income_by_customer');
			Route::match (['get', 'post'], 'reports/purchase_by_vendor', [ReportController::class, 'purchase_by_vendor'])->name('reports.purchase_by_vendor');
			Route::match (['get', 'post'], 'reports/tax_report', [ReportController::class, 'tax_report'])->name('reports.tax_report');
		});

		//Switch Business
		Route::get('business/switch_business/{id}', [BusinessController::class, 'switch_business'])->name('business.switch_business');

		//Ajax Select2 Controller
		Route::get('ajax/get_table_data', 'Select2Controller@get_table_data');

	});

	Route::get('users/back_to_admin', [UserController::class, 'back_to_admin'])->name('users.back_to_admin')->middleware('auth');

	Route::get('switch_language/', function () {
		if (isset($_GET['language'])) {
			session(['language' => $_GET['language']]);
			return back();
		}
	})->name('switch_language');

	//Frontend Website
	Route::get('/about', [WebsiteController::class, 'about']);
	Route::get('/features', [WebsiteController::class, 'features']);
	Route::get('/pricing', [WebsiteController::class, 'pricing']);
	Route::get('/faq', [WebsiteController::class, 'faq']);
	Route::get('/blogs/{slug?}', [WebsiteController::class, 'blogs']);
	Route::get('/contact', [WebsiteController::class, 'contact']);
	Route::post('/send_message', 'Website\WebsiteController@send_message');
	Route::post('/post_comment', 'Website\WebsiteController@post_comment');
	Route::post('/email_subscription', 'Website\WebsiteController@email_subscription');

	if (env('APP_INSTALLED', true)) {
		Route::get('/{slug?}', [WebsiteController::class, 'index']);
	} else {
		Route::get('/', function () {
			echo "Installation";
		});
	}

});

//Online Invoice Payment
Route::group(['prefix' => 'callback', 'namespace' => 'User\Gateway'], function () {
	Route::get('paypal', 'PayPal\ProcessController@callback')->name('callback.PayPal');
	Route::post('stripe', 'Stripe\ProcessController@callback')->name('callback.Stripe');
	Route::post('razorpay', 'Razorpay\ProcessController@callback')->name('callback.Razorpay');
	Route::get('paystack', 'Paystack\ProcessController@callback')->name('callback.Paystack');
	Route::get('flutterwave', 'Flutterwave\ProcessController@callback')->name('callback.Flutterwave');
	Route::get('mollie', 'Mollie\ProcessController@callback')->name('callback.Mollie');
	Route::match (['get', 'post'], 'instamojo', 'Instamojo\ProcessController@callback')->name('callback.Instamojo');
});

//Subscription Payment
Route::group(['prefix' => 'subscription_callback', 'namespace' => 'User\SubscriptionGateway'], function () {
	Route::get('paypal', 'PayPal\ProcessController@callback')->name('subscription_callback.PayPal');
	Route::post('stripe', 'Stripe\ProcessController@callback')->name('subscription_callback.Stripe');
	Route::post('razorpay', 'Razorpay\ProcessController@callback')->name('subscription_callback.Razorpay');
	Route::get('paystack', 'Paystack\ProcessController@callback')->name('subscription_callback.Paystack');
	Route::get('flutterwave', 'Flutterwave\ProcessController@callback')->name('subscription_callback.Flutterwave');
	Route::get('mollie', 'Mollie\ProcessController@callback')->name('subscription_callback.Mollie');
	Route::match (['get', 'post'], 'instamojo', 'Instamojo\ProcessController@callback')->name('subscription_callback.Instamojo');
});

//Accept Invitation
Route::get('system_users/accept_invitation/{id}', [SystemUserController::class, 'accept_invitation'])->name('system_users.accept_invitation');

//Membership Subscription
Route::get('membership/packages', [MembershipController::class, 'packages'])->name('membership.packages')->middleware('auth');
Route::post('membership/choose_package', [MembershipController::class, 'choose_package'])->name('membership.choose_package')->middleware('auth');
Route::get('membership/payment_gateways', [MembershipController::class, 'payment_gateways'])->name('membership.payment_gateways')->middleware('auth');
Route::get('membership/make_payment/{gateway}', [MembershipController::class, 'make_payment'])->name('membership.make_payment')->middleware('auth');

//Public Invoice VIew
Route::get('invoice/make_payment/{short_code}/{gateway}', [OnlinePaymentController::class, 'make_payment'])->name('invoices.make_payment');
Route::get('invoice/payment_methods/{short_code}', [OnlinePaymentController::class, 'payment_methods'])->name('invoices.payment_methods');
Route::get('invoice/{short_code}/{export?}', [InvoiceController::class, 'show_public_invoice'])->name('invoices.show_public_invoice');

//Public Quotation VIew
Route::get('quotations/{short_code}/{export?}', [QuotationController::class, 'show_public_quotation'])->name('quotations.show_public_quotation');

Route::get('dashboard/json_income_by_category', 'DashboardController@json_income_by_category')->middleware('auth');
Route::get('dashboard/json_expense_by_category', 'DashboardController@json_expense_by_category')->middleware('auth');
Route::get('dashboard/json_cashflow', 'DashboardController@json_cashflow')->middleware('auth');

Route::get('dashboard/json_package_wise_subscription', 'DashboardController@json_package_wise_subscription')->middleware('auth');
Route::get('dashboard/json_yearly_reveneu', 'DashboardController@json_yearly_reveneu')->middleware('auth');

//Social Login
Route::get('/login/{provider}', 'Auth\SocialController@redirect');
Route::get('/login/{provider}/callback', 'Auth\SocialController@callback');

Route::get('/installation', 'Install\InstallController@index');
Route::get('install/database', 'Install\InstallController@database');
Route::post('install/process_install', 'Install\InstallController@process_install');
Route::get('install/create_user', 'Install\InstallController@create_user');
Route::post('install/store_user', 'Install\InstallController@store_user');
Route::get('install/system_settings', 'Install\InstallController@system_settings');
Route::post('install/finish', 'Install\InstallController@final_touch');

//Update System
Route::get('migration/update', 'Install\UpdateController@update_migration');