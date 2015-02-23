#ecoding: utf-8
class ContactController < ParentController
  def index
    @obj = Contact.first
  end
end