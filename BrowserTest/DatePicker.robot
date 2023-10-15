*** Settings ***
Library       Browser
Test Setup    Open Browser to TurkAir Page
Resource    ../Resource.robot

*** Variables ***
${trip_day}                15
${month_year}              January 2024

*** Test Cases ***
OneWayDatePicker
     # Accept Cookies
     Click      //*[@id="cookieWarningMessageNew"]/div/div[2]/div[1]/button
     # Go for One Way Trip
     Click      //*[@id="one-way"]
     # Click on Date Picker to open
     Click      //*[@id="general-booker-datapicker"]/div/div/span[2]

     # Get the first month available (Current Month)
     ${current_month_year}        Get Text    //*[@id="flight-tab-pane"]/div/div[4]/div/div/div/div[2]/div[1]/div/div[2]/div[1]/div[1]/div
     Wait Sleep

     # If trip month year matches with current month year
        IF   $month_year == $current_month_year
            MatchLogic       1
        # Else trip month year is future month year
        ELSE
             # Calculate Months diff between current month and desired/future trip month
             ${months_difference}    Calculate Month Difference    ${month_year}      ${current_month_year}
             Log    Months Difference in number: ${months_difference}
             # Run For Loop from 1 to number of clicks to reach the desired/future month i.e. 10 clicks
             FOR    ${counter}    IN RANGE   1       ${months_difference+1}  # less than 11
                 # Click on next month button to move forward to the desired/future month
                 Click     //*[@id="flight-tab-pane"]/div/div[4]/div/div/div/div[2]/div[1]/div/div[1]/div/button[2]
                 ${counter}   Set Variable     ${counter+1}
             END
             MatchLogic       1
        END

*** Keywords ***
# This keyword finds out the correct date in the month to select for the one way trip
MatchLogic
     [Arguments]           ${index}
      ${number_of_rows}=        Get Element Count          //*[@id="flight-tab-pane"]/div/div[4]/div/div/div/div[2]/div[1]/div/div[2]/div[${index}]/div[2]/div
           ${number_of_col} =        Get Element Count          //*[@id="flight-tab-pane"]/div/div[4]/div/div/div/div[2]/div[1]/div/div[2]/div[${index}]/div[2]/div[1]/div
           FOR    ${rowidx}    IN RANGE    1    ${number_of_rows+1}
               FOR    ${colidx}    IN RANGE    1   ${number_of_rows+1}
                    ${actual_day}      Get Text     //*[@id="flight-tab-pane"]/div/div[4]/div/div/div/div[2]/div[1]/div/div[2]/div[${index}]/div[2]/div[${rowidx}]/div[${colidx}]
                    IF   $actual_day == $trip_day
                           Log To Console    "Day Matched"
                           Click    //*[@id="flight-tab-pane"]/div/div[4]/div/div/div/div[2]/div[1]/div/div[2]/div[${index}]/div[2]/div[${rowidx}]/div[${colidx}]
                    END
           END
           END
           # Click OK button to close date picker
           Click      //*[@id="flight-tab-pane"]/div/div[4]/div/div/div/div[1]/div/button
           Wait Sleep
