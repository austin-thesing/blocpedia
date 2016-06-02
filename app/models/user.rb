class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  # => Defaults a User to a standard account on creation
  before_save { self.role ||= :standard }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  enum role: [:standard, :premium, :admin]

  has_many :wikis
  has_many :collaborators
end
