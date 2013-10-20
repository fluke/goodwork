module ApplicationHelper

	def fullwidth(path) 
		path=='/' or path=='/donation/create' or path=='/welcome'
	end

	def title(page_title)
	  content_for(:title) { page_title }
	end

end
