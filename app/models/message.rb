class Message < ApplicationRecord
  belongs_to :user
  
  # before_save { self.email = email.downcase }
  # validates(:recipient, presence: true)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(
    :recipient, presence: true, length: {maximum: 255},
    format: { with: VALID_EMAIL_REGEX, message: "format is invalid. Please use a proper email address." }
  )
  validates(:message, presence: { message: "shouldn't be blank."})
  validate :validate_recipient
  
  def add_error(attribute, message)
    errors.add(attribute, message)
  end
  
  def validate_recipient
    @other_user = User.find_by(email: recipient.downcase)
    if (@other_user == nil) 
      add_error(:recipient, "#{recipient} doesn't exist.")
    end
  end
end
