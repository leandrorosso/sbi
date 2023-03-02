class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  connects_to shards: {
    default: { writing: :primary, reading: :primary },
    sbi1: { writing: :sbi1, reading: :sbi1 },
    sbi2: { writing: :sbi2, reading: :sbi2 },
  }
end
