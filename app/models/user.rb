class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name,  :password
 
  has_many :posts, :dependent => :destroy

   
  def self.authenticate(login, password)
    user = find_by_login(login)
    return nil  if user.nil?
    return user if user.password == password
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
end
