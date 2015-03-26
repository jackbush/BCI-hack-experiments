# the user model
require 'mongoid'

class User

  include Mongoid::Document

  field :username, type: String

end
