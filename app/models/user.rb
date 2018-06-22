class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :pseudo, uniqueness: true
   validates :pseudo, presence: true
   # validates :insta, url: true
   # validates :facebook, url: true
   # validates :youtube, url: true

   has_many :seeds
   has_many :picks
   has_many :exchanges
   has_many :addresses, dependent: :destroy
   accepts_nested_attributes_for :addresses
   has_attachment :photo
   has_many :user_preferences
   has_many :signal_seed

  after_create :send_welcome_email
  after_create :subscribe_to_newsletter

  extend FriendlyId
  friendly_id :pseudo, use: :slugged


  def has_photo?
    self.photo?
  end

  def has_picked?(seed)
    seed.picks.where(user: self).any?
  end

  def has_signaled?(seed)
      seed.signal_seed.where(user: self).any?
  end


  def mini_bio?
    !self.mini_bio.blank?
  end

  def facebook?
    !self.facebook.blank?
  end

  def insta?
    !self.insta.blank?
  end

  def youtube?
    !self.youtube.blank?
  end

  def twitter?
    !self.twitter.blank?
  end

  def social_links?
    facebook? || insta? || youtube? || twitter?
  end

  def social_card?
    mini_bio? || social_links? || seeder_other_seeds?
  end

  def seeder_other_seeds?
    self.seeds.count - 1 > 0
  end

  def seeder_other_seeds_list(seed)
    self.seeds.reject{|current| current == seed}
  end


  private

  def send_welcome_email
    # UserMailer.welcome(self).deliver_now
    UserMailer.welcome(self.id).deliver_later(wait_until: 1.day.from_now)

  end

  def subscribe_to_newsletter
    AddUserToMarketingListJob.perform_later(self.id)
  end

end
