require 'openssl'

def sign(text)
  signing_secret = ENV['SIGNING_SECRET']
  raise 'SIGNING_SECRET is not set' if signing_secret.nil?

  hmac = OpenSSL::HMAC.digest('SHA256', signing_secret, text)
  hmac.unpack1('H*')
end

def sig_checks_out?(email, sig)
  sign(email) == sig
end