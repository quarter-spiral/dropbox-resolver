require "dropbox-resolver/version"

require 'net/https'
require 'uri'

class DropboxResolver
  def self.resolve(link)
    link = URI.unescape(link)

    final_link = follow_redirects(link)
    uri = URI.parse(final_link)
    uri.host = 'dl.dropbox.com'

    uri.to_s
  end

  protected
  def self.follow_redirects(link)
    uri = URI.parse(link)

    http = Net::HTTP.new(uri.host, uri.port)
    if uri.scheme == 'https'
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    request = Net::HTTP::Get.new(uri.request_uri)


    response = http.request(request)
    p "Status: #{response.code} #{response.inspect} #{response['Location'].inspect}"
    case response.code.to_i
    when 302
      follow_redirects(response['location'])
    when 200
      link
    else
      raise "An error occured! Status: #{response.code} #{response.inspect} #{response['Location'].inspect}"
    end
  end
end
