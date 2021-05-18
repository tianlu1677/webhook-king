class TrackService
  attr_accessor :request, :headers

  def initialize(request, token_uuid = '')
    @request = request
    @headers = request.headers
  end

  def do!
    headers = extract_http_request_headers(request.headers)
    find_webhook(request.params[:backpack_token])

    req_method = request.method
    ip = request.remote_ip
    hostname = request.hostname
    user_agent = request.user_agent
    referer = request.referer
    content_length = request.content_length
    status_code = 200

    query_params = request.query_parameters#.reject { |x| %w[controller action backpack_token].include?(x) }
    request_data = {
      headers: headers,
      req_method: req_method,
      ip: ip,
      hostname: hostname,
      user_agent: user_agent,
      referer: referer,
      status_code: status_code,
      query_params: query_params,
      content_length: content_length,
      account_id: @webhook.account_id
    }
    Rails.logger.info("request #{request_data}")

    backpack = @webhook.backpacks.create!(request_data)
  end

  def find_webhook(uuid)
    @webhook = Webhook.find_by!(uuid: uuid)
  end

  def extract_http_request_headers(env)
    allow = %w[CONTENT_TYPE CONTENT_LENGTH]
    env.reject do |k, v|
      (!(/^HTTP_[A-Z_]+$/ === k) && !allow.include?(k)) || k == 'HTTP_VERSION'
    end.map do |k, v|
      [reconstruct_header_name(k), v]
    end.each_with_object(Rack::Utils::HeaderHash.new) do |k_v, hash|
      k, v = k_v
      hash[k] = v
    end
  end

  def reconstruct_header_name(name)
    name.sub(/^HTTP_/, '').gsub('_', '-').downcase
  end

  COOKIE_PARAM_PATTERN = %r{\A([^(),/<>@;:\\"\[\]?={}\s]+)(?:=([^;]*))?\Z}
  COOKIE_SPLIT_PATTERN = /;\s*/

  def parse_cookie(cookie_str)
    params = cookie_str.split(COOKIE_SPLIT_PATTERN)
    info = params.shift.match(COOKIE_PARAM_PATTERN)
    return {} unless info

    cookie = {
      name: info[1],
      value: CGI.unescape(info[2])
    }

    params.each do |param|
      result = param.match(COOKIE_PARAM_PATTERN)
      next unless result

      key = result[1].downcase.to_sym
      value = result[2]
      case key
      when :expires
        begin
          cookie[:expires] = Time.parse(value)
        rescue ArgumentError
        end
      when :httponly, :secure
        cookie[key] = true
      else
        cookie[key] = value
      end
    end

    cookie
  end

end