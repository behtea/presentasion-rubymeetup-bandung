class User < ActiveRecord::Base
	# Setup carrierwave
	require 'carrierwave/orm/activerecord'
	mount_uploader :avatar, AvatarUploader

	has_many :conversations

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache

end
