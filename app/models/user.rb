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

  def persnr
    self.connection.select_value("SELECT persnr FROM `jos_users` INNER JOIN `jos_usermeta` ON `jos_users`.`id` = `jos_usermeta`.`user_FK` WHERE `jos_users`.`id` = #{self.id}")
  end

  def osn_codes
    result_array = []
    self.connection.execute("SELECT osn1, osn2, osn3 FROM `jos_gb_s_structuur` WHERE `jos_gb_s_structuur`.`persnr` = #{self.persnr}").each do |osn_group|
      result_array = result_array.zip(osn_group).flatten
    end.flatten.reject{|x| x ==0}
  end

  def superior
    osn_codes_sql_string = self.osn_codes.to_s.gsub("[", "(").gsub("]", ")")
    sql = ActiveRecord::Base.sanitize("SELECT `superior` FROM `jos_gborg_superiors` WHERE `jos_gborg_superiors`.`osn` IN #{osn_codes_sql_string}").gsub("'", "")
    superior_persnr = self.connection.execute(sql).first
    if superior_persnr
      superior_persnr = superior_persnr[0]
        User.find_by_persnr(self.connection.select_value(sql))
    else
      self.top_superior
    end
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

  def self.superior_of_osn(osn_code)
    superior_persnr = self.connection.select_value("SELECT `superior` FROM `jos_gborg_superiors` WHERE `jos_gborg_superiors`.`osn` = #{osn_code}")
    User.find_by_persnr(superior_persnr) if superior_persnr
  end

  def self.find_by_persnr(persnr)
    user_id = self.connection.select_value("SELECT user_FK FROM `jos_usermeta` WHERE `jos_usermeta`.`persnr` = #{persnr}")
    User.find(user_id) if user_id
  end

  def top_superior
    top_superior_id = self.connection.select_value("SELECT persnr FROM `jos_gb_s_structuur` WHERE `osn1` > 0 ORDER BY `osn1`")
    User.find_by_persnr(top_superior_id)
  end
end
