Employee_Id="$1"
Employee_File="$2"

read -p "Enter the name of Employee : " emp_name
while [[ ! "$emp_name" =~ ^[A-Za-z]{1 , 25}$ ]];
    do
        echo "Invalid Name . Please try a valid name : "
        read emp_name
done

echo "Employee added successfully :) "
echo "$Employee_Id:$emp_name" >> "$2"
