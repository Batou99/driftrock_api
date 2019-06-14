require_relative 'most_sold'
require_relative 'most_loyal'
require_relative 'total_spend'

class Parser
  MOST_SOLD   = "most_sold"
  MOST_LOYAL  = "most_loyal"
  TOTAL_SPEND = "total_spend"

  def usage
    %q(
      Usage: ruby app.rb COMMAND PARAMETERS
      Valid Commands:
        most_sold
        total_spend EMAIL
        most_loyal
    )
  end

  def initialize(args)
    @command = args[0]
    @params  = args[1]
  end

  def parse!
    puts case @command
         when MOST_SOLD
           MostSold.run
         when TOTAL_SPEND
           @params ? TotalSpend.run(@params) : usage
         when MOST_LOYAL
           MostLoyal.run
         else
           usage
         end
  end
end
