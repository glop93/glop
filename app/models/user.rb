class User < ActiveRecord::Base
	has_many :products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   	#Callbacks
	before_save { self.email = email.downcase }
	#before_save { self.username = username.downcase }
	before_create :prepare_username

private

	def prepare_username
	 self.username = self.firstname.downcase + self.lastname.downcase
	end
end
