class Exchange < ActiveRecord::Base

  def self.balance
    self.all.reduce(0.0) {|sum, i| sum + i.amount}
  end

  def self.transactions
    self.count
  end

  # def self.list_of_transactions
  #   array = []
  #   self.all.each do |t|
  #     array << t
  #   end
  #   array
  # end
end
