class Leave < ApplicationRecord
    belongs_to :user
    enum status: {rejected: 0, pending: 1, approved: 2, canceled_by_user: 4, canceled_by_admin: 5}

end