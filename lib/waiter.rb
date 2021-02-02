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
    tips = self.meals.each{ |t| t[3]}.max{|a,b| a<=> b}
    best_tipper = Meal.all.select do |meal|
      meal.tip == tips
      meal.customer
    end
    #just_tips = tips.each{ |t| t[3]}
    #just_tips.max{|a,b| a <=> b}
  end

end