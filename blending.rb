module Blending
  extend ActiveSupport::Concern

  included do
    after_save :make_juice
  end

  def make_juice
    #Todo
  end
end