Employee_File="$1"

if [[ ! -s "$Employee_File" ]]; then 
    echo "Employee file not found! No employees to delete."
    exit 1
fi

while true; do
    read -p "Enter the ID of Employee you want to modify: " emp_Id

    if [[ ! "$emp_Id" =~ ^[1-9][0-9]{3}$ ]]; then
        echo "Invalid Employee ID. Please enter a valid ID."
        continue 
    fi

    if grep -q "^$emp_Id:" "$Employee_File"; then
        echo "Employee with ID $emp_Id found!"
        break
    fi

    echo "No such Employee found. Choose an option:"
    echo "1. Try another ID"
    echo "2. Exit"

    read -p "Enter your choice: " choice
    case "$choice" in
        1) continue ;; 
        2) echo "Exiting..."; exit 1 ;; 
        *) echo "Invalid option. Exiting..."; exit 1 ;;
    esac
done

read -r old_entry < <(grep "^$emp_Id:" "$Employee_File")
IFS=":" read -r id emp_name emp_dept emp_salary emp_address emp_hday <<< "$old_entry"

while true; do
    echo "Do you want to change the name of Employee?"
    echo "1) YES "
    echo "2) No keep the default value "
    read choice

    case "$choice" in
        1)
            read -p "Enter the new name of Employee: " emp_new_name
            while [[ ! "$emp_new_name" =~ ^[A-Za-z]{1,25}$ ]]; do
                echo "Invalid Name. Please try a valid name: "
                read emp_new_name
            done
            emp_name="$emp_new_name"
            break
            ;;
        2) 
            break
            ;;
        *) echo "Invalid option. Please try again."; continue ;;
    esac
done

while true; do
    echo "Do you want to change the Department of Employee?"
    echo "1) YES "
    echo "2) No keep the default value "
    read choice
    case "$choice" in
        1) 
            read -p "Enter the new Department name of Employee: " emp_new_dept
            while [[ ! "$emp_new_dept" =~ ^[A-Z]{1,4}$ ]]; do
                echo "Invalid Department Name. Please try a valid name: "
                read emp_new_dept
            done
            emp_dept="$emp_new_dept"
            break
            ;;
        2) 
            break
            ;;
        *) echo "Invalid option. Please try again."; continue ;;
    esac
done

while true; do
    echo "Do you want to change the Salary of Employee?"
    echo "1) YES "
    echo "2) No keep the default value "
    read choice
    case "$choice" in
        1) 
            read -p "Enter the new salary of Employee: " emp_new_salary
            while [[ ! "$emp_new_salary" =~ ^[0-9]{1,10}(\.[0-9]{1,2})?$ ]]; do
                echo "Invalid Salary. Please try a valid number: "
                read emp_new_salary
            done
            emp_salary="$emp_new_salary"
            break
            ;;
        2) 
            break
            ;;
        *) echo "Invalid option. Please try again."; continue ;;
    esac
done

while true; do
    echo "Do you want to change the address of Employee?"
    echo "1) YES "
    echo "2) No keep the default value "
    read choice
    case "$choice" in
        1) 
            read -p "Enter the new address of Employee: " emp_new_address
            while [[ ! "$emp_new_address" =~ ^[A-Za-z]{1,15}$ ]]; do
                echo "Invalid Address. Please try a valid address: "
                read emp_new_address
            done
            emp_address="$emp_new_address"
            break
            ;;
        2) 
            break
            ;;
        *) echo "Invalid option. Please try again."; continue ;;
    esac
done

new_entry="$emp_Id:$emp_name:$emp_dept:$emp_salary:$emp_address:$emp_hday"

sed -i '' "s|^$old_entry$|$new_entry|" "$Employee_File"

echo "User Details have been updated!"
