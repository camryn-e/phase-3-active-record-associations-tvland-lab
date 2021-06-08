class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network


  def actors_list
    arr = []
    self.actors.all.each { |a| arr << "#{a.full_name}"}
    arr
  end

  def build_network(new_network)
    n = Network.find_or_create_by(new_network)
    self.network = n
    self.network
  end

end