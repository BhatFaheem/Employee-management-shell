Employee_Id="$1"
Employee_File="$2"

read -p "Enter the name of Employee : " emp_name
while [[ ! "$emp_name" =~ ^[A-Za-z]{1,25}$ ]];
    do
        echo "Invalid Name . Please try a valid name : "
        read emp_name
done
read -p "Enter the Department name of Employee : " emp_dept
while [[ ! "$emp_dept" =~ ^[A-Z]{1,4}$ ]];
    do
        echo "Invalid Department Name . Please try a valid name : "
        read emp_dept
done
read -p "Enter the Salary of Employee : " emp_salary
while [[ ! "$emp_salary" =~ ^[0-9]+(\.[0-9]+)?$ ]];
    do
        echo "Invalid Salary . Please try a valid number : "
        read emp_salary
done
read -p "Enter the address of Employee : " emp_address
while [[ ! "$emp_address" =~ ^[A-Za-z]{1,15}$ ]];
    do
        echo "Invalid Address . Please try a valid address : "
        read emp_address
done
read -p "Enter the Hiring Date of Employee (dd/mm/yyyy) : " emp_hday
while [[ ! "$emp_hday" =~ ^[0-9]{2}/[0-9]{2}/[0-9]{4}$ ]];
    do
        echo "Invalid Hiring Date . Please check the format and add a valid Date : "
        read emp_hday
done

echo "=============================="
echo " "
echo "Employee added successfully :) "
echo " "
echo "=============================="
echo "$Employee_Id:$emp_name:$emp_dept:$emp_salary:$emp_address:$emp_hday" >> "$Employee_File"