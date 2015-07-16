class TimetablesController < ApplicationController

  def set_table

    @time_array = ["오전 9시", "오전 10시", "오전 11시", "정오(12시)", "오후 1시", "오후 9시", "오후 10시", "오후 11시", "자정(12시)"]

  end
  def save

    week_string = Oneweek.int_to_s(params[:week].to_i)

    time_array = ["오전 9시", "오전 10시", "오전 11시", "정오(12시)", "오후 1시", "오후 9시", "오후 10시", "오후 11시", "자정(12시)"]

    0.upto(time_array.length - 1) do |classnumber|
      0.upto(6) do |daynumber|
        class_params = params["class_#{classnumber}_#{daynumber}"]

        if (class_params != nil && class_params.to_i != 0)

          current_user.make_class(classnumber, daynumber, week_string)



        end

      end

    end
    


    render :json => ["success"]

  end
end
