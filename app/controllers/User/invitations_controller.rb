class User::InvitationsController < Devise::InvitationsController
  def new
    self.resource = resource_class.new
    render :new
  end 
end