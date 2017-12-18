class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :pseudo, uniqueness: true
         validates :pseudo, presence: true
         validates :insta, url: true
         validates :facebook, url: true
         validates :youtube, url: true





         has_many :seeds
         has_many :picks
         has_attachment :photo
         has_many :user_preferences
         has_many :signal_seed



  def has_photo?
    self.photo?
  end


  def has_picked?(seed)
    seed.picks.where(user: self).any?
  end

  def has_signaled?(seed)
      seed.signal_seed.where(user: self).any?
  end

  def user_picked
    picks = Pick.where(user: self)
    seeds = []
    picks.each do |pick|
      seeds << pick.seed
    end
    seeds
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

  def snap?
    !self.snap.blank?
  end

  def social_links?
    facebook? || insta? || youtube? || snap?
  end

end
