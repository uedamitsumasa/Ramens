class User < ApplicationRecord
  has_one_attached :profile_image
  has_many :reviews, dependent: :destroy
  has_many :replies, dependent: :destroy

    # フォローをした、されたの関係
  has_many :follows, class_name: "Follow", foreign_key: "follow_id", dependent: :destroy
  has_many :reverse_of_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :follows, source: :follower
  has_many :followers, through: :reverse_of_follows, source: :follow

  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/ #正規表現を//で/正規表現/とサンドすることを忘れないよう
  validates :post_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }

    # フォローしたときの処理
    # user_id: フォローされる人のid
  def follow(user_id)
    follows.create(follower_id: user_id.to_i)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    follows.find_by(follower_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
