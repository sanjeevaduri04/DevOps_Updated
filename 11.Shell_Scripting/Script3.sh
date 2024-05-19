#Print prime number without a function.

#!/bin/bash

echo "Enter the range to find prime numbers (format: start end):"
read start end

echo "Prime numbers within the range $start to $end are:"

for (( num=start; num<=end; num++ )); do
    if [ $num -lt 2 ]; then
        continue
    fi
    is_prime=true
    for (( i=2; i*i<=num; i++ )); do
        if [ $((num % i)) -eq 0 ]; then
            is_prime=false
            break
        fi
    done
    if [ $is_prime == true ]; then
        echo $num
    fi
done

-------------------------------------------------------------------

#Print prime number with  function.

#!/bin/bash

# Function to check if a number is prime
is_prime() {
    num=$1
    if [ $num -lt 2 ]; then
        return 1
    fi
    for (( i=2; i*i <= num; i++ )); do
        if [ $((num % i)) -eq 0 ]; then
            return 1
        fi
    done
    return 0
}

# Main script starts here
echo "Enter the range to find prime numbers (format: start end):"
read start end

echo "Prime numbers within the range $start to $end are:"

for (( num=start; num<=end; num++ )); do
    if is_prime $num; then
        echo $num
    fi
done

