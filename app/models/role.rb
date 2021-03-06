class Role < ActiveRecord::Base
  has_and_belongs_to_many :departments
  has_and_belongs_to_many :permissions
  has_and_belongs_to_many :users
  validates_presence_of :name
  validates_uniqueness_of :name
  validate :must_belong_to_department

  # FIXME: only role of user admin permission can belong to more than one department. should user_admin role and loc_group roles be separated?
  def must_belong_to_department
    errors.add("Role must belong to at least one department.", "") if self.departments.empty?
  end
end

