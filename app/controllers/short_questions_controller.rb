class ShortQuestionsController < ApplicationController
  before_action :set_short_question, only: [:show, :edit, :update, :destroy]

  # GET /short_questions
  # GET /short_questions.json
  def index
    @short_questions = ShortQuestion.all
  end

  # GET /short_questions/1
  # GET /short_questions/1.json
  def show
  end

  # GET /short_questions/new
  def new
    @short_question = ShortQuestion.new
  end

  # GET /short_questions/1/edit
  def edit
  end

  # POST /short_questions
  # POST /short_questions.json
  def create
    @short_question = ShortQuestion.new(short_question_params)

    respond_to do |format|
      if @short_question.save
        format.html { redirect_to @short_question, notice: 'Short question was successfully created.' }
        format.json { render :show, status: :created, location: @short_question }
      else
        format.html { render :new }
        format.json { render json: @short_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /short_questions/1
  # PATCH/PUT /short_questions/1.json
  def update
    respond_to do |format|
      if @short_question.update(short_question_params)
        format.html { redirect_to @short_question, notice: 'Short question was successfully updated.' }
        format.json { render :show, status: :ok, location: @short_question }
      else
        format.html { render :edit }
        format.json { render json: @short_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /short_questions/1
  # DELETE /short_questions/1.json
  def destroy
    @short_question.destroy
    respond_to do |format|
      format.html { redirect_to short_questions_url, notice: 'Short question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_question
      @short_question = ShortQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_question_params
      params.require(:short_question).permit(:question, :answer, :note_id)
    end
end
