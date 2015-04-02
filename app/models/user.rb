class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         belongs_to :team
         has_many :invites
         belongs_to :game
        

  def full_name
          first_name + " " + last_name
  end

  def full_nickname
  	first_name + " " + '"'+nickname+'"' + " " + last_name
  end
  mount_uploader :avatar, AvatarUploader
end
