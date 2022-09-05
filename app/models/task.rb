# frozen_string_literal: true

class Task < ApplicationRecord
  MAX_BODY_LENGTH = 125
  validates :body, presence: true, length: { maximum: 125 }
  validates :slug, uniqueness: true
  validate :slug_not_changed

  before_create :set_slug

  private

    def set_slug
      itr = 1
      loop do
        body_slug = body.parameterize
        slug_candidate = itr > 1 ? "#{body_slug}-#{itr}" : body_slug
        break self.slug = slug_candidate unless Task.exists?(slug: slug_candidate)

        itr += 1
      end
    end

    def slug_not_changed
      if slug_changed? && self.persisted?
        errors.add(:slug, t("task.slug.immutable"))
      end
    end
end
