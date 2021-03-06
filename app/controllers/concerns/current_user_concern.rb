module CurrentUserConcern
  extend ActiveSupport::Concern
  def current_user
    #current user true = super
    super or guest_user
  end

  def guest_user
    OpenStruct.new(name:"Guest User",
                   first_name: "Guest",
                   last_name: "User",
                   email: "guest@mail.com"
                   )
  end
end 