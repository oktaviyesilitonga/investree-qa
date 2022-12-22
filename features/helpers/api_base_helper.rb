# frozen_string_literal: true

module ApiBaseHelper
  def execute(method, endpoint, request_body = nil)
    base_url = (ENV['BASE_URL']).to_s
    url = URI(base_url + endpoint)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == 'https')
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    case method
    when 'post'
      request = Net::HTTP::Post.new(url)
    when 'get'
      request = Net::HTTP::Get.new(url)
    when 'put'
      request = Net::HTTP::Put.new(url)
    when 'delete'
      request = Net::HTTP::Delete.new(url)
    end

    request['content-type'] = 'application/json'
    request.body = request_body.to_json unless request_body.nil?
    response = http.request(request)
    response.body = JSON.parse(response.read_body)
    response
  end
end
