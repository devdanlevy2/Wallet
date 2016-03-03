class Exchange < ActiveRecord::Base

  def self.balance
    self.all.reduce(0.0) {|sum, i| sum + i.amount}
  end

  def self.transactions
    self.count
  end

  def self.current_monthly_spendings
    current_monthly_spendings = []
    self.all.each do |c|
      current_monthly_spendings << c.amount if c.amount < 0 && (Time.now.mon == c.created_at.mon)
    end
    current_monthly_spendings = current_monthly_spendings.reduce(0.0) {|sum, c| sum += c}
  end

  def self.last_months_spendings
    last_months_spendings = []
    self.all.each do |c|
      last_months_spendings << c.amount if c.amount < 0 && ((Time.now.mon - 1) == c.created_at.mon)
    end
    last_months_spendings = last_months_spendings.reduce(0.0) {|sum, c| sum += c}
  end

  def self.total_monthly_transactions
    total_monthly_transactions = []
    self.all.each do |c|
      total_monthly_transactions << c.amount if (Time.now.mon == c.created_at.mon)
    end
    total_monthly_transactions = total_monthly_transactions.reduce(0.0) {|sum, c| sum += c}
  end

  def self.total_last_months_transactions
    total_last_months_transactions = []
    self.all.each do |c|
      total_last_months_transactions << c.amount if ((Time.now.mon - 1) == c.created_at.mon)
    end
    total_last_months_transactions = total_last_months_transactions.reduce(0.0) {|sum, c| sum += c}

  end

  def self.largest_current_month
    largest_current_month = []
    self.all.each do |c|
      largest_current_month << c.amount if (Time.now.mon == c.created_at.mon)
    end
    largest_current_month.max
  end

  def self.largest_total_expense

  end


  # def self.list_of_transactions
  #   array = []
  #   self.all.each do |t|
  #     array << t
  #   end
  #   array
  # end
end
