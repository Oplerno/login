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

  protected

  def send_devise_notification(notification, *args)
    if notification == :reset_password_instructions
      message = devise_mailer.send(notification, self, *args)
      message.deliver_now
      unless self.privateemail.nil?
        message.to = self.privateemail
        message.deliver_now
      end
    end
  end
end
