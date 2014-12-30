class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable, :omniauthable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_writer :current_step
  
  mount_uploader :image, ImageUploader
  has_many :authorizations, dependent: :destroy
  
  # validates_presence_of :shipping_name, :if => lambda { |o| o.current_step == "shipping" }
  # validates_presence_of :billing_name, :if => lambda { |o| o.current_step == "billing" }

  def has_authorizations?
    true if authorizations.count.to_i > 0
  end

  def current_step
    @current_step || steps.first
  end

  def steps
    %w{basic_informations who_am_i}
  end

  def next_step
    self.current_step = steps[steps.index(current_step) + 1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step) - 1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end
  
  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(provider: auth.provider, uid: auth.uid.to_s, token: auth.credentials.token, secret: auth.credentials.secret).first_or_initialize

    if authorization.user.blank?
      user = current_user.nil? ? User.where('email = ?', auth.info.email).first : current_user
      if user.blank?
        user = User.new
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
        user.email = auth.info.email
        user.remote_image_url = auth.info.image.gsub('http://','https://')
        user.current_step = :who_am_i
        user.save!
      end

      authorization.username = auth.info.name
      authorization.user_id = user.id
      authorization.save
    end
    authorization.user
  end 
end
