class Ability
  include CanCan::Ability

  def initialize(user)
    
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    #raise user.inspect
    if user.role.name == 'Admin User'
      if user.access_token
      can :manage, :all
      else
       can :manage ,[Book]
       cannot :manage,[Location]
      end
     else
      can :read, :all
      #can [:read,:edit,:update], Book
    end
    # can :manage, [Review,Report,UsersLocation,RequestReview,AlertEmail,Group,RequestTemplate,Support,DesignSwitcher]
    #can [:edit,:read,:create,:destroy,:new,:update,:index], Location
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
