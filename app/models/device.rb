require 'digest/md5'

class Device < ActiveRecord::Base
  attr_accessor :password
  validates_uniqueness_of :name
  validates_presence_of :name, :password
  
  before_create :before_create
  
  def authoricate(name, password)
    return false if name != self.name
    return false if password.nil?
    return false if Device.crypt_password(password, self.salt) != self.crypted_password
    true
  end

  def before_create
    self.salt = Device.new_salt
    self.crypted_password = Device.crypt_password(self.password, self.salt)
  end
  
  private
  def self.crypt_password(password, salt)
    Digest::MD5.hexdigest(password + salt)
  end

  def self.new_salt
    s = rand.to_s.tr('+', '.')
    s[0, if s.size > 32 then 32 else s.size end]
  end
end
