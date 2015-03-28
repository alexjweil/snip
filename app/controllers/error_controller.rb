not_found do
	session['status_message'] = 'File not Found'
	session['long_message'] = "<p>We couldn't find the page you're looking for. Sorry about that; we're really, really clumsy.</p>"
	erb :error
end