class UsersController < ApplicationController

    def index
        if params[:search]
            @users = User.where(name: params[:search][:friend])
            puts "paraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaams[:search]"
            puts params[:search][:friend]
            puts "paraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaams[:search]"
            # if params[:search][:date] != ""
            #     @flights_dates = Flight.all.where(begin_datetime: "#{params[:search][:date]}")
            # end
            
            # if params[:search][:from] != ""
            #     @from_airport = Airport.find_by(code: params[:search][:from])
            #     @flights_froms = Flight.all.where(start_id: @from_airport)
            # end
            
            # if params[:search][:to] != ""
            #     @to_airport = Airport.find_by(code: params[:search][:to])
            #     @flights_tos = Flight.all.where(finish_id: @to_airport)
            # end
            
            
            
            # puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@flights_dates_count"
            # puts @flights_dates.count
            
            # puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@flights_froms_count"
            # puts @flights_froms.count
            
            # @flights = @flights_dates & @flights_froms & @flights_tos
            
            
            
            # if params[:search][:date] != ""
            #     @flights = Flight.all.where(start_id: "#{@from_airport.id}", finish_id: "#{@to_airport.id}", begin_datetime: "#{params[:search][:date]}")
            # else
            #     @flights = Flight.all.where(start_id: "#{@from_airport.id}", finish_id: "#{@to_airport.id}")
            # end


            
        else
            
            @users = User.all
            
        end
    end
end
