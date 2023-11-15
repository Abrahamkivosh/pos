DROP TABLE IF EXISTS accounts;

CREATE TABLE `accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(50) NOT NULL,
  `opening_date` date NOT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `currency` varchar(3) NOT NULL,
  `opening_balance` decimal(28,8) NOT NULL,
  `description` text DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_user_id_foreign` (`user_id`),
  KEY `accounts_business_id_foreign` (`business_id`),
  CONSTRAINT `accounts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accounts VALUES('1','Main Coop Account','2023-11-06','12345678','USD','500000.00000000','Main account','3','1','2023-11-06 21:30:07','2023-11-06 21:30:07');



DROP TABLE IF EXISTS brands;

CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `logo` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS business;

CREATE TABLE `business` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `reg_no` varchar(191) DEFAULT NULL,
  `vat_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_type_id` bigint(20) unsigned DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `address` text DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `custom_fields` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_user_id_foreign` (`user_id`),
  KEY `business_business_type_id_foreign` (`business_type_id`),
  CONSTRAINT `business_business_type_id_foreign` FOREIGN KEY (`business_type_id`) REFERENCES `business_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `business_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO business VALUES('1','Matopeni LTD','12345678','1234','3','1','info@wayaless.com','0712345678','Kenya','KES','','1699282600Screenshot 2023-10-29 184750.png','1','0','','2023-11-06 17:52:20','2023-11-06 12:48:53');



DROP TABLE IF EXISTS business_settings;

CREATE TABLE `business_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_settings_business_id_foreign` (`business_id`),
  CONSTRAINT `business_settings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO business_settings VALUES('1','timezone','America/Araguaina','1','2023-11-06 21:40:19','2023-11-06 21:40:19');
INSERT INTO business_settings VALUES('2','language','English---us','1','2023-11-06 21:40:19','2023-11-06 21:40:19');
INSERT INTO business_settings VALUES('3','backend_direction','ltr','1','2023-11-06 21:40:19','2023-11-06 21:40:19');
INSERT INTO business_settings VALUES('4','date_format','Y-m-d','1','2023-11-06 21:40:19','2023-11-06 21:40:19');
INSERT INTO business_settings VALUES('5','time_format','24','1','2023-11-06 21:40:19','2023-11-06 21:40:19');
INSERT INTO business_settings VALUES('6','PayPal','{\"status\":\"1\",\"client_id\":\"AfFIo0MBRpF9F_Dahlt9jY5sIc5Ocq7u1ROwJrTbYBlOTyNi3fI8K-DTyI-X9FkwtYPtJMy9_XOg52O_\",\"client_secret\":\"EP2L4c633zlwEesx8c2qtB169BOFV00iUr4vB9ZGMJNZpsYiN1cWjTc5iHi5a4n3Pgqu9vSRX3bBSien\",\"environment\":\"sandbox\",\"account\":\"1\"}','1','2023-11-06 12:43:02','2023-11-06 12:43:02');
INSERT INTO business_settings VALUES('7','slug','PayPal','1','2023-11-06 12:43:02','2023-11-06 12:43:02');
INSERT INTO business_settings VALUES('8','mail_type','smtp','1','2023-11-06 12:47:03','2023-11-06 12:47:03');
INSERT INTO business_settings VALUES('9','from_email','info@instandnet.co.ke','1','2023-11-06 12:47:03','2023-11-06 12:47:03');
INSERT INTO business_settings VALUES('10','from_name','Administrator','1','2023-11-06 12:47:03','2023-11-06 12:47:03');
INSERT INTO business_settings VALUES('11','smtp_host','sandbox.smtp.mailtrap.io','1','2023-11-06 12:47:03','2023-11-06 12:47:03');
INSERT INTO business_settings VALUES('12','smtp_port','2525','1','2023-11-06 12:47:03','2023-11-06 12:47:03');
INSERT INTO business_settings VALUES('13','smtp_username','ca3a9fcd45f4be','1','2023-11-06 12:47:03','2023-11-06 12:47:03');
INSERT INTO business_settings VALUES('14','smtp_password','a77d49abc478bf','1','2023-11-06 12:47:03','2023-11-06 12:47:03');
INSERT INTO business_settings VALUES('15','smtp_encryption','tls','1','2023-11-06 12:47:03','2023-11-06 12:47:03');



DROP TABLE IF EXISTS business_types;

CREATE TABLE `business_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO business_types VALUES('1','IT Business','1','2023-11-06 20:44:36','2023-11-06 20:44:36');



DROP TABLE IF EXISTS business_users;

CREATE TABLE `business_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `owner_id` bigint(20) unsigned NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_users_user_id_foreign` (`user_id`),
  KEY `business_users_business_id_foreign` (`business_id`),
  KEY `business_users_role_id_foreign` (`role_id`),
  CONSTRAINT `business_users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `business_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `business_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO business_users VALUES('1','1','3','','3','1','2023-11-06 17:52:20','2023-11-06 17:52:20');
INSERT INTO business_users VALUES('2','1','4','1','3','1','2023-11-06 16:05:48','2023-11-06 16:05:48');



DROP TABLE IF EXISTS currency;

CREATE TABLE `currency` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(3) NOT NULL,
  `exchange_rate` decimal(10,6) NOT NULL,
  `base_currency` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO currency VALUES('1','KSH','12.000000','1','1','2023-11-13 20:09:37','2023-11-13 20:09:37');
INSERT INTO currency VALUES('2','USD','2.000000','0','1','2023-11-13 20:10:03','2023-11-13 20:10:03');



DROP TABLE IF EXISTS customers;

CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `currency` varchar(10) NOT NULL,
  `vat_id` varchar(191) DEFAULT NULL,
  `reg_no` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `profile_picture` varchar(191) DEFAULT NULL,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `custom_fields` text DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_user_id_foreign` (`user_id`),
  KEY `customers_business_id_foreign` (`business_id`),
  CONSTRAINT `customers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customers VALUES('1','3','1','INEOS1:59','Wayapay','hello@wayapay.com','','0712345678','Virgin Islands (USA)','USD','','321123','','','','','','1699282817Screenshot 2023-10-17 191143.png','0.00000000','','3','','2023-11-06 21:00:17','2023-11-06 21:00:17');



DROP TABLE IF EXISTS database_backups;

CREATE TABLE `database_backups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(191) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS email_subscribers;

CREATE TABLE `email_subscribers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_address` varchar(191) NOT NULL,
  `ip_address` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_subscribers_email_address_unique` (`email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS email_templates;

CREATE TABLE `email_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `notification_body` text DEFAULT NULL,
  `shortcode` text DEFAULT NULL,
  `email_status` tinyint(4) NOT NULL DEFAULT 0,
  `sms_status` tinyint(4) NOT NULL DEFAULT 0,
  `notification_status` tinyint(4) NOT NULL DEFAULT 0,
  `template_mode` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = all, 1 = email, 2 = sms, 3 = notification',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO email_templates VALUES('1','Invite User','INVITE_USER','You\'ve been invited to collaborate','<h2>Invitation to collaborate</h2><p>{{businessName}} has invited you to collaborate as {{roleName}}</p><p>{{message}}</p><p>Accept the invitation by clicking the button below.</p><p><a href=\'{{actionUrl}}\' style=\'box-sizing: border-box; position: relative; -webkit-text-size-adjust: none; border-radius: 4px; color: #fff; display: inline-block; overflow: hidden; text-decoration: none; background-color: #2d3748; border-bottom: 8px solid #2d3748; border-left: 18px solid #2d3748; border-right: 18px solid #2d3748; border-top: 8px solid #2d3748;\'>Accept Invitation</a></p><p class=\'subcopy\' style=\'word-break: break-all; font-size: 14px;\'>If you\'re having trouble clicking the \'Accept Invitation\' button, copy and paste the URL below into your web browser: <a href=\'{{actionUrl}}\'>{{actionUrl}}</a></p>','','','{{businessName}} {{roleName}} {{message}} {{actionUrl}}','1','0','0','1','','2023-11-06 16:04:18');
INSERT INTO email_templates VALUES('2','New Invoice Created','NEW_INVOICE_CREATED','New Invoice Created','<div style=\'font-family: Arial, sans-serif; font-size: 14px;\'> <h2 style=\'color: #333333;\'>New Invoice Created</h2> <p>Dear {{customerName}},</p> <p>I am writing to let you know that a new invoice has been created for the Product/Service you ordered. The details of the invoice are as follows:</p> <ul> <li>Invoice number: <strong>{{invoiceNumber}}</strong></li> <li>Invoice date: <strong>{{invoiceDate}}</strong></li> <li>Due date: <strong>{{dueDate}}</strong></li> <li>Total amount due: <strong>{{dueAmount}}</strong></li> </ul> <p>To make the payment, please use the following details:</p> <p>{{invoiceLink}}</p> <p>Thank you for your business. We appreciate your prompt payment.</p> </div>','','','{{customerName}} {{invoiceNumber}} {{invoiceDate}} {{dueDate}} {{dueAmount}} {{invoiceLink}}','0','0','0','1','','');
INSERT INTO email_templates VALUES('3','New Quotation Created','NEW_QUOTATION_CREATED','New Quotation Created','<div style=\'font-family: Arial, sans-serif; font-size: 14px;\'> <h2 style=\'color: #333333;\'>New Quotation Created</h2> <p>Dear {{customerName}},</p> <p>I am pleased to inform you that we have created a new quotation for the Product/Service you requested. The details of the quotation are as follows:</p> <ul> <li>Quotation number: <strong>{{quotationNumber}}</strong></li> <li>Quotation date: <strong>{{quotationDate}}</strong></li> <li>Quotation expiry date: <strong>{{expiryDate}}</strong></li> <li>Total amount: <strong>{{amount}}</strong></li> </ul> <p>Please note that this quotation is valid until <strong>{{expiryDate}}</strong>. If you have any questions regarding the quotation, please do not hesitate to contact us.</p> <p><a href=\'{{quotationLink}}\'>View Quotation</a></p> <p>To proceed with the order, please confirm your acceptance of the quotation by replying to this email. Once we receive your confirmation, we will proceed with the order and send you the invoice.</p> <p>Thank you for your interest in our products/services. We look forward to doing business with you.</p> </div>','','','{{customerName}} {{quotationDate}} {{expiryDate}} {{amount}} {{quotationNumber}} {{quotationLink}}','0','0','0','1','','');
INSERT INTO email_templates VALUES('4','Invoice Payment Reminder','INVOICE_PAYMENT_REMINDER','Invoice Payment Reminder','<div style=\'font-family: Arial, sans-serif; font-size: 14px;\'> <h2 style=\'color: #333333;\'>Invoice Payment Reminder</h2> <p>Dear {{customerName}},</p> <p>I hope this email finds you well. This message is to remind you that the payment for invoice <strong>{{invoiceNumber}}</strong> is now due.</p> <p>The total amount due is <strong>{{dueAmount}}</strong>. Please ensure that the payment is made promptly to avoid any late fees or penalties.</p> <p>To make the payment, kindly use the following details:</p> <p>{{invoiceLink}}</p> <p>If you have already made the payment, please disregard this email.</p> <p>Thank you for your prompt attention to this matter. If you have any questions or concerns, please do not hesitate to contact me.</p></div>','','','{{customerName}} {{invoiceNumber}} {{invoiceDate}} {{dueDate}} {{dueAmount}} {{invoiceLink}}','0','0','0','1','','');
INSERT INTO email_templates VALUES('5','Invoice Payment Received','INVOICE_PAYMENT_RECEIVED','Invoice Payment Received','<div style=\'font-family: Arial, sans-serif; font-size: 14px;\'> <h2 style=\'color: #333333;\'>Invoice Payment Received</h2> <p>Dear {{customerName}},</p> <p>I am writing to confirm that we have received your payment for invoice <strong>{{invoiceNumber}}</strong>.</p> <p>The total amount received is <strong>{{amount}}</strong>.</p> <p>Thank you for your prompt payment. We value your business and look forward to working with you again in the future.</p> <p>If you have any questions or concerns, please do not hesitate to contact us.</p></div>','','','{{customerName}} {{amount}} {{invoiceDate}} {{paymentMethod}} {{invoiceNumber}} {{invoiceLink}}','0','0','0','1','','');
INSERT INTO email_templates VALUES('6','Trial Period Ended','TRIAL_PERIOD_ENDED','Dot Accounts Trial Ended','<div style=\'font-family: Arial, sans-serif; font-size: 14px;\'> <h2 style=\'color: #333333;\'>Dot Accounts Trial Ended</h2> <p>Dear {{customerName}},</p> <p>We hope this email finds you well. We wanted to remind you that your trial period has ended as of {{trialEndDate}}.</p> <p>We hope you found our service useful during the trial period. If you would like to continue using our service, please pay for subscription.</p> <p>If you have any questions or concerns, please do not hesitate to contact us. We are always here to help.</p> <p>Thank you for your interest in our service. We hope to continue serving you in the future.</p> </div>','','','{{customerName}} {{trialEndDate}} {{packageName}}','1','0','0','1','','2023-11-06 16:04:50');
INSERT INTO email_templates VALUES('7','Subscription Reminder','SUBSCRIPTION_REMINDER','Subscription Reminder','<div style=\'font-family: Arial, sans-serif; font-size: 14px;\'> <h2 style=\'color: #333333;\'>Dot Accounts Renewal Reminder </h2> <p>Dear {{customerName}},</p> <p>We hope this email finds you well. We wanted to remind you that your subscription is expiring on {{expiryDate}}.</p> <p>If you want to continue using our service, please renew your subscription by visiting our website and selecting a subscription plan that suits your needs.</p> <p>If you have already renewed your subscription, please disregard this email. Otherwise, please renew your subscription before the expiry date to avoid any interruption in your service.</p> <p>If you have any questions or concerns, please do not hesitate to contact us. We are always here to help.</p> <p>Thank you for choosing our service. We appreciate your business and look forward to continuing to serve you.</p> </div>','','','{{customerName}} {{expiryDate}} {{packageName}}','0','0','0','1','','');
INSERT INTO email_templates VALUES('8','Subscription Payment Confirmation','SUBSCRIPTION_PAYMENT_CONFIRMATION','Subscription Payment Confirmation','<div style=\'font-family: Arial, sans-serif; font-size: 14px;\'> <h2 style=\'color: #333333;\'>Dot Accounts Payment Confirmation</h2> <p>Dear {{customerName}},</p> <p>Thank you for renewing your subscription to (Package Name: {{packageName}}). Your payment has been received and your subscription has been renewed until {{expiryDate}}.</p> <p>You can now continue using our service without any interruption. If you have any questions or concerns, please do not hesitate to contact us. We are always here to help.</p> <p>Thank you for choosing our service. We appreciate your business and look forward to continuing to serve you.</p> </div>','','','{{customerName}} {{expiryDate}} {{packageName}}','0','0','0','1','','');



DROP TABLE IF EXISTS failed_jobs;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS faq_translations;

CREATE TABLE `faq_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `faq_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faq_translations_faq_id_locale_unique` (`faq_id`,`locale`),
  CONSTRAINT `faq_translations_faq_id_foreign` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS faqs;

CREATE TABLE `faqs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS feature_translations;

CREATE TABLE `feature_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feature_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `feature_translations_feature_id_locale_unique` (`feature_id`,`locale`),
  CONSTRAINT `feature_translations_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS features;

CREATE TABLE `features` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS invoice_item_taxes;

CREATE TABLE `invoice_item_taxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(20) unsigned NOT NULL,
  `invoice_item_id` bigint(20) unsigned NOT NULL,
  `tax_id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` decimal(28,8) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_item_taxes_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_item_taxes_invoice_item_id_foreign` (`invoice_item_id`),
  KEY `invoice_item_taxes_user_id_foreign` (`user_id`),
  KEY `invoice_item_taxes_business_id_foreign` (`business_id`),
  CONSTRAINT `invoice_item_taxes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_item_taxes_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_item_taxes_invoice_item_id_foreign` FOREIGN KEY (`invoice_item_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_item_taxes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS invoice_items;

CREATE TABLE `invoice_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `product_name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(28,8) NOT NULL,
  `sub_total` decimal(28,8) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_product_id_foreign` (`product_id`),
  KEY `invoice_items_user_id_foreign` (`user_id`),
  KEY `invoice_items_business_id_foreign` (`business_id`),
  CONSTRAINT `invoice_items_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS invoice_templates;

CREATE TABLE `invoice_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `body` longtext NOT NULL,
  `editor` longtext NOT NULL,
  `custom_css` text DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `business_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_templates_user_id_foreign` (`user_id`),
  KEY `invoice_templates_business_id_foreign` (`business_id`),
  CONSTRAINT `invoice_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_templates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS invoices;

CREATE TABLE `invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `invoice_number` varchar(100) DEFAULT NULL,
  `order_number` varchar(100) DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `sub_total` decimal(28,8) NOT NULL,
  `grand_total` decimal(28,8) NOT NULL,
  `converted_total` decimal(28,8) DEFAULT NULL,
  `paid` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `discount` decimal(28,8) DEFAULT NULL,
  `discount_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Percentage | 1 = Fixed',
  `discount_value` decimal(10,2) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `template_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Predefined | 1 = Dynamic',
  `template` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `short_code` varchar(191) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `email_send` tinyint(4) NOT NULL DEFAULT 0,
  `email_send_at` datetime DEFAULT NULL,
  `is_recurring` tinyint(4) NOT NULL DEFAULT 0,
  `recurring_completed` int(11) NOT NULL DEFAULT 0,
  `recurring_start` date DEFAULT NULL,
  `recurring_end` date DEFAULT NULL,
  `recurring_value` int(11) DEFAULT NULL,
  `recurring_type` varchar(20) DEFAULT NULL,
  `recurring_invoice_date` date DEFAULT NULL,
  `recurring_due_date` varchar(20) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_customer_id_foreign` (`customer_id`),
  KEY `invoices_user_id_foreign` (`user_id`),
  KEY `invoices_business_id_foreign` (`business_id`),
  CONSTRAINT `invoices_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS migrations;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES('1','2014_10_12_000000_create_users_table','1');
INSERT INTO migrations VALUES('2','2014_10_12_100000_create_password_reset_tokens_table','1');
INSERT INTO migrations VALUES('3','2019_08_19_000000_create_failed_jobs_table','1');
INSERT INTO migrations VALUES('4','2019_09_01_080940_create_settings_table','1');
INSERT INTO migrations VALUES('5','2019_09_01_080941_create_setting_translations','1');
INSERT INTO migrations VALUES('6','2019_12_14_000001_create_personal_access_tokens_table','1');
INSERT INTO migrations VALUES('7','2020_07_02_145857_create_database_backups_table','1');
INSERT INTO migrations VALUES('8','2021_07_02_145504_create_pages_table','1');
INSERT INTO migrations VALUES('9','2021_07_02_145952_create_page_translations_table','1');
INSERT INTO migrations VALUES('10','2021_08_07_111236_create_currency_table','1');
INSERT INTO migrations VALUES('11','2021_08_08_132702_create_payment_gateways_table','1');
INSERT INTO migrations VALUES('12','2021_10_22_070458_create_email_templates_table','1');
INSERT INTO migrations VALUES('13','2022_08_09_160105_create_notifications_table','1');
INSERT INTO migrations VALUES('14','2023_03_16_070314_create_packages_table','1');
INSERT INTO migrations VALUES('15','2023_03_16_165256_create_subscription_payments_table','1');
INSERT INTO migrations VALUES('16','2023_03_16_175321_create_business_types_table','1');
INSERT INTO migrations VALUES('17','2023_03_17_141421_create_business_table','1');
INSERT INTO migrations VALUES('18','2023_03_17_142542_create_business_settings_table','1');
INSERT INTO migrations VALUES('19','2023_03_19_082601_create_roles_table','1');
INSERT INTO migrations VALUES('20','2023_03_19_082603_create_business_users_table','1');
INSERT INTO migrations VALUES('21','2023_03_19_143240_create_permissions_table','1');
INSERT INTO migrations VALUES('22','2023_03_20_155534_create_user_invitations_table','1');
INSERT INTO migrations VALUES('23','2023_03_24_082007_create_customers_table','1');
INSERT INTO migrations VALUES('24','2023_03_24_144435_create_vendors_table','1');
INSERT INTO migrations VALUES('25','2023_03_24_153805_create_product_units_table','1');
INSERT INTO migrations VALUES('26','2023_03_24_164804_create_transaction_categories_table','1');
INSERT INTO migrations VALUES('27','2023_03_24_165807_create_products_table','1');
INSERT INTO migrations VALUES('28','2023_03_25_104515_create_taxes_table','1');
INSERT INTO migrations VALUES('29','2023_03_25_142805_create_invoices_table','1');
INSERT INTO migrations VALUES('30','2023_03_25_142811_create_invoice_items_table','1');
INSERT INTO migrations VALUES('31','2023_03_25_142828_create_invoice_item_taxes_table','1');
INSERT INTO migrations VALUES('32','2023_03_29_074346_create_quotations_table','1');
INSERT INTO migrations VALUES('33','2023_03_29_074359_create_quotation_items_table','1');
INSERT INTO migrations VALUES('34','2023_03_29_074418_create_quotation_item_taxes_table','1');
INSERT INTO migrations VALUES('35','2023_03_29_171700_create_invoice_templates_table','1');
INSERT INTO migrations VALUES('36','2023_04_06_111313_create_purchases_table','1');
INSERT INTO migrations VALUES('37','2023_04_06_111323_create_purchase_items_table','1');
INSERT INTO migrations VALUES('38','2023_04_06_111333_create_purchase_item_taxes_table','1');
INSERT INTO migrations VALUES('39','2023_04_06_111434_create_accounts_table','1');
INSERT INTO migrations VALUES('40','2023_04_07_080205_create_transaction_methods_table','1');
INSERT INTO migrations VALUES('41','2023_04_07_080306_create_transactions_table','1');
INSERT INTO migrations VALUES('42','2023_04_18_010306_create_faqs_table','1');
INSERT INTO migrations VALUES('43','2023_04_18_020307_create_faq_translations_table','1');
INSERT INTO migrations VALUES('44','2023_04_21_111229_create_features_table','1');
INSERT INTO migrations VALUES('45','2023_04_21_111241_create_feature_translations_table','1');
INSERT INTO migrations VALUES('46','2023_04_21_151904_create_testimonials_table','1');
INSERT INTO migrations VALUES('47','2023_04_21_151921_create_testimonial_translations_table','1');
INSERT INTO migrations VALUES('48','2023_04_21_154002_create_teams_table','1');
INSERT INTO migrations VALUES('49','2023_04_21_154010_create_team_translations_table','1');
INSERT INTO migrations VALUES('50','2023_04_21_160041_create_posts_table','1');
INSERT INTO migrations VALUES('51','2023_04_21_160048_create_post_translations_table','1');
INSERT INTO migrations VALUES('52','2023_04_21_163645_create_brands_table','1');
INSERT INTO migrations VALUES('53','2023_04_24_142555_create_post_comments_table','1');
INSERT INTO migrations VALUES('54','2023_05_02_144104_create_email_subscribers_table','1');
INSERT INTO migrations VALUES('55','2023_05_25_083601_update_business_table','1');
INSERT INTO migrations VALUES('56','2023_05_29_170209_update_products_and_transactions_table','1');



DROP TABLE IF EXISTS notifications;

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS packages;

CREATE TABLE `packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `package_type` varchar(30) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_popular` tinyint(4) NOT NULL DEFAULT 0,
  `discount` decimal(10,2) DEFAULT NULL,
  `trial_days` int(11) NOT NULL DEFAULT 0,
  `user_limit` varchar(191) DEFAULT NULL,
  `invoice_limit` varchar(191) DEFAULT NULL,
  `quotation_limit` varchar(191) DEFAULT NULL,
  `recurring_invoice` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 = Yes | 0 = No',
  `customer_limit` varchar(191) DEFAULT NULL,
  `business_limit` varchar(191) DEFAULT NULL,
  `invoice_builder` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 = Yes | 0 = No',
  `online_invoice_payment` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 = Yes | 0 = No',
  `others` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO packages VALUES('1','Basic Plan','monthly','1000.00','1','1','5.00','10','5','100','150','1','100','1','1','1','','2023-11-06 19:35:12','2023-11-06 19:47:42');
INSERT INTO packages VALUES('2','Popular Plan','monthly','1500.00','1','1','5.00','10','10','150','200','1','150','15','1','1','','2023-11-06 19:50:02','2023-11-06 19:50:02');
INSERT INTO packages VALUES('3','Silver Plan','yearly','2500.00','1','1','10.00','10','-1','-1','-1','1','200','40','1','1','','2023-11-06 19:51:41','2023-11-06 19:51:41');



DROP TABLE IF EXISTS page_translations;

CREATE TABLE `page_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` text NOT NULL,
  `body` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`),
  CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS pages;

CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS password_reset_tokens;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS payment_gateways;

CREATE TABLE `payment_gateways` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_crypto` tinyint(4) NOT NULL DEFAULT 0,
  `parameters` text DEFAULT NULL,
  `extra` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_gateways VALUES('1','PayPal','PayPal','paypal.png','1','0','{\"client_id\":\"AfFIo0MBRpF9F_Dahlt9jY5sIc5Ocq7u1ROwJrTbYBlOTyNi3fI8K-DTyI-X9FkwtYPtJMy9_XOg52O_\",\"client_secret\":\"EP2L4c633zlwEesx8c2qtB169BOFV00iUr4vB9ZGMJNZpsYiN1cWjTc5iHi5a4n3Pgqu9vSRX3bBSien\",\"environment\":\"sandbox\"}','','','2023-11-06 19:39:56');
INSERT INTO payment_gateways VALUES('2','Stripe','Stripe','stripe.png','0','0','{\"secret_key\":\"\",\"publishable_key\":\"\"}','','','');
INSERT INTO payment_gateways VALUES('3','Razorpay','Razorpay','razorpay.png','0','0','{\"razorpay_key_id\":\"\",\"razorpay_key_secret\":\"\"}','','','');
INSERT INTO payment_gateways VALUES('4','Paystack','Paystack','paystack.png','0','0','{\"paystack_public_key\":\"\",\"paystack_secret_key\":\"\"}','','','');
INSERT INTO payment_gateways VALUES('5','Flutterwave','Flutterwave','flutterwave.png','0','0','{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\",\"environment\":\"sandbox\"}','','','');
INSERT INTO payment_gateways VALUES('6','Mollie','Mollie','Mollie.png','1','0','{\"api_key\":\"12345678\"}','','','2023-11-13 20:03:49');
INSERT INTO payment_gateways VALUES('7','Instamojo','Instamojo','instamojo.png','0','0','{\"api_key\":\"\",\"auth_token\":\"\",\"salt\":\"\",\"environment\":\"sandbox\"}','','','');



DROP TABLE IF EXISTS permissions;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `permission` varchar(191) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_user_id_foreign` (`user_id`),
  CONSTRAINT `permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS personal_access_tokens;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS post_comments;

CREATE TABLE `post_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(191) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_user_id_foreign` (`user_id`),
  KEY `post_comments_post_id_foreign` (`post_id`),
  KEY `post_comments_parent_id_foreign` (`parent_id`),
  CONSTRAINT `post_comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `post_comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS post_translations;

CREATE TABLE `post_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `short_description` text NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_translations_post_id_locale_unique` (`post_id`,`locale`),
  CONSTRAINT `post_translations_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS posts;

CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS product_units;

CREATE TABLE `product_units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit` varchar(30) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_units_user_id_foreign` (`user_id`),
  KEY `product_units_business_id_foreign` (`business_id`),
  CONSTRAINT `product_units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_units_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_units VALUES('1','Full','3','1','3','','2023-11-06 21:09:51','2023-11-06 21:09:51');
INSERT INTO product_units VALUES('2','bag','3','1','3','','2023-11-06 21:26:12','2023-11-06 21:26:12');



DROP TABLE IF EXISTS products;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `type` varchar(10) NOT NULL COMMENT 'product || service',
  `product_unit_id` bigint(20) unsigned DEFAULT NULL,
  `purchase_cost` decimal(28,8) DEFAULT NULL,
  `selling_price` decimal(28,8) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `descriptions` text DEFAULT NULL,
  `stock_management` tinyint(4) NOT NULL DEFAULT 0,
  `stock` decimal(10,2) DEFAULT NULL,
  `allow_for_selling` tinyint(4) NOT NULL DEFAULT 0,
  `allow_for_purchasing` tinyint(4) NOT NULL DEFAULT 0,
  `income_category_id` bigint(20) unsigned DEFAULT NULL,
  `expense_category_id` bigint(20) unsigned DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_unit_id_foreign` (`product_unit_id`),
  KEY `products_user_id_foreign` (`user_id`),
  KEY `products_business_id_foreign` (`business_id`),
  KEY `products_income_category_id_foreign` (`income_category_id`),
  KEY `products_expense_category_id_foreign` (`expense_category_id`),
  CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `transaction_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_income_category_id_foreign` FOREIGN KEY (`income_category_id`) REFERENCES `transaction_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_product_unit_id_foreign` FOREIGN KEY (`product_unit_id`) REFERENCES `product_units` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES('1','Cleaning cars','service','1','','200.00000000','1699283522cleaning.jpeg','','0','0.00','1','0','1','','1','3','1','3','','2023-11-06 21:12:02','2023-11-06 21:12:02');
INSERT INTO products VALUES('2','Spare parts Car','service','1','','300.00000000','default.png','','1','100.00','1','0','1','','1','3','1','3','','2023-11-06 21:22:47','2023-11-06 21:22:47');
INSERT INTO products VALUES('3','Maize floor','product','2','','230.00000000','default.png','tamu sana','1','1000.00','1','0','2','','1','3','1','3','','2023-11-06 21:27:31','2023-11-06 21:27:31');



DROP TABLE IF EXISTS purchase_item_taxes;

CREATE TABLE `purchase_item_taxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) unsigned NOT NULL,
  `purchase_item_id` bigint(20) unsigned NOT NULL,
  `tax_id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` decimal(28,8) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_item_taxes_purchase_id_foreign` (`purchase_id`),
  KEY `purchase_item_taxes_purchase_item_id_foreign` (`purchase_item_id`),
  KEY `purchase_item_taxes_user_id_foreign` (`user_id`),
  KEY `purchase_item_taxes_business_id_foreign` (`business_id`),
  CONSTRAINT `purchase_item_taxes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_item_taxes_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_item_taxes_purchase_item_id_foreign` FOREIGN KEY (`purchase_item_id`) REFERENCES `purchase_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_item_taxes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS purchase_items;

CREATE TABLE `purchase_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `product_name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(28,8) NOT NULL,
  `sub_total` decimal(28,8) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_items_purchase_id_foreign` (`purchase_id`),
  KEY `purchase_items_product_id_foreign` (`product_id`),
  KEY `purchase_items_user_id_foreign` (`user_id`),
  KEY `purchase_items_business_id_foreign` (`business_id`),
  CONSTRAINT `purchase_items_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS purchases;

CREATE TABLE `purchases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `bill_no` varchar(100) DEFAULT NULL,
  `po_so_number` varchar(100) DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `due_date` date NOT NULL,
  `sub_total` decimal(28,8) NOT NULL,
  `grand_total` decimal(28,8) NOT NULL,
  `converted_total` decimal(28,8) DEFAULT NULL,
  `paid` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `discount` decimal(28,8) DEFAULT NULL,
  `discount_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Percentage | 1 = Fixed',
  `discount_value` decimal(10,2) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `template_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Predefined | 1 = Dynamic',
  `template` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `short_code` varchar(191) DEFAULT NULL,
  `email_send` tinyint(4) NOT NULL DEFAULT 0,
  `email_send_at` datetime DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchases_vendor_id_foreign` (`vendor_id`),
  KEY `purchases_user_id_foreign` (`user_id`),
  KEY `purchases_business_id_foreign` (`business_id`),
  CONSTRAINT `purchases_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchases_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS quotation_item_taxes;

CREATE TABLE `quotation_item_taxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` bigint(20) unsigned NOT NULL,
  `quotation_item_id` bigint(20) unsigned NOT NULL,
  `tax_id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` decimal(28,8) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotation_item_taxes_quotation_id_foreign` (`quotation_id`),
  KEY `quotation_item_taxes_quotation_item_id_foreign` (`quotation_item_id`),
  KEY `quotation_item_taxes_user_id_foreign` (`user_id`),
  KEY `quotation_item_taxes_business_id_foreign` (`business_id`),
  CONSTRAINT `quotation_item_taxes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quotation_item_taxes_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quotation_item_taxes_quotation_item_id_foreign` FOREIGN KEY (`quotation_item_id`) REFERENCES `quotation_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quotation_item_taxes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS quotation_items;

CREATE TABLE `quotation_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `product_name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(28,8) NOT NULL,
  `sub_total` decimal(28,8) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotation_items_quotation_id_foreign` (`quotation_id`),
  KEY `quotation_items_product_id_foreign` (`product_id`),
  KEY `quotation_items_user_id_foreign` (`user_id`),
  KEY `quotation_items_business_id_foreign` (`business_id`),
  CONSTRAINT `quotation_items_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quotation_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quotation_items_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quotation_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS quotations;

CREATE TABLE `quotations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `quotation_number` varchar(100) NOT NULL,
  `po_so_number` varchar(100) DEFAULT NULL,
  `quotation_date` date NOT NULL,
  `expired_date` date NOT NULL,
  `sub_total` decimal(28,8) NOT NULL,
  `grand_total` decimal(28,8) NOT NULL,
  `converted_total` decimal(28,8) DEFAULT NULL,
  `discount` decimal(28,8) DEFAULT NULL,
  `discount_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Percentage | 1 = Fixed',
  `discount_value` decimal(10,2) DEFAULT NULL,
  `template_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Predefined | 1 = Dynamic',
  `template` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `short_code` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotations_customer_id_foreign` (`customer_id`),
  KEY `quotations_user_id_foreign` (`user_id`),
  KEY `quotations_business_id_foreign` (`business_id`),
  CONSTRAINT `quotations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quotations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quotations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS roles;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_user_id_foreign` (`user_id`),
  CONSTRAINT `roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES('1','Finance','In charge of finance','3','2023-11-06 13:01:51','2023-11-06 13:01:51');



DROP TABLE IF EXISTS setting_translations;

CREATE TABLE `setting_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_translations_setting_id_locale_unique` (`setting_id`,`locale`),
  CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO setting_translations VALUES('1','7','English---us','{\"title\":\"Hello payments\",\"hero_heading\":\"Welcome to payment zones\",\"hero_sub_heading\":\"pay faster and easy\",\"get_started_text\":\"can you image paying first?\",\"get_started_link\":\"http:\\/\\/localhost:8000\\/\",\"features_status\":\"1\",\"features_heading\":\"World Of payments\",\"features_sub_heading\":\"check this payment\",\"pricing_status\":\"1\",\"pricing_heading\":\"pay now\",\"pricing_sub_heading\":\"paying me\",\"blog_status\":\"0\",\"blog_heading\":\"na\",\"blog_sub_heading\":\"\",\"testimonials_status\":\"0\",\"testimonials_heading\":\"No\",\"testimonials_sub_heading\":\"\",\"newsletter_status\":\"0\",\"newsletter_heading\":\"no\",\"newsletter_sub_heading\":\"\"}','2023-11-06 19:43:23','2023-11-06 19:43:23');



DROP TABLE IF EXISTS settings;

CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO settings VALUES('1','mail_type','smtp','','');
INSERT INTO settings VALUES('2','backend_direction','ltr','','2023-11-06 17:47:51');
INSERT INTO settings VALUES('3','email_verification','0','','2023-11-06 17:47:51');
INSERT INTO settings VALUES('4','member_signup','1','','2023-11-06 17:47:51');
INSERT INTO settings VALUES('5','language','English---us','','2023-11-06 20:46:53');
INSERT INTO settings VALUES('6','currency','KES','','2023-11-06 17:47:51');
INSERT INTO settings VALUES('7','home_page','{\"title\":\"Hello payments\",\"hero_heading\":\"Welcome to payment zones\",\"hero_sub_heading\":\"pay faster and easy\",\"get_started_text\":\"can you image paying first?\",\"get_started_link\":\"http:\\/\\/localhost:8000\\/\",\"features_status\":\"1\",\"features_heading\":\"World Of payments\",\"features_sub_heading\":\"check this payment\",\"pricing_status\":\"1\",\"pricing_heading\":\"pay now\",\"pricing_sub_heading\":\"paying me\",\"blog_status\":\"0\",\"blog_heading\":\"na\",\"blog_sub_heading\":\"\",\"testimonials_status\":\"0\",\"testimonials_heading\":\"No\",\"testimonials_sub_heading\":\"\",\"newsletter_status\":\"0\",\"newsletter_heading\":\"no\",\"newsletter_sub_heading\":\"\"}','2023-11-06 19:43:23','2023-11-06 19:43:23');
INSERT INTO settings VALUES('8','home_page_media','{\"hero_image\":\"file_12309045761699278203.png\",\"newsletter_bg_image\":\"file_19452267621699278203.png\"}','2023-11-06 19:43:23','2023-11-06 19:43:23');
INSERT INTO settings VALUES('9','company_name','Instandnet LTD','2023-11-06 20:46:53','2023-11-06 20:46:53');
INSERT INTO settings VALUES('10','site_title','Instandnet','2023-11-06 20:46:53','2023-11-06 20:46:53');
INSERT INTO settings VALUES('11','phone','0707585566','2023-11-06 20:46:53','2023-11-06 20:46:53');
INSERT INTO settings VALUES('12','email','info@instandnet.co.ke','2023-11-06 20:46:53','2023-11-06 20:46:53');
INSERT INTO settings VALUES('13','timezone','Africa/Nairobi','2023-11-06 20:46:53','2023-11-06 20:46:53');
INSERT INTO settings VALUES('14','address','','2023-11-06 20:46:53','2023-11-06 20:46:53');
INSERT INTO settings VALUES('15','date_format','m-d-Y','2023-11-06 17:47:51','2023-11-06 17:47:51');
INSERT INTO settings VALUES('16','time_format','24','2023-11-06 17:47:51','2023-11-06 17:47:51');
INSERT INTO settings VALUES('17','website_enable','1','2023-11-06 17:47:51','2023-11-06 17:47:51');



DROP TABLE IF EXISTS subscription_payments;

CREATE TABLE `subscription_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `order_id` varchar(191) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `package_id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscription_payments_user_id_foreign` (`user_id`),
  CONSTRAINT `subscription_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO subscription_payments VALUES('1','2','WF13KJ5','Bank_Transfer','1','2000.00','1','1','2023-11-06 19:36:15','2023-11-06 19:36:15');



DROP TABLE IF EXISTS taxes;

CREATE TABLE `taxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `tax_number` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxes_user_id_foreign` (`user_id`),
  KEY `taxes_business_id_foreign` (`business_id`),
  CONSTRAINT `taxes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `taxes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO taxes VALUES('1','VAT','16.00','001','3','1','2023-11-06 21:38:58','2023-11-06 21:38:58');



DROP TABLE IF EXISTS team_translations;

CREATE TABLE `team_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `role` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_translations_team_id_locale_unique` (`team_id`,`locale`),
  CONSTRAINT `team_translations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS teams;

CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS testimonial_translations;

CREATE TABLE `testimonial_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `testimonial_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `testimonial` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testimonial_translations_testimonial_id_locale_unique` (`testimonial_id`,`locale`),
  CONSTRAINT `testimonial_translations_testimonial_id_foreign` FOREIGN KEY (`testimonial_id`) REFERENCES `testimonials` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS testimonials;

CREATE TABLE `testimonials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS transaction_categories;

CREATE TABLE `transaction_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `color` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(15) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_categories_user_id_foreign` (`user_id`),
  KEY `transaction_categories_business_id_foreign` (`business_id`),
  CONSTRAINT `transaction_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transaction_categories VALUES('1','Car Cleaning','red','','income','3','1','3','','2023-11-06 21:10:50','2023-11-06 21:10:50');
INSERT INTO transaction_categories VALUES('2','Products Income','green','Products income','income','3','1','3','','2023-11-06 21:26:52','2023-11-06 21:26:52');



DROP TABLE IF EXISTS transaction_methods;

CREATE TABLE `transaction_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transaction_methods VALUES('1','Bank Transfer','1','3','1','2023-11-06 21:31:05','2023-11-06 21:31:05');



DROP TABLE IF EXISTS transactions;

CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trans_date` datetime NOT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `transaction_category_id` bigint(20) unsigned DEFAULT NULL,
  `dr_cr` varchar(2) NOT NULL,
  `type` varchar(20) NOT NULL COMMENT 'income|expense|transfer|others',
  `amount` decimal(28,8) NOT NULL,
  `currency_rate` decimal(28,8) NOT NULL,
  `ref_amount` decimal(28,8) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `ref_id` bigint(20) DEFAULT NULL,
  `ref_type` varchar(191) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  KEY `transactions_business_id_foreign` (`business_id`),
  KEY `transactions_account_id_foreign` (`account_id`),
  KEY `transactions_transaction_category_id_foreign` (`transaction_category_id`),
  CONSTRAINT `transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_transaction_category_id_foreign` FOREIGN KEY (`transaction_category_id`) REFERENCES `transaction_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transactions VALUES('1','2023-11-06 00:00:00','1','','cr','income','500000.00000000','1.00000000','','','','Account Opneing Balance','','','','','','3','1','3','','2023-11-06 21:30:07','2023-11-06 21:30:07');



DROP TABLE IF EXISTS user_invitations;

CREATE TABLE `user_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `sender_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO user_invitations VALUES('1','abrahamkivosh@gmail.com','3','1','1','4','0','Hello','2023-11-06 13:05:03','2023-11-06 16:05:48');



DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `user_type` varchar(20) NOT NULL COMMENT 'admin | user',
  `membership_type` varchar(50) DEFAULT NULL COMMENT 'trial | member',
  `package_id` bigint(20) DEFAULT NULL,
  `subscription_date` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `profile_picture` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `t_email_send_at` timestamp NULL DEFAULT NULL,
  `s_email_send_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `custom_fields` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES('1','test','test@test.com','admin','','','','1','default.png','','$2y$10$.5istkJvdLE9wQX3PM5h/OaItDtYqI8vcWAuXAVtTvbVTycXFzxRO','707585566','','','','','','','','','','','','2023-11-02 10:56:36','2023-11-02 10:56:36');
INSERT INTO users VALUES('2','john doe','john@test.com','user','member','1','2023-11-06','1','default.png','','$2y$10$fk2KqSMRWFaTBOodNNkqtuargCCWSFv22sFpp49t3uJJWY9Xuy0LS','70707585566','','','','','2023-12-06','','','','','','','2023-11-02 14:50:04','2023-11-06 19:36:15');
INSERT INTO users VALUES('3','Emmanual Tina','tina@test.com','user','trial','3','2023-11-06','1','default.png','','$2y$10$h26d5pxyPz5P/6dCPfBPburqvClURUD6Vh2CO0OBlyTPAu6plExhG','707585577','','','','','','','','','','','','2023-11-06 14:51:58','2023-11-06 19:53:10');
INSERT INTO users VALUES('4','abrahamkivosh','abrahamkivosh@gmail.com','user','','','','1','default.png','','$2y$10$EEhTayb0XyLsnfH7D28Zk.y24Zj.mtcrbui5qAskrUwxi5iSIY5A.','','','','','','','','','','','','FPc0uZpCcBcZuUl74LlTTnZrvXP1CykhUDVNOOtlwXy05bPSXhjCgtjmzAIF','2023-11-06 16:05:48','2023-11-06 13:06:05');



DROP TABLE IF EXISTS vendors;

CREATE TABLE `vendors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `registration_no` varchar(191) DEFAULT NULL,
  `vat_id` varchar(191) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `currency` varchar(10) NOT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `profile_picture` varchar(191) DEFAULT NULL,
  `custom_fields` text DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendors_user_id_foreign` (`user_id`),
  KEY `vendors_business_id_foreign` (`business_id`),
  CONSTRAINT `vendors_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vendors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO vendors VALUES('1','3','1','Daniel Babu','Cleaning Pipes','info@pipes.com','','123321','qwe','0712345678','Algeria','USD','San Antonio','texas','1110','','','1699283797Screenshot 2023-10-17 191143.png','','3','','2023-11-06 21:16:37','2023-11-06 21:16:37');



