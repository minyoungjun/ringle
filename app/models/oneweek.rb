class Oneweek < ActiveRecord::Base

    def self.int_to_s(input)

      return (Time.now + input.to_i.week).beginning_of_week.to_s

    end


    def self.from_string(week_string)

      if Oneweek.where(:monday => week_string).count == 0

        oneweek = Oneweek.new
        oneweek.monday = week_string
        oneweek.save

      else
        oneweek = Oneweek.where(:monday => week_string).first

      end

      return oneweek

    end

end
