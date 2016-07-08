module ApplicationHelper
	#Will return basic title if title isn''t provided
	def base_title(page_title='')
		base_title = "Addventure"
		if page_title.empty?
			base_title
		else
			page_title + "|" + base_title
		end
	end
end
