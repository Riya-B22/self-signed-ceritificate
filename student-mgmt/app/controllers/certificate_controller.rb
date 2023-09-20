class CertificateController < ApplicationController
  def expiration_date
    certificate = OpenSSL::X509::Certificate.new(File.read(Rails.root.join('/Users/riya/Documents/untitled folder/ServiceNow Assignment/Self-Signed-Certificate-generator/server_cert.pem')))
    # binding.pry
    expiration_date = certificate.not_after.strftime('%Y-%m-%d %H:%M:%S UTC')
    render plain: "Certificate Expiration Date: #{expiration_date}"
  end
end
