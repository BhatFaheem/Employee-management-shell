Employee_File="employee.dat"
Employee_Id_File="Id_File.txt"
Employee_Id=1000

initialize_emp_id(){
    touch "$Employee_File"
    if [[ ! -f "$Employee_Id_File" ]];
        then
            echo 1000 >> "$Employee_Id_File"
    fi
    Employee_Id=$(<"$Employee_Id_File")
}

update_employee_id(){
    Employee_Id=$(<"$Employee_Id_File")
    Employee_Id=$((Employee_Id + 1))
    echo "$Employee_Id" > "$Employee_Id_File" 
}
initialize_emp_id
while true;
    do
    echo "=============================="
    echo " Employee Management System"
    echo "=============================="
    
    echo "Welcome :) What do you want to do "
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
           ./delEmp.sh  "$Employee_File"
           ;;
        4)
           ./listEmp.sh "$Employee_File"
           ;;
        5)
            echo "Quiting..."
            rm "$Employee_File"
            rm "$Employee_Id_File"
            exit 0
            ;;
    esac
done
