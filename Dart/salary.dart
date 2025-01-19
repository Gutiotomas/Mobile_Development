import 'dart:io';

class Employee {
  String name;
  String company;
  int hoursWorked;
  int? bonus;

  Employee(this.name, this.company, this.hoursWorked, {this.bonus});
}

int calculateSalary(int hoursWorked) {
  const int normalHours = 160;
  const int normalHourPay = 50000;
  const int extraHourPay = 80000;
  int salary;

  if (hoursWorked > normalHours) {
    int extraHours = hoursWorked - normalHours;
    salary = (normalHours * normalHourPay) + (extraHours * extraHourPay);
  } else {
    salary = hoursWorked * normalHourPay;
  }

  return salary;
}

void main() {
  stdout.write("Enter the number of employees: ");
  int numberOfEmployees = int.parse(stdin.readLineSync()!);

  List<Employee> employees = [];

  for (int i = 0; i < numberOfEmployees; i++) {
    stdout.write("\nEnter the name of employee ${i + 1}: ");
    String name = stdin.readLineSync()!;

    stdout.write("Enter the company of ${name}: ");
    String company = stdin.readLineSync()!;

    stdout.write("Enter the hours worked by ${name}: ");
    int hoursWorked = int.parse(stdin.readLineSync()!);

    stdout.write("Enter the bonus of ${name} (or press Enter if no bonus): ");
    String? bonusInput = stdin.readLineSync();
    int? bonus = bonusInput != null && bonusInput.isNotEmpty ? int.parse(bonusInput) : null;

    employees.add(Employee(name, company, hoursWorked, bonus: bonus));
  }

  for (var employee in employees) {
    if (employee.company == "Motores S.A.") {
      int salary = calculateSalary(employee.hoursWorked);
      if (employee.bonus != null) {
        print("\n${employee.name} earns \$${salary} and their transport subsidy is \$${employee.bonus}");
      } else {
        print("\n${employee.name} earns \$${salary}");
      }
    }
  }
}