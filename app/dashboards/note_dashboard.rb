require "administrate/base_dashboard"

class NoteDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    content: Field::Text,
    short_answer: Field::String,
    question: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    familiarity: Field::Number,
    completation: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
    :content,
    :short_answer,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :title,
    :content,
    :short_answer,
    :question,
    :created_at,
    :updated_at,
    :familiarity,
    :completation,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :content,
    :short_answer,
    :question,
    :familiarity,
    :completation,
  ].freeze

  # Overwrite this method to customize how notes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(note)
  #   "Note ##{note.id}"
  # end
end
