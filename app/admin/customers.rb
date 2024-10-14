ActiveAdmin.register Customer do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :full_name, :phone_number, :email, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :phone_number, :email, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # Specifies which parameters are permitted to be passed through the forms.
  permit_params :full_name, :phone_number, :email, :notes, :image

  # Defines how the form should look when creating or editing a customer record.
  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  # Defines how the show page should display the customer details.
  show do |customer|
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      # Display the customer's image, if an image is attached the image_tag is used to render the image in HTML
      row :image do |customer|
        image_tag url_for(customer.image) if customer.image.attached?
      end
    end
  end
end
