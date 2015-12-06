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

end
