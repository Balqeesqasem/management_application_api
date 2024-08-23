class Task < ApplicationRecord
  # Constant
  STATUS = [PENDING = "pending", IN_PROGRESS = "in_progress", COMPLETED = "completed", CANCELLED = "cancelled", ON_HOLD = "on_hold"]
  TGA = [BACK_END = "back_end", FRONT_END = "front_end", DESIGN = "design", OTHERS = "others"]

  #Validations
  validates :title, :description, :status, presence: true
  validate :unique_priority_within_tag

  #Enum
  enum status: STATUS
  enum tag: TGA

  def unique_priority_within_tag
    return if tag.blank? || priority.blank?

    if Task.where(tag: tag, priority: priority).where.not(id: id).exists?
      errors.add(:priority, "must be unique within the same tag")
    end
  end
end
