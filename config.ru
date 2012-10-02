Bundler.require

require 'dropbox-resolver'

run lambda {|env|
  request = Rack::Request.new(env)

  url = DropboxResolver.resolve(request.params['link'])

  [302, {'Content-Type' => 'text/html; charset=utf-8', 'Location' => url}, ['']]
}
