class CountersController < ApplicationController
  before_action :set_counter

  def show
  end

  def increment_plus
    @counter.increment!(:plus)
    redirect_to root_path, notice: "Vote saved"
  end

  def increment_minus
    @counter.increment!(:minus)
    redirect_to root_path, notice: "Vote saved"
  end

  private

  def set_counter
    @counter = Counter.instance
  end
end
