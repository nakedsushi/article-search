require 'pathname'

class AudioSerializer < ActiveModel::Serializer
  attributes :path

  def path
    absolute_path = Pathname.new(object.clip.path)
    project_root = Pathname.new(Rails.root)
    absolute_path.relative_path_from(project_root + 'public').to_s
  end
end