class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    record.freelancer.offers.each do |offer|
      return false if offer.user == user
    end
    record.freelancer.user != user
  end
end
