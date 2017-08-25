class EmicalcController < ApplicationController
  def calc
  	@meta_title = meta_title 'Emi Calculator for Loan'
    @meta_description = 'EMI Calculator - Calculate Monthly Installment (EMI) for Loan in India'
    @meta_keywords = 'EMI Calculator, India, Monthly Installment, Calculator, Loan'
  	if params[:calculator] != nil
	  	@inputs = [params[:calculator][:principal], params[:calculator][:term], params[:calculator][:interest]]
	  	invalid_input = 0
		@inputs.each do |input|
		  unless (Float(input) != nil rescue false) and input.to_i > 0
		    invalid_input += 1
		    break
		  end
		end
		if invalid_input == 0
			@principal = params[:calculator][:principal].to_i
			@term = params[:calculator][:term].to_i
			@rate = params[:calculator][:interest].to_f
			@r = @rate/12.0/100
		  	@t = (1 + @r) ** @term
		  	@em = @principal * @r * @t / (@t - 1)
		  	@result = @em.round
		  	@amount = @result * @term
		  	@intrst = @amount - @principal
		else
			@principal = params[:calculator][:principal]
			@term = params[:calculator][:term]
			@rate = params[:calculator][:interest]
			@message = "Please Enter the valid Input"
		end
	end
  end
end
