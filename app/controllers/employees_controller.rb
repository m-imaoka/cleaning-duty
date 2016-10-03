class EmployeesController < ApplicationController
  def index
    render status: 200, json: Employee.all
  end

  def show
    employee = Employee.find(params[:id])
    render status: 200, json: employee.to_json 
  end

  def create
    employee = Employee.new(employee_params)
    if employee.save
      render status: 201, json: { uri: employee_path(employee) }
    else
      render status: 400, json: { errors: employee.errors.to_hash(true) }
    end
  end

  def update
    employee = Employee.find(params[:id])
    if employee.update_attributes(employee_params)
      render status: 200, json: { uri: employee_path(employee) }
    else
      render status: 400, json: { errors: employee.errors.to_hash(true) }
    end
  end

  def destroy
    employee = Employee.find(params[:id])
    employee.destroy
    render status: 200
  end

  private

  def employee_params
    params.require(:employee).permit(
        :name,
        :sex
    )
  end
end
