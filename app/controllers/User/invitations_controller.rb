class User::InvitationsController < Devise::InvitationsController
	 def new
    binding.pry
    self.resource = resource_class.new
    render :new
  end 
end