require "administrate/base_dashboard"

class CardDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    answers: Field::HasMany,
    deck: Field::BelongsTo,
    id: Field::Number,
    front: Field::String,
    back: Field::String,
    active: Field::Boolean,
    memorized: Field::Boolean,
    correct_answers: Field::Number,
    wrong_answers: Field::Number,
    empty_answers: Field::Number,
    word_class: Field::String.with_options(searchable: false),
    last_showed_at: Field::DateTime,
    marked_as_memorized: Field::DateTime,
    last_correct_answer: Field::DateTime,
    last_wrong_answer: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :answers,
    :deck,
    :id,
    :front,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :answers,
    :deck,
    :id,
    :front,
    :back,
    :active,
    :memorized,
    :correct_answers,
    :wrong_answers,
    :empty_answers,
    :word_class,
    :last_showed_at,
    :marked_as_memorized,
    :last_correct_answer,
    :last_wrong_answer,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :answers,
    :deck,
    :front,
    :back,
    :active,
    :memorized,
    :correct_answers,
    :wrong_answers,
    :empty_answers,
    :word_class,
    :last_showed_at,
    :marked_as_memorized,
    :last_correct_answer,
    :last_wrong_answer,
  ].freeze

  # Overwrite this method to customize how cards are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(card)
  #   "Card ##{card.id}"
  # end
end
