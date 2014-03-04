module CustomersHelper
	def customer_sign_in(resource_or_scope, *args)
  		options  = args.extract_options!
  		scope    = Devise::Mapping.find_scope!(resource_or_scope)
  		resource = args.last || resource_or_scope

  		expire_data_after_sign_in!

  		if options[:bypass]
    		warden.session_serializer.store(resource, scope)
  		elsif warden.user(scope) == resource && !options.delete(:force)
    		# Do nothing. User already signed in and we are not forcing it.
    		true
  		else
       		warden.set_user(resource, options.merge!(scope: scope))
  		end
	end
end
