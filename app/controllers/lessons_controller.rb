# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: :next_question

  def learn
    SpreadsheetImporter.new(current_user).call(deck.cards)

    @lesson = lesson || deck.lessons.create!
    card_id = deck.cards.first.id || deck.cards.create!(front: 'sample', back: 'sample').id
    4.times do
      @lesson.answers.create!(card_id: card_id)
    end
    @lesson.save!
  end

  def next_question
    @lesson = lesson
    @lesson.answers.last.update(answer: params[:answer])
    @lesson.answers.create(card_id: @lesson.next_card_id)
    respond_to do |format|
      format.js
    end
  end

  private

  def deck
    Deck.find(params[:deck_id])
  end

  def lesson
    deck.lessons.first
  end
end
