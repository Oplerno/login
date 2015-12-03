class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :validatable,
    :recoverable,
    :rememberable,
    :trackable,
    :authy_authenticatable,
    :confirmable,
    :lockable

  validates_presence_of :email, :encrypted_password
  validates :password, presence: true, length: {minimum: 8}, on: :create
  validates :password_confirmation, presence: true, on: :create
# attr_accessible :email,
#   :privateemail,
#   :authy_enabled,
#   :password,
#   :password_confirmation,
#   :encrypted_password,
#   :current_sign_in_at,
#   :last_sign_in_at,
#   :current_sign_in_ip,
#   :last_sign_in_ip,
#   :sign_in_count,
#   :confirmed_at,
#   :confirmation_token,
#   :confirmation_sent_at,
#   :remember_me,
#   :remember_created_at

end
