require 'openssl'

# Generate a CA key and certificate
ca_key = OpenSSL::PKey::RSA.new(2048)
ca_cert = OpenSSL::X509::Certificate.new
ca_cert.version = 2
ca_cert.serial = 1
ca_cert.subject = OpenSSL::X509::Name.parse('/DC=org/DC=ruby-lang/CN=Ruby CA')
ca_cert.issuer = ca_cert.subject
ca_cert.public_key = ca_key.public_key
ca_cert.not_before = Time.now
ca_cert.not_after = ca_cert.not_before + 365 * 24 * 60 * 60 # 1 year validity
ca_cert.sign(ca_key, OpenSSL::Digest::SHA256.new)

# Save CA key and certificate to files
File.write('ca_key.pem', ca_key.to_pem)
File.write('ca_cert.pem', ca_cert.to_pem)

# Generate a server key and certificate signed by the CA
server_key = OpenSSL::PKey::RSA.new(2048)
server_cert = OpenSSL::X509::Certificate.new
server_cert.version = 2
server_cert.serial = 2
server_cert.subject = OpenSSL::X509::Name.parse('/DC=org/DC=ruby-lang/CN=Server')
server_cert.issuer = ca_cert.subject
server_cert.public_key = server_key.public_key
server_cert.not_before = Time.now
server_cert.not_after = server_cert.not_before + 365 * 24 * 60 * 60 # 1 year validity

extension_factory = OpenSSL::X509::ExtensionFactory.new
extension_factory.subject_certificate = server_cert
extension_factory.issuer_certificate = ca_cert
server_cert.add_extension(extension_factory.create_extension('subjectAltName', 'DNS:localhost'))

server_cert.sign(ca_key, OpenSSL::Digest::SHA256.new)

# Save server key and certificate to files
File.write('server_key.pem', server_key.to_pem)
File.write('server_cert.pem', server_cert.to_pem)
