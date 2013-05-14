class Student < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :city
  belongs_to :district

  has_secure_password

  attr_accessible :tc, :first_name, :last_name, :email, :password, :phone_number, :gender, :birthday, :address, :city_id, :district_id
  validates_presence_of :email, :tc, :first_name, :last_name
  validates_uniqueness_of :email, :tc
  mount_uploader :pdf, PdfUploader
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
