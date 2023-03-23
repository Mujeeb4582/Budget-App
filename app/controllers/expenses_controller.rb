class ExpensesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses.order(updated_at: params[:order] || :desc)
    @total_amount = @expenses.sum(:amount)
  end

  def new
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.build
  end

  def create
    @expense = Expense.new(expense_params)
    @category = Category.find(params[:category_id])
    @expense.user = current_user
    @expense.categories << @category

    if @expense.save
      flash[:notice] = 'Expense was successfully created!'
    else
      flash[:alert] = 'Expense could not be created!'
    end

    redirect_to category_expenses_path
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
