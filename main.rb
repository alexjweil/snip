%w(sinatra redis addressable/uri securerandom).each {|gem| require gem}


configure do
	ENV['site_url'] = 'localhost:9393'
	ENV['site_name'] = 'localhost:9393'
	set :redis, Redis.new
	set :views, Proc.new { File.join(root, "/app/views") }
end

class Snip < Sinatra::Application
	Dir['./app/models/*.rb'].each { |file| require file }
	Dir['./app/helpers/*.rb'].each { |file| require file }
	Dir['./app/controllers/*.rb'].each { |file| require file }
end

