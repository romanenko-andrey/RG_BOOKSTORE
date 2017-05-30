# :nodoc:
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, [Book, Category, Author, Bestseller, Newest, Review, Country]

    if user
      if user.admin?
        can :access, :rails_admin
        can :dashboard
        can :manage, :all
      else
        can :new, Review
        can :create, Review, user_id: user.id
        can :create, Book
        can :read, [BillingAddress, ShippingAddress]
        can :manage, User, id: user.id
        can [:read, :create, :update], Order, user_id: user.id
      end
    end
  end
end
