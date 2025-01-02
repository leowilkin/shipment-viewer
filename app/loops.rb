require 'faraday'

def loops_send_transactional(email, transactionalId, dataVariables)
  raise "no løøps API key" unless ENV['LOOPS_API_KEY']

  conn = Faraday.new(url: "https://app.loops.so/") do |f|
    f.request :json
    f.response :raise_error
  end

  conn.post('https://app.loops.so/api/v1/transactional') do |req|
    req.headers['Authorization'] = "Bearer #{ENV['LOOPS_API_KEY']}"
    req.headers['Content-Type'] = 'application/json'
    req.body = {
      email:,
      transactionalId:,
      dataVariables:
    }.to_json
  end
end