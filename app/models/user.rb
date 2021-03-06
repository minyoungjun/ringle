class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]


    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.name = auth.info.name
        user.uid = auth.uid
        user.email = auth.info.email
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = auth.credentials.expires_at
        user.password = Devise.friendly_token[0,20]
      end
    end

    def make_class(classnumber, daynumber, week_string)

      week = Oneweek.from_string(week_string)

    end


end

