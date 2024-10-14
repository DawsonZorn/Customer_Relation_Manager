Rails.application.config.to_prepare do # This block is executed every time the application is loaded, ensuring that your customizations to the ActiveStorage::Attachment class are applied correctly.
  ActiveStorage::Attachment.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      [ "blob_id", "created_at", "id", "name", "record_id", "record_type" ]
    end
  end
end
