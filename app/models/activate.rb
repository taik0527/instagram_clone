# == Schema Information
#
# Table name: activates
#
#  id           :bigint           not null, primary key
#  action_type  :integer          not null
#  read         :boolean          default(FALSE), not null
#  subject_type :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  subject_id   :bigint
#  user_id      :bigint           not null
#
# Indexes
#
#  index_activates_on_subject_type_and_subject_id  (subject_type,subject_id)
#  index_activates_on_user_id                      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Activate < ApplicationRecord
end
