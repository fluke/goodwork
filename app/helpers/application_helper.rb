module ApplicationHelper
	def route_name
	  Rails.application.routes.recognize(request) { |route, _| route.name }.flatten.last.name.to_sym
	end
end
