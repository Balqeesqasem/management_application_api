class Task < ApplicationRecord
  # Constants
  STATUSES = [PENDING = "pending", IN_PROGRESS = "in_progress", COMPLETED = "completed", CANCELLED = "cancelled", ON_HOLD = "on_hold"]
  TAGS = [BACK_END = "back_end", FRONT_END = "front_end", DESIGN = "design", OTHERS = "others"]

  # Validations
  validates :title, :description, :status, presence: true
  validates :status, inclusion: { in: STATUSES, message: "must be one of #{STATUSES.join(", ")}" }
  validates :tag, inclusion: { in: TAGS, message: "must be one of #{TAGS.join(", ")}" }
  validate :unique_priority_within_tag

  # Enum
  enum status: STATUSES
  enum tag: TAGS

  concerning :Filtering do
    class_methods do
      def filterable_attributes
        ["status", "tag", "priority"]
      end
    end
  end

  private

  # Validate unique priority within the same tag
  def unique_priority_within_tag
    return if tag.blank? || priority.blank?

    if Task.where(tag: tag, priority: priority).where.not(id: id).exists?
      errors.add(:priority, "must be unique within the same tag")
    end
  end
end
