class Customer < ApplicationRecord
  has_one_attached :image

  # Validations of full name
  validates :full_name, presence: true

  # Allowlist associations for Ransack
  def self.ransackable_associations(auth_object = nil)
    [ "image_attachment", "image_blob" ]
  end
  # allowlist attributes for ransack
  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "email", "full_name", "id", "notes", "phone_number", "updated_at", "image" ]
  end
end
