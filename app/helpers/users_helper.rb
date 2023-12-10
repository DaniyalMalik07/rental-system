module UsersHelper
  def all_users
    User.all.map { |user| ["#{user.first_name} #{user.last_name}", user.id] }
  end
end
