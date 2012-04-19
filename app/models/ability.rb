class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
     if user.person.sys_user?
     
     end
     if user.person.sys_manager?
       can :manage, Person do |person|
         user.authorized_for_person?(person.id) or person.created_at.blank? or person.created_at > Time.now - 20.minutes #give temporary access to people recently created...
       end
       can :manage, Store
       can :manage, Employment
       can [:read, :create, :update], Appraisal do |appraisal|
         user.authorized_for_appraisal?(appraisal.id)
       end
       can :perform, Appraisal do |appraisal|
         user.appraiser_for?(appraisal.id)
       end
     end
     if user.person.sys_executive?
       can :manage, Person do |person|
         user.authorized_for_person?(person.id)
         #person.created_at.blank? or person.created_at > Time.now - 20.minutes 
       end
       #can :manage, Employment
       can [:review, :approve, :unapprove], Appraisal do |appraisal|
         user.reviewer_for?(appraisal)
       end
     end
     if user.person.sys_admin?
       can :manage, :all
     end
      
    #end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
   #@user = user || User.new # for guest
   #@user.role_names.each { |role| send(role) }
  end
  
#def user
#   
#end
# 
#def manager
#  user
#  can :manage, Person do |person|
#    authorized_for_person?(person)
#  end
#  can :read, Store
#end
#  
#def executive
#  manager
#end
#  
#def admin
#  executive
#  can :manage, :all
#end
    
end
