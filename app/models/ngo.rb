class Ngo < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  before_save :city_capitalize

  has_and_belongs_to_many :categories, :join_table => 'ngos_categories'
  
  validates_presence_of :name, :shortdesc, :email, :city, :state, :address2, :address1, :phone
  validates_uniqueness_of :name
  validates_length_of :name, :minimum => 3, :maximum => 100
  validates_length_of :password, :minimum => 6, :maximum => 18, on: :update, allow_blank: true
  validates_length_of :password, :minimum => 6, :maximum => 18, on: :create
  validates_presence_of :password, on: :create
  validates_length_of :shortdesc, :minimum => 6, :maximum => 141

  def city_capitalize
    city.capitalize!
  end

  def active_for_authentication? 
	  super && approved? 
	end 

	def inactive_message 
	  if !approved? 
	    :not_approved 
	  else 
	    super # Use whatever other message 
	  end 
	end

	#after_create :send_admin_mail
	def send_admin_mail
	  AdminMailer.new_ngo_waiting_for_approval(self).deliver
	end

end
