class User < ActiveRecord::Base
	has_many :products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
   	#Callbacks
	before_save { self.email = email.downcase }
	#before_save { self.username = username.downcase }
	before_create :prepare_username

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
			user.username = auth.info.name   # assuming the user model has a name
			user.fb_image = auth.info.image # assuming the user model has an image
			user.oauth_token = auth.credentials.token
    		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
		end
	end

	def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

private

	def prepare_username
	 self.username = self.firstname.downcase + self.lastname.downcase if self.provider != 'facebook'
	end
end
