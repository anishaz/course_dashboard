class Dojo < ActiveRecord::Base
  def index
    @dojos = Dojo.all
  end
end
