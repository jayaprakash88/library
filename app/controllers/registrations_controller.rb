class RegistrationsController < Devise::RegistrationsController
	def new
		super
		3.times do
   		 user_picture = @user.user_pictures.build
   	# raise user_picture.inspect
 	    end
	end

	def create
		super
	
      if @user.save!

        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @user.user_pictures.create(photo: image)
          }
        end
    end
  end

  #def load_image
   #@random_image = current_user.user_pictures.order("RANDOM()").first
 #end
end