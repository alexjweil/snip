helpers do
	def collect_user_info
		Marshal::dump({:ip => request.ip, :time => Time.now, :referrer => request.referrer, :user_agent => request.user_agent})
	end
end