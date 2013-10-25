class Ngo < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  require 'approval_job'
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  before_save :city_capitalize
  after_create :send_admin_mail
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.png"
  
  validates_attachment :avatar,
    :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png'] },
    :size => { :in => 0..2000.kilobytes }

  has_and_belongs_to_many :categories, :join_table => 'ngos_categories'
  
  validates_presence_of :name, :shortdesc, :email, :city, :state, :address2, :address1, :phone
  validates_uniqueness_of :name
  validates_length_of :name, :minimum => 3, :maximum => 100
  validates_length_of :password, :minimum => 6, :maximum => 18, on: :update, allow_blank: true
  validates_length_of :password, :minimum => 6, :maximum => 18, on: :create
  validates_presence_of :password, on: :create
  validates_length_of :shortdesc, :minimum => 6, :maximum => 141
  validates_associated :categories

  def self.search(search)
       if search
         where('lower(name) LIKE ?', "%#{search}%")
       else
         scoped
       end
     end
     def self.city_search(search)
          if search
            where('lower(city) LIKE ?', "%#{search}%")
          else
            scoped
          end
        end


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

	def send_admin_mail
    ::NewNGOWaitingForApprovalJob.new.async.perform(self)
	end

end
