System Requirements: macOS Sierra,Ubuntu 14.04LTS
Langauage: Swift 3.x

1. PrimeNumberHourGlass.swift
*****************************************************************************
 
             **Print Prime number series in an hourglass shape**
 
 ****************************************************************************
The user will enter the number of rows and the output should contain those many
rows printing the prime number series and a mirror image of the hourglass with the
text UNOCOIN side by side (exactly as shown in the below example).
Example:
Input: 7 (Number of Rows)
Output:
2+3+5+7  UNOCOIN
 11+13    UNOCO
  17+      UNO
  1         U
 9+2       UNO
3+29+     UNOCO
31+37+4  UNOCOIN
 
NOTE: To form a perfect hourglass, split the numbers of the prime number series to
next row and for the last number of the prime number series, discard any remaining
digit after the split (In example: “19” was split to place “9” into the next row to form
an hourglass and “41” is split to place “4” in the last row and remaining digit ‘1’ is
discarded). For the UNOCOIN text, repeat the text (UNOCOIN) to make a perfect
diamond shape for large rows. TWO SHAPES MUST BE SIDE BY SIDE.

2. StudentMarks.swift

**************************************************************
**Implement Quicksort algorithm to sort the below problem.**
**************************************************************
• The user will enter the student names
• The user will enter the subjects (as many subjects as he/she wants)
• The user will enter the marks for all students for each subject
• You will total the marks for each students
• You will store them in a dynamic list. The user should be able to add as many
names, subjects and marks as he/she wants.
• You should be able to sort the names based on their total marks they
received in descending order and print the output as shown below.
Example:
Input:
Names = {‘Raj, ‘ Simran’, ‘Vinod’} Subject = {‘English’, ‘Math’, ‘Science’}
Marks = Raj:{30, 50, 40}, Simran:{50, 70, 50}, Vinod:{40, 40, 30}
Output:
Rank | Name   | English | Math | Science | Total Marks
------------------------------------------------------
1    | Simran | 50      | 70   | 50      | 170
2    | Raj    | 30      | 50   | 40      | 120
3    | Vinod  | 40      | 40   | 30      | 110
NOTE: You must implement the quicksort algorithm to sort the list. DO NOT USE
ANY BUILT IN FUNCTION TO SORT THE LIST.
