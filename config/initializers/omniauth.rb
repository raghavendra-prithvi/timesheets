Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, 'x8fda1dS2qiX92qubDwA', '40JahdWqNB7Zamr7Bfl7rfDFi9yuObQTDC5un5BErE'
  provider :twitter, 'gAUhwMPpyEzVg4J3XdnTog', 'P6STUgxt19rlNrbetKOL9ukCY9TPv8E7zPb4gZcqXU'
  provider :facebook, '498791810208233', 'b32aab0b735704d628b1f4faaaebfb0d'
  provider :identity
  provider :google, '860642848197.apps.googleusercontent.com', 'C0i-vqIK0bmpzMql5QCmiijW'
end
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}