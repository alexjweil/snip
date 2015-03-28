helpers do
	include Rack::Utils
 
	def random_url(length)
		SecureRandom.urlsafe_base64(length)
	end

	def normalize_url(url)
		Addressable::URI.heuristic_parse(url)
	end
end