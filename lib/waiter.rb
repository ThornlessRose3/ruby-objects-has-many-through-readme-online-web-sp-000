class Waiter

  attr_accessor :name, :years_experience
 
  @@all = []
 
  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end
 
  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    best_tipper = nil
    best_tip = 0
    best_tipper = Meal.all.select do |meal|
      if meal.tip > best_tip
        best_tip = meal.tip
        best_tipper = meal
      end
    end
    Meal.all.select do |meal|
      meal.waiter == self && meal.tip == best_tip
  
  end

end