class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
   has_many :doemus, dependent: :destroy
   has_many :likes, dependent: :destroy
   has_many :liked_doemus, through: :likes, source: :doemu
   
   has_many :doemus, dependent: :destroy
   validates :name, presence: true 
   validates :profile, length: { maximum: 200 } 

   has_many :comments, dependent: :destroy
  
  def already_liked?(doemu)
    self.likes.exists?(doemu_id: doemu.id)

   end
  
end
