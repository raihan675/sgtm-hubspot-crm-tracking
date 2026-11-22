___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Meta CRM Offline Conversions",
  "categories": [
    "ADVERTISING",
    "ANALYTICS",
    "CONVERSIONS",
    "MARKETING",
    "REMARKETING"
  ],
  "description": "Enterprise Meta Conversions API (CAPI) tag for Server-Side GTM, specifically designed for HubSpot CRM lifecycle stages and offline conversion tracking with automated mapping and high match quality.",
  "containerContexts": [
    "SERVER"
  ]
}

___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "configGroup",
    "subParams": [
      {
        "type": "SELECT",
        "name": "inheritEventName",
        "displayName": "Event Name Setup Method",
        "selectItems": [
          {
            "value": "inherit",
            "displayValue": "Inherit from client"
          },
          {
            "value": "override",
            "displayValue": "Override"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "inherit",
        "subParams": [
          {
            "type": "RADIO",
            "name": "eventName",
            "radioItems": [
              {
                "value": "standard",
                "displayValue": "Standard",
                "subParams": [
                  {
                    "type": "SELECT",
                    "name": "eventNameStandard",
                    "macrosInSelect": false,
                    "selectItems": [
                      {
                        "value": "PageView",
                        "displayValue": "PageView"
                      },
                      {
                        "value": "AddPaymentInfo",
                        "displayValue": "AddPaymentInfo"
                      },
                      {
                        "value": "AddToCart",
                        "displayValue": "AddToCart"
                      },
                      {
                        "value": "AddToWishlist",
                        "displayValue": "AddToWishlist"
                      },
                      {
                        "value": "AppendValue",
                        "displayValue": "AppendValue"
                      },
                      {
                        "value": "CompleteRegistration",
                        "displayValue": "CompleteRegistration"
                      },
                      {
                        "value": "Contact",
                        "displayValue": "Contact"
                      },
                      {
                        "value": "CustomizeProduct",
                        "displayValue": "CustomizeProduct"
                      },
                      {
                        "value": "Donate",
                        "displayValue": "Donate"
                      },
                      {
                        "value": "FindLocation",
                        "displayValue": "FindLocation"
                      },
                      {
                        "value": "InitiateCheckout",
                        "displayValue": "InitiateCheckout"
                      },
                      {
                        "value": "Lead",
                        "displayValue": "Lead"
                      },
                      {
                        "value": "Purchase",
                        "displayValue": "Purchase"
                      },
                      {
                        "value": "Schedule",
                        "displayValue": "Schedule"
                      },
                      {
                        "value": "Search",
                        "displayValue": "Search"
                      },
                      {
                        "value": "StartTrial",
                        "displayValue": "StartTrial"
                      },
                      {
                        "value": "SubmitApplication",
                        "displayValue": "SubmitApplication"
                      },
                      {
                        "value": "Subscribe",
                        "displayValue": "Subscribe"
                      },
                      {
                        "value": "ViewContent",
                        "displayValue": "ViewContent"
                      }
                    ],
                    "simpleValueType": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  }
                ]
              },
              {
                "value": "custom",
                "displayValue": "Custom",
                "subParams": [
                  {
                    "type": "TEXT",
                    "name": "eventNameCustom",
                    "simpleValueType": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  }
                ]
              }
            ],
            "simpleValueType": true,
            "defaultValue": "standard",
            "enablingConditions": [
              {
                "paramName": "inheritEventName",
                "paramValue": "override",
                "type": "EQUALS"
              }
            ],
            "displayName": "Event Type"
          }
        ],
        "help": "<b>Inherit from client</b>\n<br/>\nIf the incoming request follows the <b>Google Analytics 4 (GA4)</b> schema, the following mappings will be applied to convert GA4 <i>Event Names</i> into the Conversion API <i>Event Name</i> equivalent:\n<br/>\n<ul>\n<li><i>page_view</i> → <i>PageView</i></li>\n<li><i>gtm.dom</i> → <i>PageView</i></li>\n<li><i>add_payment_info</i> → <i>AddPaymentInfo</i></li>\n<li><i>add_to_cart</i> → <i>AddToCart</i></li>\n<li><i>add_to_wishlist</i> → <i>AddToWishlist</i></li>\n<li><i>sign_up</i> → <i>CompleteRegistration</i></li>\n<li><i>begin_checkout</i> → <i>InitiateCheckout</i></li>\n<li><i>generate_lead</i> → <i>Lead</i></li>\n<li><i>purchase</i> → <i>Purchase</i></li>\n<li><i>search</i> → <i>Search</i></li>\n<li><i>view_item</i> → <i>ViewContent</i></li>\n<li><i>view_item_list</i> → <i>ViewContent</i> (conditional)</li>\n<li><i>contact</i> → <i>Contact</i></li>\n<li><i>customize_product</i> → <i>CustomizeProduct</i></li>\n<li><i>donate</i> → <i>Donate</i></li>\n<li><i>find_location</i> → <i>FindLocation</i></li>\n<li><i>schedule</i> → <i>Schedule</i></li>\n<li><i>start_trial</i> → <i>StartTrial</i></li>\n<li><i>submit_application</i> → <i>SubmitApplication</i></li>\n<li><i>subscribe</i> → <i>Subscribe</i></li>\n<li><i>gtm4wp.addProductToCartEEC</i> → <i>AddToCart</i></li>\n<li><i>gtm4wp.productClickEEC</i> → <i>ViewContent</i></li>\n<li><i>gtm4wp.checkoutOptionEEC</i> → <i>InitiateCheckout</i></li>\n<li><i>gtm4wp.checkoutStepEEC</i> → <i>AddPaymentInfo</i></li>\n<li><i>gtm4wp.orderCompletedEEC</i> → <i>Purchase</i></li>\n</ul>\n<br/>\nPlease note that it provides partial event mapping. Not all GA4 events can be mapped to Conversion API Event Name."
      },
      {
        "type": "SELECT",
        "name": "actionSource",
        "displayName": "Action Source",
        "selectItems": [
          {
            "value": "website",
            "displayValue": "Website"
          },
          {
            "value": "email",
            "displayValue": "Email"
          },
          {
            "value": "app",
            "displayValue": "App"
          },
          {
            "value": "phone_call",
            "displayValue": "Phone Call"
          },
          {
            "value": "chat",
            "displayValue": "Chat"
          },
          {
            "value": "physical_store",
            "displayValue": "Physical Store"
          },
          {
            "value": "system_generated",
            "displayValue": "System Generated"
          },
          {
            "value": "business_messaging",
            "displayValue": "Business Messaging"
          },
          {
            "value": "other",
            "displayValue": "Other"
          }
        ],
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "defaultValue": "system_generated",
        "help": "<b>Email</b> — Conversion happened over email.\n<br/>\n<b>Website</b> — Conversion was made on your website.\n<br/>\n<b>App</b> — Conversion was made on your mobile app.\n<br/>\n<b>Phone Call</b> — Conversion was made over the phone.\n<br/>\n<b>Chat</b> — Conversion was made via a messaging app, SMS, or online messaging feature.\n<br/>\n<b>Physical Store</b> — Conversion was made in person at your physical store, helping to optimize your omni-channel marketing strategy.\n<br/>\n<b>System Generated</b> — Conversion happened automatically, such as a subscription renewal set to auto-pay, often linked with CRM CAPI for Meta Lead Ads.\n<br/>\n<b>Business Messaging</b> — Conversion was made from ads that click to Messenger, Instagram or WhatsApp.\n<br/> \n<b>Other</b> — Conversion happened in a way that is not listed.",
        "alwaysInSummary": true
      },
      {
        "type": "SELECT",
        "name": "messaging_channel",
        "displayName": "Messaging Channel",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "messenger",
            "displayValue": "Messenger"
          },
          {
            "value": "whatsapp",
            "displayValue": "WhatsApp"
          },
          {
            "value": "instagram",
            "displayValue": "Instagram"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "messenger",
        "enablingConditions": [
          {
            "paramName": "actionSource",
            "paramValue": "business_messaging",
            "type": "EQUALS"
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "alwaysInSummary": true
      },
      {
        "type": "TEXT",
        "name": "pixelId",
        "displayName": "Facebook Pixel ID",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Set to a valid Facebook Pixel ID."
      },
      {
        "type": "TEXT",
        "name": "accessToken",
        "displayName": "API Access Token",
        "simpleValueType": true,
        "help": "Set to your Facebook API Access Token. See <a href=\"https://developers.facebook.com/docs/marketing-api/server-side-api/get-started#access-token\" target=\"_blank\">here</a> for more information.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "enableMultipixelSetup",
        "checkboxText": "Add Multiple Facebook Pixel IDs",
        "simpleValueType": true,
        "help": "Add one <i>Facebook Pixel ID</i> and one <i>Access Token</i> per line.",
        "subParams": [
          {
            "type": "SIMPLE_TABLE",
            "name": "pixelIdAndAccessTokenTable",
            "simpleTableColumns": [
              {
                "defaultValue": "",
                "displayName": "Facebook Pixel ID",
                "name": "pixelId",
                "type": "TEXT",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "API Access Token",
                "name": "accessToken",
                "type": "TEXT",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              }
            ],
            "enablingConditions": [
              {
                "paramName": "enableMultipixelSetup",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "newRowButtonText": "Add Pixel ID"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "useAppSecretProof",
            "paramValue": true,
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "testId",
        "displayName": "Test ID",
        "simpleValueType": true,
        "help": "Provide a Test ID if you want to test server-side events in the Test Events feature of Events Manager.\n<br/>\nIt automatically uses the value in <i>eventData.test_event_code</i>, if present.",
        "valueHint": "TEST123"
      },
      {
        "type": "SELECT",
        "name": "overrideCookieDomain",
        "displayName": "Override the cookie domain",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": false,
            "displayValue": "False"
          },
          {
            "value": true,
            "displayValue": "True"
          }
        ],
        "simpleValueType": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "overridenCookieDomain",
            "displayName": "Cookie Domain",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "overrideCookieDomain",
                "paramValue": false,
                "type": "NOT_EQUALS"
              }
            ],
            "help": "Enable this option to override the cookie domain.<br>Enter your website's top-level domain as a fixed value (e.g., example.com). <br> If left as \"auto\", the top-level domain will be automatically determined using the following priority: <ul> <li>Top-level domain of the <i>Forwarded</i> header (if present).</li> <li>Top-level domain of the <i>X-Forwarded-Host</i> header (if present).</li> <li>Top-level domain of the <i>Host</i> header.</li> </ul>",
            "defaultValue": "auto",
            "valueHint": "example.com",
            "alwaysInSummary": true
          }
        ],
        "defaultValue": false
      },
      {
        "type": "CHECKBOX",
        "name": "generateFbp",
        "checkboxText": "Generate _fbp cookie if it does not exist",
        "simpleValueType": true,
        "defaultValue": true,
        "alwaysInSummary": true
      },
      {
        "type": "CHECKBOX",
        "name": "useHttpOnlyCookie",
        "checkboxText": "Use HttpOnly cookies for _fbc and _fbp",
        "simpleValueType": true,
        "help": "If enabled, Forbids JavaScript from accessing the <i>_fbc</i> and <i>_fbp</i> cookies."
      },
      {
        "type": "CHECKBOX",
        "name": "useOptimisticScenario",
        "checkboxText": "Use Optimistic Scenario",
        "simpleValueType": true,
        "help": "The tag will call gtmOnSuccess() without waiting for a response from the API. This will speed up sGTM response time however your tag will always return the status fired successfully even in case it is not."
      }
    ]
  },
  {
    "displayName": "Server Event Data Override",
    "name": "serverEventDataListGroup",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "type": "GROUP",
    "subParams": [
      {
        "type": "LABEL",
        "name": "serverEventDataLabel",
        "displayName": "Check <a href=\"https://developers.facebook.com/docs/marketing-api/conversions-api/parameters/server-event\">this documentation</a> for more details on which parameters you can override.<br/><br/>"
      },
      {
        "type": "CHECKBOX",
        "name": "autoMapServerEventData",
        "checkboxText": "Automap Server Event Data",
        "simpleValueType": true,
        "help": "If enabled, the tag will attempt to automatically map parameters from your event data.\n<br/><br/>\nAny value you manually enter in a field below will always override the auto-mapped value.\n<br/><br/>\nDefault mappings:\n<ul>\n<li>Source URL:\n<ul>\n<li><i>eventData.page_location</i></li>\n</ul>\n</li>\n<li>Referrer URL:\n<ul>\n<li><i>eventData.page_referrer</i></li>\n</ul>\n</li>\n<li>Event ID:\n<ul>\n<li><i>eventData.event_id</i></li>\n<li><i>eventData.transaction_id</i></li>\n</ul>\n</li>\n</ul>",
        "defaultValue": true
      },
      {
        "name": "serverEventDataList",
        "simpleTableColumns": [
          {
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "defaultValue": "event_id",
            "displayName": "Property Name",
            "name": "name",
            "isUnique": true,
            "type": "SELECT",
            "selectItems": [
              {
                "value": "event_time",
                "displayValue": "Event Time"
              },
              {
                "value": "event_source_url",
                "displayValue": "Source URL"
              },
              {
                "value": "opt_out",
                "displayValue": "Opt Out"
              },
              {
                "value": "event_id",
                "displayValue": "Event ID"
              },
              {
                "value": "data_processing_options",
                "displayValue": "Data Processing Options"
              },
              {
                "value": "data_processing_options_country",
                "displayValue": "Data Processing Options Country"
              },
              {
                "value": "data_processing_options_state",
                "displayValue": "Data Processing Options State"
              },
              {
                "value": "referrer_url",
                "displayValue": "Referrer URL"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Property Value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "type": "SIMPLE_TABLE",
        "newRowButtonText": "Add property"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "originalEventDataListGroup",
    "displayName": "Original Event Data",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "subParams": [
      {
        "type": "LABEL",
        "name": "originalEventDataLabel",
        "displayName": "Check <a href=\"https://developers.facebook.com/docs/marketing-api/conversions-api/parameters/original-event\">this documentation</a> for more details on which parameters you can override.\n<br/>\nUse these parameters to identify the Original Event that happened at an earlier time. Then, use the <i>AppendValue</i> event and the other sections to supplement information the Original Event. This is useful for Value Optimization for Profit (using the <i>net_revenue</i> parameter), allowing you to report the final profit margin after the initial sale has occurred.\n<br/><br/>"
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "originalEventDataList",
        "displayName": "",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Property Name",
            "name": "name",
            "type": "SELECT",
            "isUnique": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "selectItems": [
              {
                "value": "event_name",
                "displayValue": "Original Event Name"
              },
              {
                "value": "event_time",
                "displayValue": "Original Event Time"
              },
              {
                "value": "order_id",
                "displayValue": "Original Order ID"
              },
              {
                "value": "event_id",
                "displayValue": "Original Event ID"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Property Value",
            "name": "value",
            "type": "TEXT",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "newRowButtonText": "Add property"
      }
    ],
    "enablingConditions": [
      {
        "paramName": "eventNameStandard",
        "paramValue": "AppendValue",
        "type": "EQUALS"
      },
      {
        "paramName": "eventNameCustom",
        "paramValue": "AppendValue",
        "type": "EQUALS"
      }
    ]
  },
  {
    "displayName": "User Data",
    "name": "userDataListGroup",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "type": "GROUP",
    "subParams": [
      {
        "type": "LABEL",
        "name": "userDataLabel",
        "displayName": "User Data is your main <a href=\"https://www.facebook.com/business/help/765081237991954?id=818859032317965\">Event Match Quality (EMQ) contributor</a>. Matched events improve ad targeting by connecting actions to Meta accounts. Events with better match quality can lead to lower costs per action.\n<br/>\nCheck <a href=\"https://developers.facebook.com/docs/marketing-api/server-side-api/parameters/user-data\">this documentation</a> for more details on accepted User Data parameters.\n<br/>\nThe tag will automatically hash parameters that need it, pre-hashed data is also accepted.\n<br/><br/>"
      },
      {
        "type": "CHECKBOX",
        "name": "autoMapUserData",
        "checkboxText": "Automap User Data",
        "simpleValueType": true,
        "help": "If enabled, the tag will attempt to automatically map parameters from your event data.\n<br/><br/>\nAny value you manually enter in a field below will always override the auto-mapped value.\n<br/><br/>\nDefault mappings:\n<ul>\n<li><b>Click ID:</b> <i>fbclid URL parameter</i>, <i>_fbc cookie</i>, <i>eventData.common_cookie._fbc</i>, <i>eventData._fbc</i>, <i>eventData.fbc</i></li>\n<li><b>Browser ID:</b> <i>_fbp cookie</i>, <i>eventData.common_cookie._fbp</i>, <i>eventData._fbp</i>, <i>eventData.fbp</i></li>\n<li><b>Email:</b> <i>eventData.email</i>, <i>eventData.user_data.email_address</i>, <i>eventData.user_data.email</i>, <i>eventData.user_data.sha256_email_address</i></li>\n<li><b>Phone:</b> <i>eventData.phone</i>, <i>eventData.user_data.phone_number</i>, <i>eventData.user_data.phone</i></li>\n<li><b>First Name:</b> <i>eventData.firstName</i>, <i>eventData.FirstName</i>, <i>eventData.nameFirst</i>, <i>eventData.first_name</i>, <i>eventData.user_data.first_name</i>, <i>eventData.user_data.address[].first_name</i>, <i>eventData.user_data.address[].sha256_first_name</i></li>\n<li><b>Last Name:</b> <i>eventData.lastName</i>, <i>eventData.LastName</i>, <i>eventData.nameLast</i>, <i>eventData.last_name</i>, <i>eventData.user_data.last_name</i>, <i>eventData.user_data.address[].last_name</i>, <i>eventData.user_data.address[].sha256_last_name</i></li>\n<li><b>City:</b> <i>eventData.city</i>, <i>eventData.user_data.address[].city</i></li>\n<li><b>State:</b> <i>eventData.state</i>, <i>eventData.region</i>, <i>eventData.user_data.region</i>, <i>eventData.user_data.address[].region</i></li>\n<li><b>Zip:</b> <i>eventData.zip</i>, <i>eventData.postal_code</i>, <i>eventData.user_data.postal_code</i>, <i>eventData.user_data.address[].postal_code</i></li>\n<li><b>Country:</b> <i>eventData.countryCode</i>, <i>eventData.country</i>, <i>eventData.user_data.country</i>, <i>eventData.user_data.address[].country</i></li>\n<li><b>Gender:</b> <i>eventData.gender</i></li>\n<li><b>Date of Birth:</b> <i>eventData.db</i></li>\n<li><b>External ID:</b> <i>eventData.external_id</i>, <i>eventData.user_id</i>, <i>eventData.userId</i></li>\n<li><b>FB Login ID:</b> <i>eventData.fb_login_id</i></li>\n<li><b>Install ID:</b> <i>eventData.anon_id</i></li>\n<li><b>Mobile Advertising ID:</b> <i>eventData.madid</i></li>\n<li><b>Lead ID:</b> <i>eventData.lead_id</i>, <i>eventData.leadId</i></li>\n<li><b>Subscription ID:</b> <i>eventData.subscription_id</i>, <i>eventData.subscriptionId</i></li>\n<li><b>Plaintext IP Address:</b> <i>eventData.ip_override</i></li>\n<li><b>Client User Agent:</b> <i>eventData.user_agent</i></li>\n</ul>",
        "defaultValue": true
      },
      {
        "type": "SELECT",
        "name": "userDataObject",
        "displayName": "User Data Properties Object",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "help": "Provide an object with User Data Properties to merge with the fields below. Any conflicting properties will be overwritten.",
        "notSetText": "(not set)"
      },
      {
        "name": "userDataList",
        "simpleTableColumns": [
          {
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "defaultValue": "em",
            "displayName": "Property Name",
            "name": "name",
            "isUnique": true,
            "type": "SELECT",
            "selectItems": [
              {
                "value": "em",
                "displayValue": "Email"
              },
              {
                "value": "ph",
                "displayValue": "Phone"
              },
              {
                "value": "ge",
                "displayValue": "Gender"
              },
              {
                "value": "db",
                "displayValue": "Date of Birth"
              },
              {
                "value": "ln",
                "displayValue": "Last Name"
              },
              {
                "value": "fn",
                "displayValue": "First Name"
              },
              {
                "value": "ct",
                "displayValue": "City"
              },
              {
                "value": "st",
                "displayValue": "State"
              },
              {
                "value": "zp",
                "displayValue": "Zip"
              },
              {
                "value": "country",
                "displayValue": "Country"
              },
              {
                "value": "external_id",
                "displayValue": "External ID"
              },
              {
                "value": "client_ip_address",
                "displayValue": "Client IP Address"
              },
              {
                "value": "client_user_agent",
                "displayValue": "Client User Agent"
              },
              {
                "value": "fbc",
                "displayValue": "Click ID"
              },
              {
                "value": "fbp",
                "displayValue": "Browser ID"
              },
              {
                "value": "subscription_id",
                "displayValue": "Subscription ID"
              },
              {
                "value": "lead_id",
                "displayValue": "Lead ID"
              },
              {
                "value": "fb_login_id",
                "displayValue": "FB Login ID"
              },
              {
                "value": "anon_id",
                "displayValue": "Install ID"
              },
              {
                "value": "madid",
                "displayValue": "Mobile Advertiser ID"
              },
              {
                "value": "page_id",
                "displayValue": "Page ID"
              },
              {
                "value": "page_scoped_user_id",
                "displayValue": "Page Scoped User ID"
              },
              {
                "value": "ctwa_clid",
                "displayValue": "Click to WhatsApp ID"
              },
              {
                "value": "ig_account_id",
                "displayValue": "IG Account ID"
              },
              {
                "value": "ig_sid",
                "displayValue": "Click to Instagram ID"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Property Value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "type": "SIMPLE_TABLE",
        "newRowButtonText": "Add property"
      }
    ]
  },
  {
    "displayName": "App Data",
    "name": "appDataListGroup",
    "type": "GROUP",
    "subParams": [
      {
        "type": "LABEL",
        "name": "appDataLabel",
        "displayName": "Check <a href=\"https://developers.facebook.com/docs/marketing-api/conversions-api/parameters/app-data\">this documentation</a> for more details on which parameters you can override.\n<br/><br/>"
      },
      {
        "type": "CHECKBOX",
        "name": "autoMapAppData",
        "checkboxText": "Automap App Data",
        "simpleValueType": true,
        "help": "If enabled, the tag will attempt to automatically map parameters from your event data.\n<br/><br/>\nAny value you manually enter in a field below will always override the auto-mapped value.\n<br/><br/>\nDefault mappings:\n<ul>\n<li>If <i>eventData.app_data</i> is an object, it is used directly.</li>\n<li>Otherwise:\n<ul>\n<li>Advertiser Tracking Enabled: <i>eventData.advertiser_tracking_enabled</i></li>\n<li>Application Tracking Enabled: <i>eventData.application_tracking_enabled</i></li>\n<li>Ext Info: <i>eventData.extinfo</i>, or built from <i>eventData[x-ga-platform]</i>, <i>eventData.app_id</i>, <i>eventData.app_version</i>, <i>eventData[x-ga-os_version]</i>, <i>eventData[x-ga-device_model]</i>, <i>eventData.language</i></li>\n<li>Campaign IDs: <i>eventData.campaign_ids</i></li>\n<li>Install Referrer: <i>eventData.install_referrer</i></li>\n<li>Installer Package: <i>eventData.installer_package</i></li>\n<li>URL Schemes: <i>eventData.url_schemes</i></li>\n<li>Vendor ID: <i>eventData.vendor_id</i></li>\n<li>Windows Attribution ID: <i>eventData.windows_attribution_id</i></li>\n</ul>\n</li>\n</ul>",
        "defaultValue": true
      },
      {
        "type": "SELECT",
        "name": "appDataObject",
        "displayName": "App Data Properties Object",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "help": "Provide an object with App Data Properties to merge with the fields below. Any conflicting properties will be overwritten.",
        "notSetText": "(not set)"
      },
      {
        "name": "appDataList",
        "simpleTableColumns": [
          {
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "defaultValue": "",
            "displayName": "Property Name",
            "name": "name",
            "isUnique": true,
            "type": "SELECT",
            "selectItems": [
              {
                "value": "advertiser_tracking_enabled",
                "displayValue": "Advertiser Tracking Enabled"
              },
              {
                "value": "application_tracking_enabled",
                "displayValue": "Application Tracking Enabled"
              },
              {
                "value": "extinfo",
                "displayValue": "Ext Info"
              },
              {
                "value": "campaign_ids",
                "displayValue": "Campaign IDs"
              },
              {
                "value": "install_referrer",
                "displayValue": "Install Referrer"
              },
              {
                "value": "installer_package",
                "displayValue": "Installer Package"
              },
              {
                "value": "url_schemes",
                "displayValue": "URL Schemes"
              },
              {
                "value": "vendor_id",
                "displayValue": "Vendor ID"
              },
              {
                "value": "windows_attribution_id",
                "displayValue": "Windows Attribution ID"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Property Value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "type": "SIMPLE_TABLE",
        "newRowButtonText": "Add property"
      }
    ],
    "enablingConditions": [
      {
        "paramName": "actionSource",
        "paramValue": "app",
        "type": "EQUALS"
      }
    ],
    "groupStyle": "ZIPPY_OPEN_ON_PARAM"
  },
  {
    "displayName": "Custom Data",
    "name": "customDataListGroup",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "type": "GROUP",
    "subParams": [
      {
        "type": "LABEL",
        "name": "customDataLabel",
        "displayName": "Check <a href=\"https://developers.facebook.com/docs/marketing-api/conversions-api/parameters/custom-data\">this documentation</a> for more details on which parameters you can override.\n<br/><br/>"
      },
      {
        "type": "CHECKBOX",
        "name": "autoMapCustomData",
        "checkboxText": "Automap Custom Data",
        "simpleValueType": true,
        "help": "If enabled, the tag will attempt to automatically map parameters from your event data.\n<br/><br/>\nAny value you manually enter in a field below will always override the auto-mapped value.\n<br/><br/>\nDefault mappings:\n<ul>\n<li>Value:\n<ul>\n<li><i>eventData['x-ga-mp1-ev']</i></li>\n<li><i>eventData['x-ga-mp1-tr']</i></li>\n<li><i>eventData.value</i></li>\n<li><i>Sum of Price * Quantity from eventData.items[] or eventData.ecommerce.items[]</i></li>\n<li><i>0</i>, if event is \"Purchase\" and no value is defined</li>\n</ul>\n</li>\n<li>Currency:\n<ul>\n<li><i>eventData.currency</i></li>\n<li><i>Currency from eventData.items[] or eventData.ecommerce.items[]</i></li>\n<li><i>USD</i>, if event is \"Purchase\" and no currency is defined</li>\n</ul>\n</li>\n<li>Contents:\n<ul>\n<li><i>eventData.items[]</i></li>\n<li><i>eventData.ecommerce.items[]</i></li>\n</ul>\n</li>\n<li>Content Type:\n<ul>\n<li><i>eventData[x-fb-cd-content_type]</i></li>\n<li><i>eventData.content_type</i></li>\n<li>Default: <i>product</i></li>\n</ul>\n</li>\n<li>Order ID:\n<ul>\n<li><i>eventData.transaction_id</i></li>\n</ul>\n</li>\n<li>Search String:\n<ul>\n<li><i>eventData.search_term</i></li>\n</ul>\n</li>\n</ul>",
        "defaultValue": true,
        "subParams": [
          {
            "type": "GROUP",
            "name": "autoMapCustomDataSettingsGroup",
            "subParams": [
              {
                "type": "TEXT",
                "name": "itemIdKey",
                "displayName": "Custom Item ID Key",
                "simpleValueType": true,
                "help": "Optional.\n<br/><br/>\nYou can specify a custom key, which will be used to set the content Item ID, by default <i>item_id</i> will be used. This may be useful if you are using WooCommerce extensions.",
                "canBeEmptyString": true
              },
              {
                "type": "SELECT",
                "name": "mapItemDataTo",
                "displayName": "Map item data to",
                "selectItems": [
                  {
                    "value": "contents",
                    "displayValue": "Contents"
                  },
                  {
                    "value": "content_ids",
                    "displayValue": "Content IDs"
                  },
                  {
                    "value": "both",
                    "displayValue": "Both Contents and Content IDs"
                  }
                ],
                "simpleValueType": true,
                "defaultValue": "contents",
                "help": "Choose which parameter(s) to use when mapping item data: Contents, Content IDs or both."
              }
            ],
            "enablingConditions": [
              {
                "paramName": "autoMapCustomData",
                "paramValue": false,
                "type": "NOT_EQUALS"
              }
            ]
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "customDataObject",
        "displayName": "Custom Data Properties Object",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "help": "Provide an object with Custom Data Properties to merge with the fields below. Any conflicting properties will be overwritten.",
        "notSetText": "(not set)"
      },
      {
        "name": "customDataList",
        "simpleTableColumns": [
          {
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "defaultValue": "",
            "displayName": "Property Name",
            "name": "name",
            "isUnique": true,
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Property Value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "type": "SIMPLE_TABLE",
        "newRowButtonText": "Add property"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "tagExecutionConsentSettingsGroup",
    "displayName": "Tag Execution Consent Settings",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "RADIO",
        "name": "adStorageConsent",
        "radioItems": [
          {
            "value": "optional",
            "displayValue": "Send data always"
          },
          {
            "value": "required",
            "displayValue": "Send data in case marketing consent given",
            "help": "Aborts the tag execution if marketing consent (<i>ad_storage</i> Google Consent Mode or CRM Data Tag parameter) is not given."
          }
        ],
        "simpleValueType": true,
        "defaultValue": "optional"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "moreSettingsGroup",
    "displayName": "More Settings",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "useAppSecretProof",
        "checkboxText": "Use App Secret Proof",
        "simpleValueType": true,
        "help": "Optional. <br/><br/> Use this field only if your Business Manager’s Conversions API Application requires API calls to include the <i>app secret proof</i>.   <br/><br/> You’ll encounter this requirement if event requests fail with the error:  <i>\"API calls from the server require an appsecret_proof argument\"</i>. <br/><br/> <a href=\"https://developers.facebook.com/docs/graph-api/guides/secure-requests#appsecret_proof\">Learn more</a> about how to generate this value.",
        "subParams": [
          {
            "type": "TEXT",
            "name": "appSecretProof",
            "displayName": "App Secret Proof",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "useAppSecretProof",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "mapViewItemListToViewContent",
        "checkboxText": "Automap GA4 \"view_item_list\" event to \"ViewContent\"",
        "simpleValueType": true,
        "defaultValue": false,
        "help": "When enabled with \"Inherit from client\" <i>Event Name Setup Method</i>:\n<ul>\n<li>Maps the GA4 \"view_item_list\" event to \"ViewContent\".</li>\n<li>Sets \"content_type\" to \"product_group\" if an items array is present.</li>\n</ul>",
        "enablingConditions": [
          {
            "paramName": "inheritEventName",
            "paramValue": "inherit",
            "type": "EQUALS"
          }
        ]
      }
    ]
  }
]

___SANDBOXED_JS_FOR_SERVER___

const computeEffectiveTldPlusOne = require('computeEffectiveTldPlusOne');
const createRegex = require('createRegex');
const decodeUriComponent = require('decodeUriComponent');
const encodeUriComponent = require('encodeUriComponent');
const fromBase64 = require('fromBase64');
const generateRandom = require('generateRandom');
const getAllEventData = require('getAllEventData');
const getCookieValues = require('getCookieValues');
const getRequestHeader = require('getRequestHeader');
const getTimestampMillis = require('getTimestampMillis');
const getType = require('getType');
const JSON = require('JSON');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const Math = require('Math');
const parseUrl = require('parseUrl');
const Promise = require('Promise');
const sendHttpRequest = require('sendHttpRequest');
const setCookie = require('setCookie');
const sha256Sync = require('sha256Sync');
const testRegex = require('testRegex');
const toBase64 = require('toBase64');

/*==============================================================================
==============================================================================*/

const eventData = getAllEventData();
const API_VERSION = '26.0';
const PARTNER_AGENT_STRING = 'hubspot-crm-offline-capi-1.0.0';

if (shouldExitEarly(data, eventData)) {
  return data.gtmOnSuccess();
}

const ids = getClickAndBrowserId(data, eventData);
const fbc = ids.fbc;
const fbp = ids.fbp;
setIDsCookies(data, fbc, fbp);

const mappedPostBody = mapEvent(data, eventData, fbc, fbp);
sendRequests(data, mappedPostBody);

if (data.useOptimisticScenario) {
  return data.gtmOnSuccess();
}

/*==============================================================================
  Vendor related functions
==============================================================================*/

function setIDsCookies(data, fbc, fbp) {
  const cookieOptions = {
    domain: isUIFieldTrue(data.overrideCookieDomain)
      ? data.overridenCookieDomain || 'auto'
      : 'auto',
    path: '/',
    samesite: 'Lax',
    secure: true,
    'max-age': 7776000, // 90 days
    HttpOnly: !!data.useHttpOnlyCookie
  };

  if (fbc) {
    setCookie('_fbc', fbc, cookieOptions);
  }

  if (fbp) {
    setCookie('_fbp', fbp, cookieOptions);
  }
}

function getClickAndBrowserId(data, eventData) {
  const ids = {
    fbc:
      getCookieValues('_fbc')[0] ||
      (eventData.common_cookie || {})._fbc ||
      eventData._fbc ||
      eventData.fbc,
    fbp:
      getCookieValues('_fbp')[0] ||
      (eventData.common_cookie || {})._fbp ||
      eventData._fbp ||
      eventData.fbp
  };

  const url = getUrl(eventData);
  const subDomainIndex = url ? computeEffectiveTldPlusOne(url).split('.').length - 1 : 1;

  if (url) {
    const urlParsed = parseUrl(url);
    if (urlParsed && urlParsed.searchParams.fbclid) {
      const fbclid = decodeUriComponent(urlParsed.searchParams.fbclid);
      const fbcParts = ids.fbc ? ids.fbc.split('.') : [];

      if (isValidValue(fbclid) && (!ids.fbc || fbcParts[fbcParts.length - 1] !== fbclid)) {
        ids.fbc = 'fb.' + subDomainIndex + '.' + getTimestampMillis() + '.' + fbclid;
      }
    }
  }

  if (!ids.fbp && data.generateFbp) {
    ids.fbp =
      'fb.' +
      subDomainIndex +
      '.' +
      getTimestampMillis() +
      '.' +
      generateRandom(1000000000, 2147483647);
  }

  return ids;
}

function getEventName(data) {
  const gaToFacebookEventName = {
    // HubSpot CRM Lifecycle Stage & Lead Status Mappings
    lifecycle_subscriber: 'Lead',
    lifecycle_lead: 'Lead',
    lifecycle_mql: 'Lead',
    lifecycle_sql: 'SubmitApplication',
    lifecycle_opportunity: 'InitiateCheckout',
    lifecycle_customer: 'Purchase',
    lifecycle_evangelist: 'CompleteRegistration',

    lead_status_new: 'Lead',
    lead_status_open: 'Lead',
    lead_status_in_progress: 'Contact',
    lead_status_attempted_to_contact: 'Contact',
    lead_status_connected: 'Contact',
    lead_status_open_deal: 'InitiateCheckout',

    contact_meeting_booked: 'Schedule',
    deal_appointment_scheduled: 'Schedule',

    deal_closed_won: 'Purchase',
    deal_qualified: 'InitiateCheckout',
    deal_contract_sent: 'InitiateCheckout',
    deal_amount_updated: 'InitiateCheckout',

    page_view: 'PageView',
    'gtm.dom': 'PageView',
    add_payment_info: 'AddPaymentInfo',
    add_to_cart: 'AddToCart',
    add_to_wishlist: 'AddToWishlist',
    sign_up: 'CompleteRegistration',
    begin_checkout: 'InitiateCheckout',
    generate_lead: 'Lead',
    purchase: 'Purchase',
    search: 'Search',
    view_item: 'ViewContent',

    contact: 'Contact',
    customize_product: 'CustomizeProduct',
    donate: 'Donate',
    find_location: 'FindLocation',
    schedule: 'Schedule',
    start_trial: 'StartTrial',
    submit_application: 'SubmitApplication',
    subscribe: 'Subscribe',

    'gtm4wp.addProductToCartEEC': 'AddToCart',
    'gtm4wp.productClickEEC': 'ViewContent',
    'gtm4wp.checkoutOptionEEC': 'InitiateCheckout',
    'gtm4wp.checkoutStepEEC': 'AddPaymentInfo',
    'gtm4wp.orderCompletedEEC': 'Purchase'
  };

  if (data.inheritEventName !== 'override') {
    if (data.mapViewItemListToViewContent) {
      gaToFacebookEventName.view_item_list = 'ViewContent';
    }
    const eventName = eventData.event_name;
    return gaToFacebookEventName[eventName] || eventName;
  }

  let selectedEventName;
  if (data.eventName === 'standard') {
    selectedEventName = data.eventNameStandard;
  } else if (data.eventName === 'custom') {
    selectedEventName = data.eventNameCustom;
  }

  if (isValidValue(selectedEventName)) return selectedEventName;

  // An incomplete override falls back to the incoming name, as the inherit branch does.
  return gaToFacebookEventName[eventData.event_name] || eventData.event_name;
}

function mapEvent(data, eventData, fbc, fbp) {
  let mappedData = {
    event_name: getEventName(data),
    action_source: eventData.action_source || data.actionSource || 'system_generated',
    event_time: Math.round(getTimestampMillis() / 1000),
    custom_data: {},
    user_data: {}
  };
  const mappedPostBody = {
    data: [mappedData],
    partner_agent: PARTNER_AGENT_STRING
  };

  if (eventData.test_event_code || data.testId) {
    mappedPostBody.test_event_code = eventData.test_event_code
      ? eventData.test_event_code
      : data.testId;
  }

  if (mappedData.action_source === 'app') {
    mappedData.app_data = {};
  }

  if (mappedData.action_source === 'business_messaging') {
    mappedData.messaging_channel = data.messaging_channel;
  }

  mappedData = addServerEventData(data, eventData, mappedData);
  mappedData = addUserData(data, eventData, mappedData, fbc, fbp);
  mappedData = addAppData(data, eventData, mappedData);
  mappedData = addEcommerceData(data, eventData, mappedData);
  mappedData = addOriginalEventData(mappedData);

  if (data.enableEventEnhancement) {
    mappedData.user_data = enhanceEventData(eventData, mappedData.user_data);
  }

  mappedData = overrideDataIfNeeded(mappedData);
  mappedData = cleanupData(mappedData);
  mappedData = hashDataIfNeeded(mappedData);

  if (data.enableEventEnhancement) {
    setGtmEecCookie(mappedData.user_data);
  }

  return mappedPostBody;
}

function hashData(key, value) {
  if (!value) {
    return value;
  }

  const type = getType(value);

  if (type === 'undefined' || value === 'undefined') {
    return undefined;
  }

  if (type === 'array') {
    return value.map((val) => {
      return hashData(key, val);
    });
  }

  if (isHashed(value)) {
    return value;
  }

  value = makeString(value).trim().toLowerCase();

  if (key === 'ph') {
    value = normalizePhoneNumber(value);
  } else if (key === 'ct') {
    value = value.split(' ').join('');
  }

  return sha256Sync(value, { outputEncoding: 'hex' });
}

function hashDataIfNeeded(mappedData) {
  if (mappedData.user_data) {
    const keysToHash = [
      'em',
      'ph',
      'ge',
      'db',
      'ln',
      'fn',
      'ct',
      'st',
      'zp',
      'country',
      'external_id'
    ];
    for (let key in mappedData.user_data) {
      if (keysToHash.indexOf(key) !== -1) {
        mappedData.user_data[key] = hashData(key, mappedData.user_data[key]);
      }
    }
  }

  return mappedData;
}

function overrideDataIfNeeded(mappedData) {
  if (getType(data.userDataObject) === 'object') {
    mergeObj(mappedData.user_data, data.userDataObject);
  }
  if (data.userDataList) {
    data.userDataList.forEach((d) => {
      mappedData.user_data[d.name] = d.value;
    });
  }

  if (getType(data.customDataObject) === 'object') {
    mergeObj(mappedData.custom_data, data.customDataObject);
  }
  if (data.customDataList) {
    data.customDataList.forEach((d) => {
      mappedData.custom_data[d.name] = d.value;
    });
  }

  if (mappedData.action_source === 'app') {
    if (getType(data.appDataObject) === 'object') {
      mergeObj(mappedData.app_data, data.appDataObject);
    }
    if (data.appDataList) {
      data.appDataList.forEach((d) => {
        mappedData.app_data[d.name] = d.value;
      });
    }
  }

  return mappedData;
}

function cleanupData(mappedData) {
  if (mappedData.action_source === 'business_messaging') {
    mappedData.event_source_url = undefined;
    ['client_ip_address', 'client_user_agent', 'fbc', 'fbp'].forEach(
      (key) => (mappedData.user_data[key] = undefined)
    );
  }

  if (mappedData.user_data) {
    const userData = {};

    for (let userDataKey in mappedData.user_data) {
      if (isValidValue(mappedData.user_data[userDataKey])) {
        userData[userDataKey] = mappedData.user_data[userDataKey];
      }
    }

    mappedData.user_data = userData;
  }

  if (mappedData.custom_data) {
    const customData = {};

    for (let customDataKey in mappedData.custom_data) {
      if (isValidValue(mappedData.custom_data[customDataKey])) {
        customData[customDataKey] = mappedData.custom_data[customDataKey];
      }
    }

    if (customData.value === 0 || customData.value === '0') customData.value = '0.00';

    mappedData.custom_data = customData;
  }

  if (mappedData.app_data) {
    const appData = {};

    for (let appDataKey in mappedData.app_data) {
      if (isValidValue(mappedData.app_data[appDataKey])) {
        appData[appDataKey] = mappedData.app_data[appDataKey];
      }
    }

    mappedData.app_data = appData;
  }

  if (mappedData.original_event_data) {
    const originalEventData = {};

    for (let originalEventDataKey in mappedData.original_event_data) {
      if (isValidValue(mappedData.original_event_data[originalEventDataKey])) {
        originalEventData[originalEventDataKey] =
          mappedData.original_event_data[originalEventDataKey];
      }
    }

    mappedData.original_event_data = originalEventData;
  }

  for (let key in mappedData) { // Assigned, not rebuilt: the post body holds this reference.
    if (!isValidValue(mappedData[key])) mappedData[key] = undefined;
  }

  return mappedData;
}

function addEcommerceData(data, eventData, mappedData) {
    // Authoritative HubSpot CRM Deal & Conversion Values
    if (isValidValue(eventData.value) || isValidValue(eventData.deal_amount) || isValidValue(eventData.amount)) {
      const dealVal = makeNumber(eventData.value || eventData.deal_amount || eventData.amount);
      if (dealVal * 0 === 0) mappedData.custom_data.value = dealVal;
    }
    if (isValidValue(eventData.currency)) {
      mappedData.custom_data.currency = makeString(eventData.currency);
    }
    if (isValidValue(eventData.order_id) || isValidValue(eventData.deal_id) || isValidValue(eventData.transaction_id) || isValidValue(eventData.hs_object_id)) {
      mappedData.custom_data.order_id = makeString(eventData.order_id || eventData.deal_id || eventData.transaction_id || eventData.hs_object_id);
    }
    if (isValidValue(eventData.deal_pipeline) || isValidValue(eventData.dealstage) || isValidValue(eventData.content_category)) {
      mappedData.custom_data.content_category = makeString(eventData.deal_pipeline || eventData.dealstage || eventData.content_category);
    }
  const autoMapEnabled = data.hasOwnProperty('autoMapCustomData') ? data.autoMapCustomData : true; // To avoid a breaking change.
  if (autoMapEnabled) {
    let currencyFromItems = '';
    let valueFromItems = 0;

    let items;
    if (getType(eventData.items) === 'array' && eventData.items.length) items = eventData.items;
    else if (
      getType(eventData.ecommerce) === 'object' &&
      getType(eventData.ecommerce.items) === 'array' &&
      eventData.ecommerce.items.length
    ) {
      items = eventData.ecommerce.items;
    }

    if (items) {
      mappedData.custom_data.content_type =
        eventData['x-fb-cd-content_type'] || eventData.content_type || 'product';

      if (
        data.mapViewItemListToViewContent &&
        data.inheritEventName !== 'override' &&
        eventData.event_name === 'view_item_list'
      ) {
        mappedData.custom_data.content_type = 'product_group';
      }

      if (!items[1]) {
        if (items[0].item_name) mappedData.custom_data.content_name = items[0].item_name;
        if (items[0].item_category)
          mappedData.custom_data.content_category = items[0].item_category;

        const singleItemPrice = toFiniteNumber(items[0].price);
        const singleItemQuantity = toFiniteNumber(items[0].quantity);
        if (isValidValue(singleItemPrice)) {
          mappedData.custom_data.value = isValidValue(singleItemQuantity)
            ? singleItemQuantity * singleItemPrice
            : singleItemPrice;
        }
      }

      const itemIdKey = data.itemIdKey ? data.itemIdKey : 'item_id';
      const mapItemDataTo = data.mapItemDataTo || 'contents';
      items.forEach((d) => {
        if (!currencyFromItems && d.currency) currencyFromItems = d.currency;

        const content = {};
        let hasContent = false;

        if (isValidValue(d[itemIdKey])) {
          content.id = makeString(d[itemIdKey]);
          hasContent = true;
        }
        if (d.item_name) {
          content.title = d.item_name;
          hasContent = true;
        }
        if (d.item_brand) {
          content.brand = d.item_brand;
          hasContent = true;
        }
        if (d.item_category) {
          content.category = d.item_category;
          hasContent = true;
        }

        const quantity = toFiniteNumber(d.quantity);
        if (isValidValue(quantity)) {
          content.quantity = quantity;
          hasContent = true;
        }

        const itemPrice = toFiniteNumber(d.price);
        if (isValidValue(itemPrice)) {
          content.item_price = itemPrice;
          hasContent = true;
          valueFromItems += isValidValue(quantity) ? quantity * itemPrice : itemPrice;
        }

        if (!hasContent) return;

        if (mapItemDataTo === 'contents' || mapItemDataTo === 'both') {
          mappedData.custom_data.contents = mappedData.custom_data.contents || [];
          mappedData.custom_data.contents.push(content);
        }
        if (content.id && (mapItemDataTo === 'content_ids' || mapItemDataTo === 'both')) {
          mappedData.custom_data.content_ids = mappedData.custom_data.content_ids || [];
          mappedData.custom_data.content_ids.push(content.id);
        }
      });

      if (!mappedData.custom_data.contents && !mappedData.custom_data.content_ids) {
        mappedData.custom_data.content_type = undefined;
      }
    }

    const value = toFiniteNumber(
      eventData['x-ga-mp1-ev'] || eventData['x-ga-mp1-tr'] || eventData.value || eventData.deal_amount || eventData.amount
    );
    if (isValidValue(value)) mappedData.custom_data.value = value;

    const currency = eventData.currency || currencyFromItems;
    if (currency) mappedData.custom_data.currency = currency;

    if (eventData.search_term) mappedData.custom_data.search_string = eventData.search_term;

    const ordId = eventData.transaction_id || eventData.order_id || eventData.deal_id || eventData.hs_object_id;
    if (ordId) mappedData.custom_data.order_id = ordId;

    if (mappedData.event_name === 'Purchase') {
      // Facebook rejects a Purchase event with no value at all, so this always assigns one.
      if (!isValidValue(mappedData.custom_data.value))
        mappedData.custom_data.value = valueFromItems;
    }

    if (
      !mappedData.custom_data.currency &&
      (isValidValue(mappedData.custom_data.value) || valueFromItems)
    ) {
      mappedData.custom_data.currency = 'USD';
    }
  }

  return mappedData;
}

function addUserData(data, eventData, mappedData, fbc, fbp) {
  const autoMapEnabled = data.hasOwnProperty('autoMapUserData') ? data.autoMapUserData : true; // To avoid a breaking change.
  if (autoMapEnabled) {
    let address = {};
    let user_data = {};
    if (getType(eventData.user_data) === 'object') {
      user_data = eventData.user_data;
      const addressType = getType(user_data.address);
      if (addressType === 'object' || addressType === 'array') {
        address = user_data.address[0] || user_data.address;
      }
    }

    if (fbc) mappedData.user_data.fbc = fbc;
    if (fbp) mappedData.user_data.fbp = fbp;

    if (eventData.user_agent) mappedData.user_data.client_user_agent = eventData.user_agent;

    if (eventData.ip_override) {
      mappedData.user_data.client_ip_address = eventData.ip_override
        .split(' ')
        .join('')
        .split(',')[0];
    }

    if (eventData.fb_login_id) mappedData.user_data.fb_login_id = eventData.fb_login_id;

    if (eventData.anon_id) mappedData.user_data.anon_id = eventData.anon_id;

    if (eventData.madid) mappedData.user_data.madid = eventData.madid;

    const externalId = eventData.external_id || eventData.user_id || eventData.userId || eventData.contact_id || eventData.hs_object_id;
    if (externalId) mappedData.user_data.external_id = externalId;

    const subscriptionId = eventData.subscription_id || eventData.subscriptionId;
    if (subscriptionId) mappedData.user_data.subscription_id = subscriptionId;

    const leadId = eventData.lead_id || eventData.leadId;
    if (leadId) mappedData.user_data.lead_id = leadId;

    const ln =
      eventData.lastName ||
      eventData.LastName ||
      eventData.nameLast ||
      eventData.last_name ||
      user_data.last_name ||
      address.last_name ||
      address.sha256_last_name;
    if (ln) mappedData.user_data.ln = ln;

    const fn =
      eventData.firstName ||
      eventData.FirstName ||
      eventData.nameFirst ||
      eventData.first_name ||
      user_data.first_name ||
      address.first_name ||
      address.sha256_first_name;
    if (fn) mappedData.user_data.fn = fn;

    const em =
      eventData.email ||
      user_data.email_address ||
      user_data.email ||
      user_data.sha256_email_address;
    if (em) mappedData.user_data.em = em;

    const ph = eventData.phone || user_data.phone_number || user_data.phone;
    if (ph) mappedData.user_data.ph = ph;

    const ct = eventData.city || address.city;
    if (ct) mappedData.user_data.ct = ct;

    const st = eventData.state || eventData.region || user_data.region || address.region;
    if (st) mappedData.user_data.st = st;

    const zp =
      eventData.zip || eventData.postal_code || user_data.postal_code || address.postal_code;
    if (zp) mappedData.user_data.zp = zp;

    const country =
      eventData.countryCode || eventData.country || user_data.country || address.country;
    if (country) mappedData.user_data.country = country;

    if (eventData.gender) mappedData.user_data.ge = eventData.gender;
    if (eventData.db) mappedData.user_data.db = eventData.db;
  }
  return mappedData;
}

function addServerEventData(data, eventData, mappedData) {
  const autoMapEnabled = data.hasOwnProperty('autoMapServerEventData')
    ? data.autoMapServerEventData
    : true; // To avoid a breaking change.
  if (autoMapEnabled) {
    if (eventData.page_location) mappedData.event_source_url = eventData.page_location;
    if (eventData.page_referrer) mappedData.referrer_url = eventData.page_referrer;

    const eventId = eventData.event_id || eventData.transaction_id;
    if (eventId) mappedData.event_id = eventId;
  }

  if (data.serverEventDataList) {
    const required = ['event_time'];

    data.serverEventDataList.forEach((d) => {
      // A required field can be replaced but not cleared, so an empty one is ignored.
      if (required.indexOf(d.name) !== -1 && !isValidValue(d.value)) return;
      mappedData[d.name] = d.value;
    });

    if (
      !mappedData.data_processing_options &&
      (mappedData.data_processing_options_country || mappedData.data_processing_options_state)
    ) {
      mappedData.data_processing_options_country = undefined;
      mappedData.data_processing_options_state = undefined;
    }
  }

  return mappedData;
}

function addAppData(data, eventData, mappedData) {
  if (mappedData.action_source !== 'app') {
    return mappedData;
  }

  const autoMapEnabled = data.hasOwnProperty('autoMapAppData') ? data.autoMapAppData : true; // To avoid a breaking change.
  if (autoMapEnabled) {
    if (getType(eventData.app_data) === 'object') {
      mappedData.app_data = eventData.app_data;
      return mappedData;
    }

    mappedData.app_data.advertiser_tracking_enabled = eventData.advertiser_tracking_enabled ? 1 : 0; // Required
    mappedData.app_data.application_tracking_enabled = eventData.application_tracking_enabled
      ? 1
      : 0; // Required
    if (eventData.extinfo) {
      mappedData.app_data.extinfo = eventData.extinfo;
    } else {
      const platform = makeString(eventData['x-ga-platform'] || '').toLowerCase();
      const extinfoArray = [
        platform === 'android' ? 'a2' : platform === 'ios' ? 'i2' : '', // Required
        eventData.app_id || '',
        eventData.app_version || '',
        eventData.app_version ? 'Version ' + eventData.app_version : '',
        makeString(eventData['x-ga-os_version'] || ''), // Required
        eventData['x-ga-device_model'] || '',
        eventData.language || '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        ''
      ];
      mappedData.app_data.extinfo = extinfoArray;
    }
    if (eventData.campaign_ids) mappedData.app_data.campaign_ids = eventData.campaign_ids;
    if (eventData.install_referrer)
      mappedData.app_data.install_referrer = eventData.install_referrer;
    if (eventData.installer_package)
      mappedData.app_data.installer_package = eventData.installer_package;
    if (eventData.url_schemes) mappedData.app_data.url_schemes = eventData.url_schemes;
    if (eventData.vendor_id) mappedData.app_data.vendor_id = eventData.vendor_id;
    if (eventData.windows_attribution_id)
      mappedData.app_data.windows_attribution_id = eventData.windows_attribution_id;
  }

  return mappedData;
}

function addOriginalEventData(mappedData) {
  if (mappedData.event_name !== 'AppendValue') {
    return mappedData;
  }

  if (data.originalEventDataList) {
    mappedData.action_source = undefined;

    mappedData.original_event_data = {};
    data.originalEventDataList.forEach((d) => {
      mappedData.original_event_data[d.name] = d.value;
    });
  }

  return mappedData;
}

function setGtmEecCookie(userData) {
  // Offline CRM conversions do not set client-side enhancement cookies
}

function enhanceEventData(eventData, userData) {
  return userData;
}

function sendRequests(data, mappedPostBody) {
  let pixelsConfig = [
    {
      pixelId: data.pixelId,
      accessToken: data.accessToken,
      appSecretProof: data.useAppSecretProof ? data.appSecretProof : undefined
    }
  ];
  if (data.enableMultipixelSetup) {
    pixelsConfig = pixelsConfig.concat(data.pixelIdAndAccessTokenTable);
  }

  const requests = pixelsConfig.map((pixelConfig) => {
    const pixelId = pixelConfig.pixelId;
    const accessToken = pixelConfig.accessToken;
    const appSecretProof = pixelConfig.appSecretProof;
    const postUrl =
      'https://graph.facebook.com/v' +
      API_VERSION +
      '/' +
      enc(pixelId) +
      '/events?access_token=' +
      enc(accessToken) +
      (appSecretProof ? '&appsecret_proof=' + enc(appSecretProof) : '');

    return sendHttpRequest(
      postUrl,
      { headers: { 'content-type': 'application/json' }, method: 'POST' },
      JSON.stringify(mappedPostBody)
    )
      .then((result) => {
        if (result.statusCode < 200 || result.statusCode >= 300) return false;
        return true;
      })
      .catch((result) => {
        return false;
      });
  });

  Promise.all(requests)
    .then((results) => {
      if (!data.useOptimisticScenario) {
        const someRequestFailed = results.some((success) => !success);
        if (someRequestFailed) return data.gtmOnFailure();
        return data.gtmOnSuccess();
      }
    })
    .catch((result) => {
      if (!data.useOptimisticScenario) return data.gtmOnFailure();
    });
}

/*==============================================================================
  Helpers
==============================================================================*/

function getUrl(eventData) {
  return eventData.page_location || getRequestHeader('referer') || eventData.page_referrer;
}

function shouldExitEarly(data, eventData) {
  if (!isConsentGivenOrNotRequired(data, eventData)) return true;

  const url = getUrl(eventData);
  if (url && url.lastIndexOf('https://gtm-msr.appspot.com/', 0) === 0) return true;

  return false;
}

function enc(data) {
  if (['null', 'undefined'].indexOf(getType(data)) !== -1) data = '';
  return encodeUriComponent(makeString(data));
}

function isHashed(value) {
  if (!value) return false;
  return makeString(value).match('^[A-Fa-f0-9]{64}$') !== null;
}

function isValidValue(value) {
  const valueType = getType(value);
  if (valueType === 'null' || valueType === 'undefined' || value !== value) return false;
  return value !== '' && value !== 'undefined' && value !== 'null';
}

function toFiniteNumber(value) {
  if (!isValidValue(value)) return undefined;

  const valueType = getType(value);
  if (valueType !== 'number' && valueType !== 'string') return undefined;
  if (valueType === 'string' && value.trim() === '') return undefined; // Whitespace coerces to 0.

  const parsed = makeNumber(value);
  if (parsed * 0 !== 0) return undefined; // Rejects NaN and +/-Infinity.

  return parsed;
}

function normalizePhoneNumber(phoneNumber) {
  if (!phoneNumber) return phoneNumber;
  const itemRegex = createRegex('^[0-9]$');
  return phoneNumber
    .split('')
    .filter((item) => testRegex(itemRegex, item))
    .join('');
}

function isUIFieldTrue(field) {
  return [true, 'true'].indexOf(field) !== -1;
}

function mergeObj(target, source) {
  for (const key in source) {
    if (source.hasOwnProperty(key)) target[key] = source[key];
  }
  return target;
}

function isConsentGivenOrNotRequired(data, eventData) {
  if (data.adStorageConsent !== 'required') return true;
  if (eventData.consent_state) return !!eventData.consent_state.ad_storage;
  const xGaGcs = eventData['x-ga-gcs'] || ''; // x-ga-gcs is a string like "G110"
  return xGaGcs[2] === '1';
}

___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "set_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedCookies",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "name"
                  },
                  {
                    "type": 1,
                    "string": "domain"
                  },
                  {
                    "type": 1,
                    "string": "path"
                  },
                  {
                    "type": 1,
                    "string": "secure"
                  },
                  {
                    "type": 1,
                    "string": "session"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_fbc"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "name"
                  },
                  {
                    "type": 1,
                    "string": "domain"
                  },
                  {
                    "type": 1,
                    "string": "path"
                  },
                  {
                    "type": 1,
                    "string": "secure"
                  },
                  {
                    "type": 1,
                    "string": "session"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_fbp"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://graph.facebook.com/"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "_fbc"
              },
              {
                "type": 1,
                "string": "_fbp"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "headerWhitelist",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "referer"
                  }
                ]
              }
            ]
          }
        },
        {
          "key": "headersAllowed",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]

___TESTS___

scenarios:
- name: Check semantical errors
  code: "mock('sendHttpRequest', (requestUrl, requestOptions, requestBody) => {\n\
    \  return {\n    then: (callback) => { \n      callback({ statusCode: 200 });\n\
    \      return {\n        then: () => {},\n        catch: () => {}\n      };\n\
    \    },\n    catch: (callback) => callback()\n  };\n});\n\nrunCode(mockData);"
- name: '[Cookie] Cookie domain is NOT overriden when option is NOT selected'
  code: |-
    mockData.overrideCookieDomain = false;
    mockData.enableEventEnhancement = true;

    const expectedFbp = 'expectedFbp';
    const expectedFbc = 'expectedFbc';
    mock('getAllEventData', {
      _fbp: expectedFbp,
      _fbc: expectedFbc
    });

    mock('setCookie', (cookieName, cookieValue, cookieOptions, noEncode) => {
      switch (cookieName) {
        case '_fbp':
        case '_fbc':
        case '_gtmeec':
          if (cookieOptions.domain !== 'auto') fail('cookieDomain shouldn\'t have been overriden');
          break;
      }
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Cookie] Cookie domain is overriden when option is selected'
  code: |-
    mockData.overrideCookieDomain = true;
    mockData.overridenCookieDomain = 'example.com';
    mockData.enableEventEnhancement = true;

    const expectedFbp = 'expectedFbp';
    const expectedFbc = 'expectedFbc';
    mock('getAllEventData', {
      _fbp: expectedFbp,
      _fbc: expectedFbc
    });

    mock('setCookie', (cookieName, cookieValue, cookieOptions, noEncode) => {
      switch (cookieName) {
        case '_fbp':
        case '_fbc':
        case '_gtmeec':
          assertThat(cookieOptions.domain).isEqualTo(mockData.overridenCookieDomain);
          break;
      }
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Action Source = App] Request is sent successfully when using Event Data
    as source'
  code: "mockData.generateFbp = false;\nmockData.actionSource = 'app';\nmockData.appDataList\
    \ = undefined;\nmockData.eventName = 'custom';\n\nmock('getAllEventData', {\n\
    \  app_data: {\n    advertiser_tracking_enabled: 1,\n    application_tracking_enabled:\
    \ 0,\n    extinfo: [\n      'a2',\n      'app_id',\n      'app_version',\n   \
    \   'Version app_version',\n      'os_version',\n      'device_model',\n     \
    \ 'language',\n      '',\n      '',\n      '',\n      '',\n      '',\n      '',\n\
    \      '',\n      '',\n      ''\n    ],\n    campaign_ids: 'expected-campaign_ids',\n\
    \    install_referrer: 'expected-install_referrer',\n    installer_package: 'expected-installer_package',\
    \ \n    url_schemes: ['foobar', 'abcdef'],\n    vendor_id: 'expected-vendor_id',\n\
    \    windows_attribution_id: 'expected-windows_attribution_id'\n  }\n});\n\nconst\
    \ expectedRequestBody = {\n  data: [\n    {\n      event_name: 'test',\n     \
    \ action_source: 'app',\n      event_time: 1747945830,\n      custom_data: {},\n\
    \      user_data: {},\n      app_data: {\n        advertiser_tracking_enabled:\
    \ 1,\n        application_tracking_enabled: 0,\n        extinfo: [\n         \
    \ 'a2',\n          'app_id',\n          'app_version',\n          'Version app_version',\n\
    \          'os_version',\n          'device_model',\n          'language',\n \
    \         '',\n          '',\n          '',\n          '',\n          '',\n  \
    \        '',\n          '',\n          '',\n          ''\n        ],\n       \
    \ campaign_ids: 'expected-campaign_ids',\n        install_referrer: 'expected-install_referrer',\n\
    \        installer_package: 'expected-installer_package',\n        url_schemes:\
    \ ['foobar', 'abcdef'],\n        vendor_id: 'expected-vendor_id',\n        windows_attribution_id:\
    \ 'expected-windows_attribution_id'\n      }\n    }\n  ],\n  partner_agent: expectedPartnerAgent\n\
    };\n\nmock('sendHttpRequest', (requestUrl, requestOptions, requestBody) => {\n\
    \  const parsedBody = JSON.parse(requestBody);\n  assertThat(parsedBody).isEqualTo(expectedRequestBody);\n\
    \  return Promise.create((resolve, reject) => {\n    resolve({ statusCode: 200\
    \ });\n  });    \n});\n\nrunCode(mockData);\n\ncallLater(() => {\n  assertApi('gtmOnSuccess').wasCalled();\n\
    \  assertApi('gtmOnFailure').wasNotCalled();\n});"
- name: '[Action Source = App] Request is sent successfully when using UI data as
    source'
  code: "mockData.generateFbp = false;\nmockData.actionSource = 'app';\nmockData.appDataList\
    \ = [\n  { name: 'advertiser_tracking_enabled', value: '1' },\n  { name: 'application_tracking_enabled',\
    \ value: '0' },\n  { \n   name: 'extinfo',\n   value: \n     [\n      'a2',\n\
    \      'app_id',\n      'app_version',\n      'Version app_version',\n      'os_version',\n\
    \      'device_model',\n      'language',\n      '',\n      '',\n      '',\n \
    \     '',\n      '',\n      '',\n      '',\n      '',\n      ''\n    ]\n  },\n\
    \  { name: 'campaign_ids', value: 'expected-campaign_ids' },\n  { name: 'install_referrer',\
    \ value: 'expected-install_referrer' },\n  { name: 'installer_package', value:\
    \ 'expected-installer_package' }, \n  { name: 'url_schemes', value: ['foobar',\
    \ 'abcdef'] },\n  { name: 'vendor_id', value: 'expected-vendor_id' },\n  { name:\
    \ 'windows_attribution_id', value: 'expected-windows_attribution_id' }\n];\nmockData.eventName\
    \ = 'custom';\n\nmock('getAllEventData', {});\n\nconst expectedRequestBody = {\n\
    \  data: [\n    {\n      event_name: 'test',\n      action_source: 'app',\n  \
    \    event_time: 1747945830,\n      custom_data: {},\n      user_data: {},\n \
    \     app_data: {\n        advertiser_tracking_enabled: '1',\n        application_tracking_enabled:\
    \ '0',\n        extinfo: [\n          'a2',\n          'app_id',\n          'app_version',\n\
    \          'Version app_version',\n          'os_version',\n          'device_model',\n\
    \          'language',\n          '',\n          '',\n          '',\n        \
    \  '',\n          '',\n          '',\n          '',\n          '',\n         \
    \ ''\n        ],\n        campaign_ids: 'expected-campaign_ids',\n        install_referrer:\
    \ 'expected-install_referrer',\n        installer_package: 'expected-installer_package',\n\
    \        url_schemes: ['foobar', 'abcdef'],\n        vendor_id: 'expected-vendor_id',\n\
    \        windows_attribution_id: 'expected-windows_attribution_id'\n      }\n\
    \    }\n  ],\n  partner_agent: expectedPartnerAgent\n};\n\nmock('sendHttpRequest',\
    \ (requestUrl, requestOptions, requestBody) => {\n  const parsedBody = JSON.parse(requestBody);\n\
    \  assertThat(parsedBody).isEqualTo(expectedRequestBody);\n  return Promise.create((resolve,\
    \ reject) => {\n    resolve({ statusCode: 200 });\n  });    \n});\n\nrunCode(mockData);\n\
    \ncallLater(() => {\n  assertApi('gtmOnSuccess').wasCalled();\n  assertApi('gtmOnFailure').wasNotCalled();\n\
    });"
- name: '[Event = AppendValue] Request is sent successfully'
  code: "mockData.inheritEventName = 'override';\nmockData.eventNameCustom = 'AppendValue';\n\
    mockData.eventName = 'custom';\nmockData.generateFbp = false;\nmockData.actionSource\
    \ = 'website';\nmockData.userDataList = [\n  { name: 'em', value: 'test' },\n\
    \  { name: 'ph', value: 'test' }\n];\nmockData.customDataList = [\n  { name: 'currency',\
    \ value: 'BRL' },\n  { name: 'net_revenue', value: 123 }\n];\nmockData.originalEventDataList\
    \ = [\n  { name: 'event_name', value: 'Purchase' },\n  { name: 'event_time', value:\
    \ 17555555 },\n  { name: 'order_id', value: 'foobar123' },\n  { name: 'event_id',\
    \ value: '1747945830' }\n];\n\nmock('getAllEventData', {});\n\nconst expectedRequestBody\
    \ = {\n  data: [\n    {\n      event_name: 'AppendValue',\n      event_time: 1747945830,\n\
    \      custom_data: { currency: 'BRL', net_revenue: 123 },\n      user_data: {\n\
    \        em: '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',\n\
    \        ph: 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'\n\
    \      },\n      original_event_data: {\n        event_name: 'Purchase',\n   \
    \     event_time: 17555555,\n        order_id: 'foobar123',\n        event_id:\
    \ '1747945830'\n      }\n    }\n  ],\n  partner_agent: expectedPartnerAgent\n\
    };\n\nmock('sendHttpRequest', (requestUrl, requestOptions, requestBody) => {\n\
    \  const parsedBody = JSON.parse(requestBody);\n  assertThat(parsedBody).isEqualTo(expectedRequestBody);\n\
    \  return Promise.create((resolve, reject) => {\n    resolve({ statusCode: 200\
    \ });\n  });    \n});\n\nrunCode(mockData);\n\ncallLater(() => {\n  assertApi('gtmOnSuccess').wasCalled();\n\
    \  assertApi('gtmOnFailure').wasNotCalled();\n});"
- name: '[Parameters from Object or List] Parameters are read and sent succesfullly'
  code: "mockData.actionSource = 'app'; // Using 'app' just to have access to the\
    \ App Data section.\n\n[\n  // Object empty, list empty\n  {\n    mockDataObj:\
    \ {\n      appDataObject: undefined,\n      appDataList: undefined,\n      userDataObject:\
    \ undefined,\n      userDataList: undefined,\n      customDataObject: undefined,\n\
    \      customDataList: undefined\n    },\n    expectedRequestBody: {\n      appData:\
    \ {\n        advertiser_tracking_enabled: 0,\n        application_tracking_enabled:\
    \ 0,\n        extinfo: ['', '', '', '', '', '', '', '', '', '', '', '', '', '',\
    \ '', '']\n      },\n      userData: {},\n      customData: {}\n    }\n  },\n\
    \  \n  // Object empty, list not-empty\n  {\n    mockDataObj: {\n      appDataObject:\
    \ undefined,\n      appDataList: [\n        { name: 'vendor_id', value: 'vendor_id'\
    \ },\n        { name: 'campaign_ids', value: 'campaign_ids' }\n      ],\n    \
    \  userDataObject: undefined,\n      userDataList: [{ name: 'fn', value: 'test'\
    \ }],\n      customDataObject: undefined,\n      customDataList: [\n        {\
    \ name: 'currency', value: 'BRL' },\n        { name: 'net_revenue', value: 123\
    \ },\n        { name: 'test', value: 'test' }\n      ]\n    },\n    expectedRequestBody:\
    \ {\n      appData: {\n        advertiser_tracking_enabled: 0,\n        application_tracking_enabled:\
    \ 0,\n        extinfo: ['', '', '', '', '', '', '', '', '', '', '', '', '', '',\
    \ '', ''],\n        vendor_id: 'vendor_id',\n        campaign_ids: 'campaign_ids'\n\
    \      },\n      userData: { fn: '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08'\
    \ },\n      customData: { currency: 'BRL', net_revenue: 123, test: 'test' }\n\
    \    }\n  },\n  \n  // Object not-empty, list empty\n  {\n    mockDataObj: {\n\
    \      appDataObject: { vendor_id: 'vendor_id_obj' },\n      appDataList: undefined,\n\
    \      userDataObject: { em: 'test@example.com_obj' },\n      userDataList: undefined,\n\
    \      customDataObject: { test: 'test_obj' },\n      customDataList: undefined\n\
    \    },\n    expectedRequestBody: {\n      appData: {\n        advertiser_tracking_enabled:\
    \ 0,\n        application_tracking_enabled: 0,\n        extinfo: ['', '', '',\
    \ '', '', '', '', '', '', '', '', '', '', '', '', ''],\n        vendor_id: 'vendor_id_obj'\n\
    \      },\n      userData: { em: '0217a86a7b92e2511273b0081bfc67f939b7f9a897d960849690056732795b3d'\
    \ },\n      customData: { test: 'test_obj' }\n    }\n  },\n  \n  // Object not-empty\
    \ and list not-empty, with different values each.\n  {\n    mockDataObj: {\n \
    \     appDataObject: { vendor_id: 'vendor_id_obj' },\n      appDataList: [\n \
    \       { name: 'campaign_ids', value: 'campaign_ids' }\n      ],\n      userDataObject:\
    \ { em: 'test@example.com_obj' },\n      userDataList: [{ name: 'fn', value: 'test'\
    \ }],\n      customDataObject: { test: 'test_obj' },\n      customDataList: [\n\
    \        { name: 'currency', value: 'BRL' },\n        { name: 'net_revenue', value:\
    \ 123 }\n      ],\n    },\n    expectedRequestBody: {\n      appData: {\n    \
    \    advertiser_tracking_enabled: 0,\n        application_tracking_enabled: 0,\n\
    \        extinfo: ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '',\
    \ ''],\n        vendor_id: 'vendor_id_obj',\n        campaign_ids: 'campaign_ids'\n\
    \      },\n      userData: { em: '0217a86a7b92e2511273b0081bfc67f939b7f9a897d960849690056732795b3d',\
    \ fn: '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08' },\n\
    \      customData: { test: 'test_obj', currency: 'BRL', net_revenue: 123 }\n \
    \   }\n  },\n  \n  // Object not-empty and list not-empty, with overlapping values.\
    \ Should favor list.\n  {\n    mockDataObj: {\n      appDataObject: { vendor_id:\
    \ 'vendor_id_obj' },\n      appDataList: [\n        { name: 'vendor_id', value:\
    \ 'vendor_id' },\n        { name: 'campaign_ids', value: 'campaign_ids' }\n  \
    \    ],\n      userDataObject: { em: 'test@example.com_obj' },\n      userDataList:\
    \ [{ name: 'fn', value: 'test' }, { name: 'em', value: 'test' }],\n      customDataObject:\
    \ { test: 'test_obj' },\n      customDataList: [\n        { name: 'currency',\
    \ value: 'BRL' },\n        { name: 'net_revenue', value: 123 },\n        { name:\
    \ 'test', value: 'test' }\n      ],\n    },\n    expectedRequestBody: {\n    \
    \  appData: {\n        advertiser_tracking_enabled: 0,\n        application_tracking_enabled:\
    \ 0,\n        extinfo: ['', '', '', '', '', '', '', '', '', '', '', '', '', '',\
    \ '', ''],\n        vendor_id: 'vendor_id',\n        campaign_ids: 'campaign_ids'\n\
    \      },\n      userData: { em: '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',\
    \ fn: '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08' },\n\
    \      customData: { test: 'test', currency: 'BRL', net_revenue: 123 }\n    }\n\
    \  }\n].forEach((scenario, index) => {\n  const copyMockData = JSON.parse(JSON.stringify(mockData));\n\
    \  mergeObj(copyMockData, scenario.mockDataObj);\n  \n  mock('sendHttpRequest',\
    \ (requestUrl, requestOptions, requestBody) => {\n    const parsedBody = JSON.parse(requestBody);\n\
    \    assertThat(parsedBody.data[0].app_data).isEqualTo(scenario.expectedRequestBody.appData);\n\
    \    assertThat(parsedBody.data[0].user_data).isEqualTo(scenario.expectedRequestBody.userData);\n\
    \    assertThat(parsedBody.data[0].custom_data).isEqualTo(scenario.expectedRequestBody.customData);\n\
    \    return Promise.create((resolve, reject) => {\n      resolve({ statusCode:\
    \ 200 });\n    });\n  });\n  \n  runCode(copyMockData);\n  \n  callLater(() =>\
    \ {\n    assertApi('gtmOnSuccess').wasCalled();\n    assertApi('gtmOnFailure').wasNotCalled();\n\
    \  });\n});"
- name: '[App Secret Proof] App Secret Proof is handled and sent succesfully'
  code: "mockData.useAppSecretProof = true;\nmockData.appSecretProof = 'appSecretProof1';\n\
    \nmock('sendHttpRequest', (requestUrl, requestOptions, requestBody) => {\n  const\
    \ pixelId = mockData.pixelId;\n  const accessToken = mockData.accessToken;\n \
    \ const appSecretProof = mockData.appSecretProof;\n  \n  assertThat(requestUrl).isEqualTo(\n\
    \    'https://graph.facebook.com/v' + expectedApiVersion + '/' + pixelId + \n\
    \    '/events?access_token=' + accessToken +\n    '&appsecret_proof=' + appSecretProof\n\
    \  );\n\n  return Promise.create((resolve, reject) => {\n    resolve({ statusCode:\
    \ 200 });\n  });  \n});\n\nrunCode(mockData);\n\ncallLater(() => {\n  assertApi('gtmOnSuccess').wasCalled();\n\
    \  assertApi('gtmOnFailure').wasNotCalled();\n});"
- name: gtmOnFailure handler is called if a request fails, rejects, or Promise all
    rejects
  code: |-
    [
      // A request resolves with a non-200 status code.
      () => {
        let requestCount = 0;
        mock('sendHttpRequest', (requestUrl, requestOptions, requestBody) => {
          requestCount++;
          const statusCode = requestCount === 1 ? 500 : 200;
          return Promise.create((resolve, reject) => {
            resolve({ statusCode: statusCode });
          });
        });
      },
      // A request rejects outright.
      () => {
        let requestCount = 0;
        mock('sendHttpRequest', (requestUrl, requestOptions, requestBody) => {
          requestCount++;
          return Promise.create((resolve, reject) => {
            if (requestCount === 1) reject({ reason: 'failed' });
            else resolve({ statusCode: 200 });
          });
        });
      },
      // Every request succeeds, but Promise.all itself rejects.
      () => {
        mock('sendHttpRequest', (requestUrl, requestOptions, requestBody) => {
          return Promise.create((resolve, reject) => {
            resolve({ statusCode: 200 });
          });
        });
        mockObject('Promise', {
          all: () => Promise.create((resolve, reject) => reject({ reason: 'failed' }))
        });
      }
    ].forEach((setupFailure) => {
      mockData.enableMultipixelSetup = true;
      mockData.pixelIdAndAccessTokenTable = [
        {
          pixelId: 'pixelId2',
          accessToken: 'accessToken2',
          appSecretProof: 'appSecretProof2'
        }
      ];

      setupFailure();

      runCode(mockData);

      callLater(() => {
        assertApi('gtmOnSuccess').wasNotCalled();
        assertApi('gtmOnFailure').wasCalled();
      });
    });
- name: '[Event Name] Resolves across setup-method, override and fallback scenarios'
  code: |-
    [
      // Setup method unset: behaves as inherit.
      { inheritEventName: undefined, eventData: { event_name: 'purchase' }, expected: 'Purchase' },
      { inheritEventName: undefined, eventData: {}, expected: undefined },

      // Explicit inherit with nothing to map.
      { inheritEventName: 'inherit', eventData: {}, expected: undefined },

      // Override, standard selected but left blank: falls back to the mapped incoming name.
      {
        inheritEventName: 'override',
        eventName: 'standard',
        eventData: { event_name: 'purchase' },
        expected: 'Purchase'
      },
      // Override, custom selected but blank: falls back to the mapped incoming name.
      {
        inheritEventName: 'override',
        eventName: 'custom',
        eventNameCustom: '',
        eventData: { event_name: 'add_to_cart' },
        expected: 'AddToCart'
      },
      // Incomplete override with an incoming name outside the GA4 mapping table: forwarded as-is.
      {
        inheritEventName: 'override',
        eventName: 'standard',
        eventData: { event_name: 'session_start' },
        expected: 'session_start'
      },
      // Incomplete override with no incoming name at all: still sent, unresolved.
      { inheritEventName: 'override', eventName: 'standard', eventData: {}, expected: undefined },

      // Override, standard event chosen: sent as chosen regardless of the incoming name.
      {
        inheritEventName: 'override',
        eventName: 'standard',
        eventNameStandard: 'PageView',
        eventData: { event_name: 'purchase' },
        expected: 'PageView'
      },
      // Incomplete override does not apply the view_item_list mapping, which is scoped to inherit.
      {
        inheritEventName: 'override',
        eventName: 'standard',
        mapViewItemListToViewContent: true,
        eventData: { event_name: 'view_item_list' },
        expected: 'view_item_list'
      },
      // Override switched to custom after a standard event was picked: the stale standard value is not reused.
      {
        inheritEventName: 'override',
        eventName: 'custom',
        eventNameStandard: 'PageView',
        eventNameCustom: '',
        eventData: { event_name: 'purchase' },
        expected: 'Purchase'
      },
      // A sentinel string is not treated as a valid override name.
      {
        inheritEventName: 'override',
        eventName: 'custom',
        eventNameCustom: 'undefined',
        eventData: {},
        expected: undefined
      }
    ].forEach((scenario) => {
      const copyMockData = JSON.parse(JSON.stringify(mockData));
      copyMockData.inheritEventName = scenario.inheritEventName;
      copyMockData.eventName = scenario.eventName;
      copyMockData.eventNameStandard = scenario.eventNameStandard;
      copyMockData.eventNameCustom = scenario.eventNameCustom;
      copyMockData.mapViewItemListToViewContent = scenario.mapViewItemListToViewContent;

      mock('getAllEventData', scenario.eventData);

      let requestBody;
      mock('sendHttpRequest', (requestUrl, requestOptions, body) => {
        requestBody = JSON.parse(body);
        return Promise.create((resolve) => resolve({ statusCode: 200 }));
      });

      runCode(copyMockData);

      callLater(() => {
        assertThat(requestBody.data[0].event_name).isEqualTo(scenario.expected);
        assertThat(requestBody.data[0].action_source).isEqualTo('website');
        assertApi('gtmOnSuccess').wasCalled();
        assertApi('gtmOnFailure').wasNotCalled();
      });
    });
- name: '[Event Name] An absent inherit setting still maps view_item_list to a product
    group'
  code: |-
    mockData.inheritEventName = undefined;
    mockData.eventNameCustom = undefined;
    mockData.mapViewItemListToViewContent = true;

    mock('getAllEventData', {
      event_name: 'view_item_list',
      items: [{ item_id: 'SKU_1' }, { item_id: 'SKU_2' }]
    });

    let requestBody;
    mock('sendHttpRequest', (requestUrl, requestOptions, body) => {
      requestBody = JSON.parse(body);
      return Promise.create((resolve) => resolve({ statusCode: 200 }));
    });

    runCode(mockData);

    callLater(() => {
      assertThat(requestBody.data[0].event_name).isEqualTo('ViewContent');
      assertThat(requestBody.data[0].custom_data.content_type).isEqualTo('product_group');
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Server Event Data] An empty value clears a field unless it is required'
  code: |-
    mock('getAllEventData', {
      event_name: 'purchase',
      page_location: 'https://example.com/checkout'
    });

    mockData.serverEventDataList = [
      { name: 'event_source_url', value: undefined },
      { name: 'action_source', value: 'undefined' },
      { name: 'event_time', value: 'undefined' },
      { name: 'event_id', value: 'order-1' }
    ];

    let requestBody;
    mock('sendHttpRequest', (requestUrl, requestOptions, body) => {
      requestBody = JSON.parse(body);
      return Promise.create((resolve) => resolve({ statusCode: 200 }));
    });

    runCode(mockData);

    callLater(() => {
      assertThat(requestBody.data[0].event_source_url).isEqualTo(undefined);
      assertThat(requestBody.data[0].action_source).isEqualTo(undefined);
      assertThat(requestBody.data[0].event_id).isEqualTo('order-1');
      assertThat(requestBody.data[0].event_time).isEqualTo(1747945830);
    });
- name: '[Event Enhancement] Non-scalar cookie values are ignored'
  code: |-
    mockData.enableEventEnhancement = true;

    mock('getCookieValues', (name) => {
      // {"em": {"a": 1}, "ct": "paris"}
      if (name === '_gtmeec') return ['eyJlbSI6IHsiYSI6IDF9LCAiY3QiOiAicGFyaXMifQ=='];
      return [];
    });

    let requestBody;
    mock('sendHttpRequest', (requestUrl, requestOptions, body) => {
      requestBody = JSON.parse(body);
      return Promise.create((resolve) => resolve({ statusCode: 200 }));
    });

    runCode(mockData);

    callLater(() => {
      assertThat(requestBody.data[0].user_data.em).isUndefined();
      assertThat(requestBody.data[0].user_data.ct).isDefined();
    });
- name: '[Currency] Currency is found on an item other than the first'
  code: |-
    mock('getAllEventData', {
      items: [
        { item_id: 'sku1', price: 5 },
        { item_id: 'sku2', price: 7, currency: 'EUR' }
      ]
    });

    let requestBody;
    mock('sendHttpRequest', (requestUrl, requestOptions, body) => {
      requestBody = JSON.parse(body);
      return Promise.create((resolve) => resolve({ statusCode: 200 }));
    });

    runCode(mockData);

    callLater(() => {
      assertThat(requestBody.data[0].custom_data.currency).isEqualTo('EUR');
    });
- name: '[Currency] A price with no currency falls back to the existing default'
  code: |-
    mock('getAllEventData', {
      items: [{ item_id: 'sku1', price: '9.99' }]
    });

    let requestBody;
    mock('sendHttpRequest', (requestUrl, requestOptions, body) => {
      requestBody = JSON.parse(body);
      return Promise.create((resolve) => resolve({ statusCode: 200 }));
    });

    runCode(mockData);

    callLater(() => {
      const customData = requestBody.data[0].custom_data;
      assertThat(customData.contents[0].id).isEqualTo('sku1');
      assertThat(customData.contents[0].item_price).isEqualTo(9.99);
      assertThat(customData.value).isEqualTo(9.99);
      assertThat(customData.currency).isEqualTo('USD');
    });
- name: '[Click ID] A malformed fbclid is not written into the click ID'
  code: |-
    mock('getAllEventData', {
      page_location: 'https://example.com/p?fbclid=%E0%A4%A'
    });
    mock('getCookieValues', () => []);

    let requestBody;
    mock('sendHttpRequest', (requestUrl, requestOptions, body) => {
      requestBody = JSON.parse(body);
      return Promise.create((resolve) => resolve({ statusCode: 200 }));
    });

    runCode(mockData);

    callLater(() => {
      assertThat(requestBody.data[0].user_data.fbc).isEqualTo(undefined);
    });
- name: '[Price] A blank item price still fills in a value on a Purchase event'
  code: |-
    mock('getAllEventData', {
      event_name: 'purchase',
      items: [{ item_id: 'sku1', price: ' ' }]
    });

    let requestBody;
    mock('sendHttpRequest', (requestUrl, requestOptions, body) => {
      requestBody = JSON.parse(body);
      return Promise.create((resolve) => resolve({ statusCode: 200 }));
    });

    runCode(mockData);

    callLater(() => {
      const customData = requestBody.data[0].custom_data;
      assertThat(customData.contents[0].item_price).isEqualTo(undefined);
      // Facebook rejects a Purchase event with no value at all.
      assertThat(customData.value).isEqualTo('0.00');
      assertThat(customData.currency).isEqualTo('USD');
    });
- name: '[Contents] Mapping item data to content_ids only does not require contents'
  code: |-
    mock('getAllEventData', {
      currency: 'USD',
      items: [
        { item_id: 'sku1', price: '12.50 USD' },
        { item_name: 'no id or price' }
      ]
    });

    let requestBody;
    mock('sendHttpRequest', (requestUrl, requestOptions, body) => {
      requestBody = JSON.parse(body);
      return Promise.create((resolve) => resolve({ statusCode: 200 }));
    });

    runCode(mergeObj({ mapItemDataTo: 'content_ids' }, mockData));

    callLater(() => {
      const customData = requestBody.data[0].custom_data;
      assertThat(customData.content_ids).isEqualTo(['sku1']);
      assertThat(customData.contents).isEqualTo(undefined);
      assertThat(customData.content_type).isEqualTo('product');
    });
- name: '[Price] A malformed price is still rejected'
  code: |-
    mock('getAllEventData', {
      currency: 'EUR',
      items: [
        { item_id: 'sku1', price: '1.2.3' },
        { item_id: 'sku2', price: '3 x 12.50' },
        { item_id: 'sku3', price: '1,23,456' }
      ]
    });

    let requestBody;
    mock('sendHttpRequest', (requestUrl, requestOptions, body) => {
      requestBody = JSON.parse(body);
      return Promise.create((resolve) => resolve({ statusCode: 200 }));
    });

    runCode(mockData);

    callLater(() => {
      const contents = requestBody.data[0].custom_data.contents;
      assertThat(contents[0].item_price).isEqualTo(undefined);
      assertThat(contents[1].item_price).isEqualTo(undefined);
      assertThat(contents[2].item_price).isEqualTo(undefined);
    });
setup: "const JSON = require('JSON');\nconst Promise = require('Promise');\nconst\
  \ callLater = require('callLater');\n\nconst mergeObj = (target, source) => {\n\
  \  for (const key in source) {\n    if (source.hasOwnProperty(key)) target[key]\
  \ = source[key];\n  }\n  return target;\n};\n\nconst expectedBigQuerySettings =\
  \ {\n  logBigQueryProjectId: 'logBigQueryProjectId',\n  logBigQueryDatasetId: 'logBigQueryDatasetId',\n\
  \  logBigQueryTableId: 'logBigQueryTableId'\n};\n\nconst requiredConsoleKeys = ['Type',\
  \ 'TraceId', 'Name'];\nconst requiredBqKeys = ['timestamp', 'type', 'trace_id',\
  \ 'tag_name'];\nconst expectedBqOptions = { ignoreUnknownValues: true };\n\nconst\
  \ expectedValue = 'test';\nconst expectedPixelId = '1111111111111';\nconst expectedPartnerAgent\
  \ = 'hubspot-crm-offline-capi-1.0.0';\nconst expectedApiVersion = '26.0';\n\n\nconst mockData\
  \ = {\n  pixelId: expectedPixelId,\n  accessToken: expectedValue,\n  inheritEventName:\
  \ 'override',\n  eventNameCustom: expectedValue,\n  logBigQueryProjectId: expectedBigQuerySettings.logBigQueryProjectId,\n\
  \  logBigQueryDatasetId: expectedBigQuerySettings.logBigQueryDatasetId,\n  logBigQueryTableId:\
  \ expectedBigQuerySettings.logBigQueryTableId,\n};\n\nmock('sendHttpRequest', (requestUrl,\
  \ callback, requestOptions, requestBody) => {\n  if (typeof callback === 'function')\
  \ {\n    callback(200);\n  } else {\n    requestBody = requestOptions;\n    requestOptions\
  \ = callback;\n    return Promise.create((resolve, reject) => {\n      resolve({\
  \ statusCode: 200 });\n    });  \n  }\n});\n\nmock('getRequestHeader', (header)\
  \ => {\n  if (header === 'trace-id') return 'expectedTraceId';\n});\n\nmock('getTimestampMillis',\
  \ 1747945830456);"

___NOTES___

2026-11-22 Change Notes:
  - Meta CRM Offline Conversions Tag Template for Server-Side GTM.
  - Native HubSpot CRM Lifecycle Stage mappings (Lead, MQL, SQL, Opportunity, Customer, Deal stages).
  - High Match Quality user matching (external_id, fbc, fbp, lead_id, hashed PII).
  - Authoritative backend-driven tracking for CRM webhooks with action_source: system_generated.
  - Zero third-party vendor dependencies or branding.
