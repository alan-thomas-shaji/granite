# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include ActionView::Helpers::TranslationHelper
  self.abstract_class = true

  def erros_to_sentence
    erros.full_messages.to_sentence
  end
end
