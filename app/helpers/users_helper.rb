module UsersHelper
	def fresh_user?(user)
		user.created_at + 10.seconds > user.updated_at
	end
end
	
