# config/puma/production.rb

ssl_bind '0.0.0.0', '3000', {
  key: '/Users/riya/Documents/untitled folder/ServiceNow Assignment/Self-Signed-Certificate-generator/server_key.pem',
  cert: '/Users/riya/Documents/untitled folder/ServiceNow Assignment/Self-Signed-Certificate-generator/server_cert.pem'
}
