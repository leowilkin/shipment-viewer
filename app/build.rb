require_relative 'main'

STATIC_ROUTES = {
  'index.html' => '/',
  'internal.html' => '/internal',
  'set_internal_key.html' => '/set_internal_key',
  '404.html' => '/wp-admin/index.php'
}

STATIC_ROUTES.each_pair do |file, route|
  response = ShipmentViewer.call('REQUEST_METHOD' => 'GET', 'PATH_INFO' => route )
  body = response[2].join
  File.write("build/#{file}", body)
end