class Counter < ApplicationRecord
  def self.instance
    first_or_create!
  end

  def saldo
    plus - minus
  end
end
