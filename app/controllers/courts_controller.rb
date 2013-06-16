class CourtsController < InheritedResources::Base
  has_scope :page, :default => 1

  private

  def collection
    @q ||= end_of_association_chain.search(params[:q])
    @courts ||= @q.result(distinct: true)
  end
end
