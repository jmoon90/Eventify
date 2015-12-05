class HomeController < ApplicationController
  def index
    @month_of_the_year = month_of_the_year
    @number_of_tickets = number_of_tickets
  end

  def number_of_tickets
    [[1],[2],[3]]
  end

  def month_of_the_year
    [['Jan 2016'] ,['Feb 2016']]
  end
end
