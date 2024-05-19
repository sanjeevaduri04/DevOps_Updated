#Reverse of the number without function
#!/bin/bash

echo "Enter a number:"
read number

reversed=""

while [ $number -gt 0 ]; do
    # Extract the last digit
    digit=$(( $number % 10 ))
    # Append the digit to the reversed number
    reversed="${reversed}${digit}"
    # Remove the last digit from the number
    number=$(( $number / 10 ))
done

echo "Reversed number: $reversed"

-----------------------------------------------------
#Reverse of the number with function

#!/bin/bash

# Function to reverse a number
reverse_number() {
    num=$1
    reversed=0

    while [ $num -gt 0 ]
    do
        remainder=$(( $num % 10 ))
        reversed=$(( $reversed * 10 + $remainder ))
        num=$(( $num / 10 ))
    done

    echo $reversed
}

# Main script starts here
echo "Enter a number:"
read input_number

# Check if input is a valid number
if [[ $input_number =~ ^[0-9]+$ ]]; then
    reversed=$(reverse_number $input_number)
    echo "Reversed number: $reversed"
else
    echo "Invalid input. Please enter a valid number."
fi
