class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :member_communities
  has_many :communities, through: :member_communities
  belongs_to :group
  has_many :reviews

  def foreign_communities
    Community.where.not(id: self.community_ids).order(name: :asc)
  end
end
