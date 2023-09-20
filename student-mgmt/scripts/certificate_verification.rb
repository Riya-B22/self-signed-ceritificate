# # scripts/certificate_verification.rb

# require 'net/http'
# require 'uri'
# require 'openssl'

# # OpenSSL.debug = true

# server_url = URI.parse('https://localhost:3000/certificate/expiration_date')
# ca_cert_path = '/Users/riya/Documents/untitled folder/ServiceNow Assignment/Self-Signed-Certificate-generator/ca_cert.pem'

# http = Net::HTTP.new(server_url.host, server_url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_PEER
# http.ca_file = ca_cert_path  # Specify the CA certificate path here
# #By setting http.ca_file, you explicitly tell the HTTP client 
# # to use the specified CA certificate for verification


# store = OpenSSL::X509::Store.new
# store.add_cert(OpenSSL::X509::Certificate.new(File.read(ca_cert_path)))


# http.cert_store = store

# request = Net::HTTP::Get.new(server_url.request_uri)
# response = http.request(request)

# if response.is_a?(Net::HTTPSuccess)
#   puts "Server Certificate Expiration Date: #{response.body}"
# else
#   puts "Error: #{response.code} - #{response.message}"
# end
