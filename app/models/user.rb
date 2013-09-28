class User < ActiveRecord::Base
  extend Enumerize
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
		 :token_authenticatable

  enumerize :role, in: { editor: 1 }, scope: true
  enumerize :block_status, in: { unblocked: 1, blocked: 2 }, scope: true, default: :unblocked

  # Example creation of User with role
  # new_user = User.create(email: 'blabla@bla.com', password: '12345678', role: :user)

  # Checking role:
  # new_user.role.editor? (returns true or false)

  # Selecting all users with given role (A.K.A. scoping):
  # User.with_role(:editor)
end
