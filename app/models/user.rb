class User < ActiveRecord::Base
  belongs_to :signature
  has_one :petition
  belongs_to :petition
  has_many :microposts
  has_many :friends
  has_many :payments
  #has_many :authentications
  has_one :vote
  has_one :cart
  has_many :itempairs


  accepts_nested_attributes_for :cart

  attr_accessible :name, :email, :votesleft, :country, :password, :password_confirmation, :remember_token
  #has_secure_password
  after_initialize :bobo



  #before_save { |user| user.email = email.downcase }
 # before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }, :on => :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }, :if => :not_twitter?
#  validates :password, presence: true, length: { minimum: 6 }, :on => :create
#  validates :password_confirmation, presence: true, :on => :create
  validates :votesleft, presence: true, :numericality =>
				{ :greater_than_or_equal_to => 0, :less_than_or_equal_to => 3 }



    def not_twitter?
      return false
#      if user.provider == 'twitter'
#        return false
#      else
#        return true
#      end
    end

    def self.from_omniauth(auth)
        #find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
        find_by_email(auth["info"]["email"]) || create_with_omniauth(auth)
    end

    def self.create_with_omniauth(auth)
      create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.name = auth["info"]["name"]
        user.email = auth["info"]["email"]
      end
    end

    def apply_omniauth(omniauth)
		authentications.build(:provider => omniauth['provider'],:uid => omniauth['uid'])
    end


    def create_remember_token
        if new_record?
			self.remember_token = SecureRandom.urlsafe_base64
		end
    end



scope :search_by, lambda {|userid| where(:id => userid) }

private
def bobo
  if new_record?
    self.votesleft ||= 3
	self.petitioner ||= "no"
	self.confirmed ||= "false"
	self.signer ||= "no"
  end
end

  end
