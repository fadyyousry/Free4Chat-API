class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, User, id: user.id

    can :read, Chat
    can :manage, Chat, owner_id: user.id

    can :read, Connection
    can [:create, :destroy], Connection, user_id: user.id
    can :update, Connection, chat_id: user.owned_chat_ids

    can :read, Message
    can :create, Message, chat_id: user.chat_ids
    can :destroy, Message, user_id: user.id

  end
end