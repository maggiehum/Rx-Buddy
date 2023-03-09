class RefillsController < ApplicationController
  def create
    @refill = Refill.new(params[:user_refill_id])
    @user_medication = UserMedication.find(params[:user_medication_id])
    @refill.user_medication = @user_medication
    if @refill.save
      redirect_to root_path
    else
      render 'user_medications/my_medications', status: :unprocessable_entity
    end
  end

  def update
    @refill = Refill.find(params[:id])
    @refill.update(refill_params)
    @refill.save
  end

  private

  def refill_params
    params.require(:refill).permit(:urgency)
  end
end