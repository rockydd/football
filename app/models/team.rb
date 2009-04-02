class Team < ActiveRecord::Base
  has_and_belongs_to_many :members,
    :class_name=>"User",
    :join_table=>"membership",
    :association_foreign_key=>"member_id"
  belongs_to :owner,
    :class_name=>"User",
    :foreign_key => "owner_id"
  has_many :comments, :as=>:commentable

    validates_presence_of     :name
    validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => false 
    validates_length_of       :name,     :maximum => 100
    validates_uniqueness_of   :name

    validates_presence_of     :owner_id
    #validates_format_of     :owner_id, :allow_nil => false
end

