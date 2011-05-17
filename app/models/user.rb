class User < ActiveRecord::Base
  set_table_name 'jos_users'

  has_many :steps
  has_many :taskrequests
  has_many :tasks, :through => :taskrequests
  
  self.abstract_class = true
  establish_connection  :adapter => "mysql2", :host => "mysql03.combell.com", :database => "19997_geraardsbergenbe", :username => "19997_geraardsbergenbe", :password => "Hri89Ae0"

  def login
    self.username
  end  

  def self.authenticate(login, password)
    user = self.find_by_username(login)
    user_password = user.password[0..31]
    user_salt = user.password[33..-1]

    if user && user_password == Digest::MD5.hexdigest(password + user_salt)
      user
    else
      nil
    end
  end

end
