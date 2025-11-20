#! /bin/bash
clear

# filling courses.txt
bash courses.bash

courseFile="courses.txt"

function displayCoursesofInst(){

echo -n "Please Input an Instructor Full Name: "
read instName

echo ""
echo "Courses of $instName :"
cat "$courseFile" | grep "$instName" | cut -d';' -f1,2 | \
sed 's/;/ | /g'
echo ""

}

function courseCountofInsts(){

echo ""
echo "Course-Instructor Distribution"
cat "$courseFile" | cut -d';' -f7 | \
grep -v "/" | grep -v "\.\.\." | \
sort -n | uniq -c | sort -n -r 
echo ""

}

# TODO - 1
# Make a function that displays all the courses in given location
# function displays course code, course name, course days, time, instructor
# Add function to the menu
# Example input: JOYC 310
# Example output: See the screenshots in canvas
function coursesInLocation(){
	echo -n "Please Input a Classroom Name: "
	read className
	echo ""
	echo "Courses in $className: "
	cat "$courseFile" | grep "$className" | cut -d ';' -f1,2,5-7 | sed 's/;/ | /g'
}


# TODO - 2
# Make a function that displays all the courses that has availability
# (seat number will be more than 0) for the given course code
# Add function to the menu
# Example input: SEC
# Example output: See the screenshots in canvas

#WOS = With Open Seats
function coursesWOS(){
	echo -n "Please enter course code (i.e SEC): "
	read courseCode
	echo ""
	echo "Available course in $courseCode: "
	cat "$courseFile" | grep "$courseCode"  | awk '$4>0 {print}' | sed 's/;/ | /g'
}	

while :
do
	echo ""
	echo "Please select and option:"
	echo "[1] Display courses of an instructor"
	echo "[2] Display course count of instructors"
	echo "[3] Display courses in specific location"
	echo "[4] Display courses with open seats"
	echo "[5] Exit"

	read userInput
	echo ""

	if [[ "$userInput" == "5" ]]; then
		echo "Goodbye"
		break

	elif [[ "$userInput" == "1" ]]; then
		displayCoursesofInst

	elif [[ "$userInput" == "2" ]]; then
		courseCountofInsts

	elif [[ "$userInput" == "3" ]]; then
		coursesInLocation
	
	elif [[ "$userInput" == "4" ]]; then 
		coursesWOS
	
	else
		echo "Invalid Input, please enter a choice from 1-5"
	# TODO - 3 Display a message, if an invalid input is given
	fi
done
