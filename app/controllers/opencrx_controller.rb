class OpencrxController < InheritedResources::Base
  belongs_to :court

  def create
    Opencrx::connect("http://demo.opencrx.org", "guest", "guest")
    map = {
        lastName: parent.name
    }
    contact = Opencrx::Account::Contact.new(map).save
    parent.blob[:opencrx] = {}.merge(contact)
    parent.save!
    redirect_to court_path(parent), notice: 'Saved'
  end
end