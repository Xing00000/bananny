module ApplicationHelper
	def session_or_nil(session)
		if session
			return session
		else
			""
		end
	end
end
