Factory.define :valid_user, :class => User do |u|
  u.email 'john@doe.com'
  u.password 'john'
  u.password_confirmation 'john'
end

Factory.define :invalid_user, :class => User do |u|
  # empty user
end
