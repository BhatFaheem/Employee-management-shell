Employee_File="$1"

if [[ ! -s "$Employee_File" ]]; then 
    echo "Employee file not found! No employees to delete."
    exit 1
fi

while true; do
    read -p "Enter the ID of Employee you want to delete: " emp_Id

    if [[ ! "$emp_Id" =~ ^[1-9][0-9]{3}$ ]]; then
        echo " Invalid Employee ID! Choose an option:"
        echo "1) Try Again"
        echo "2) Exit"
        read -p "Enter your choice: " choice
        case "$choice" in
            1) continue ;;
            2) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid choice! Returning to ID prompt..." ;;
        esac
    else
        break 
    fi
done

while true; do
    if grep -q "^$emp_Id:" "$Employee_File"; then
        echo " Employee with ID $emp_Id found! Deleting..."
        
        sed -i '' "/^$emp_Id:/d" "$Employee_File"

        echo " Employee ID $emp_Id has been deleted successfully!"
        exit 0
    else
        echo "No such Employee found! Choose an option:"
        echo "1) Search Again"
        echo "2) Exit"
        read -p "Enter your choice: " choice
        case "$choice" in
            1) continue ;; 
            2) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid choice! Returning to ID prompt..." ;;
        esac
    fi
done
