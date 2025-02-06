Employee_File="employee.dat"
Employee_Id=1000


update_employee_id(){
    Employee_Id=$((Employee_Id + 1))
}
while true;
    do
    echo "=============================="
    echo " Employee Management System"
    echo "=============================="
    
    echo "Welcome :) What do you want to do --> "
    echo "1) Add a new Employee "
    echo "2) Modify existing Employee "
    echo "3) Delete a Employee "
    echo "4) List all Employee's "
    echo "5) Quit "
    echo "=============================="
    
    read option
    case $option in
        1)
            echo "Adding Employee..."
            ./addEmp.sh "$Employee_Id" "$Employee_File"
            update_employee_id
            ;;
        2)
           echo "Modifying User..."
           ./modifyEmp.sh "$Employee_Id" "$Employee_File"
           ;;
        3)
            echo "Deleting User..."
           ./delEmp.sh "$Employee_Id" "$Employee_File"
           ;;
        4)
            echo "Listing all User's..."
           ./listEmp.sh "$Employee_File"
           ;;
        5)
            echo "Quiting..."
            exit 0
            ;;
    esac
done

