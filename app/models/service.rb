class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category

#   def self.search(search)
#     if search
#       service = Service.find_by(title: search)
#       if service
#         self.where(service_title: service)
#       else
#         Service.all.limit(3)
#       end
#     else
#       Service.all.limit(3)
#     end
#   end
# end
  def self.search(search)
   @service = Service.where('title LIKE :search OR id LIKE :search', search: "%#{params[:search]}%")
  end
end