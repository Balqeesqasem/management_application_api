class TaskSerializer < ApplicationSerializer
  fields :title, :description, :tag, :priority, :status
end
