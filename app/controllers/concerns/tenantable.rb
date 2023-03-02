module Tenantable
  extend ActiveSupport::Concern

  private

  def read_with_tenant(&block)
    companies = Company.find_by!(abbreviation: request.subdomain)

    ActiveRecord::Base.connected_to(role: :reading, shard: companies.abbreviation.to_sym) do
      block.call
    end
  end

  def write_with_tenant(&block)
    hospitals = Hospital.find_by!(abbreviation: request.subdomain)

    ActiveRecord::Base.connected_to(role: :writing, shard: companies.abbreviation.to_sym) do
      block.call
    end
  end
 end