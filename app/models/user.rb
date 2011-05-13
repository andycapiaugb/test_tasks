class User < ActiveRecord::Base
  has_many :steps
  has_many :taskrequests
  has_many :tasks, :through => :taskrequests
  
  attr_accessible :login, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_uniqueness_of :login
  #validates: should not start with a number => usernames will be converted to an integer to see if an executer is a specific person or a label, like "_self". The .to_i method will result in zero for a string that starts with a character; however it will return an integer if the username starts with an integer

  def self.authenticate(login, password)
    user = self.find_by_login(login)

    if user && user.password_hash == Digest::SHA1.hexdigest(password + 'My password can not be guessed' + user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = Digest::SHA1.hexdigest('My salt can not be guessed' + Time.now.to_s)
      self.password_hash = Digest::SHA1.hexdigest(password + 'My password can not be guessed' + password_salt)
    end
  end
end
