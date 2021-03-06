class SurveyObligation < ActiveRecord::Base

  belongs_to :user
  belongs_to :survey_definition

=begin

Overview
1) A Survey Obligations ties a user and a survey definition together
2) They should exist as soon as a user exists. As such all surveys for all users exist when at the start, and users submit their answers as the weeks go by
3) There cannot be two surveys with the same definition and week index for one user, i.e {definition: 4, week_index: 3}, {definition: 4, week_index: 3} is illegal

Requirements
1) The due_at and expires_at are generated as a function of the team's program_starts_at, the week index, and the lateness_allowed
2) On submission the submission values must in compliance the definitions's format requirements
3) The submitted_at value must be generated when a valid submission is applied
4) Submissions must look like {k1: v1...kn: vn} where k and v correspond to this obligation's definition's format specification

=end

  alias_attribute :definition, :survey_definition


 # validate_uniqueness_of :user_id :survey_definition_id :due_at
end