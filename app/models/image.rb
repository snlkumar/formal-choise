class Image < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image,:styles => {:thumb=> "100x100#",:small  => "300x>",:large => "500x>",:medium => "400x400>"
        }
  validates_attachment_content_type :image,:content_type => /^image\/(png|gif|jpeg)/,:message => 'only (png/gif/jpeg) images'
end
