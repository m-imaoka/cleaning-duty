class EmployeesController < ApplicationController
  def index
    render status: 200, json: Employee.all
  end

  def create
    employee = Employee.new(create_params)
    if employee.save
      render status: 201, json: { uri: employee_path(employee) }
    else
      render status: 400, json: { errors: employee.errors.to_hash(true) }
    end
  end

  private

  def create_params
    params.require(:employee).permit(
        :name,
        :sex
    )
  end
end
