class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  # attach avatar with paperclip
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # enumerate roles
  extend Enumerize
  enumerize :role, in: [:student,:instructor,:director]
  # has one location
  belongs_to :location
  # has many enrollments
  has_many :enrollments
  has_many :cohorts, through: :enrollments
end
