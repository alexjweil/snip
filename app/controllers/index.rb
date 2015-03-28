get '/' do
	erb :index
end
 
post '/' do
	if params[:url] && !params[:url].empty?
		uri = normalize_url(params[:url])
		previous_url = settings.redis.get("uris:#{uri}").to_s
		@shortcode = previous_url.empty? ? random_url(5) : previous_url
		settings.redis.setnx("uris:#{uri}", @shortcode)
		settings.redis.setnx("links:#{@shortcode}", uri)
	end
	erb :index
end
 
get '/list/?' do
	@sites = settings.redis.keys('links:*').map { |e| [e,settings.redis.get(e.to_s)]}
	erb :list
end

get '/error/?' do
	erb :error
end

get '/:shortcode' do
	settings.redis.sadd("visitors:#{params[:shortcode]}", collect_user_info)
	@url = settings.redis.get("links:#{params[:shortcode]}").to_s
	redirect @url || '/error'
end


	