*** Settings ***
Library     Browser
Library     RPA.Excel.Files
Resource    ../Resource.robot

*** Variables ***
${EXCEL_FILE}     ${CURDIR}${/}\\Data\\LoginData.xlsx
${NEW_EXCEL}      ${CURDIR}${/}\\Data
${data}
@{rows}            ID     Price

*** Test Cases ***
ReadExistingWorkbook
    Open Workbook    ${EXCEL_FILE}

    # Get number of worksheets
    @{sheets}=   List Worksheets
    FOR  ${sheet}  IN   @{sheets}
            # read each worksheet
            ${sheet}=        Read Worksheet   ${sheet}
            # get number of rows
            ${rows}=         Get Length  ${sheet}
            Log   Worksheet ${sheet} has ${rows} rows
    END

WriteNewWorkbook
    # creating new excel using dictionary
    Create Workbook  ${NEW_EXCEL}\\new.xlsx
    FOR    ${index}    IN RANGE    10
        &{row}=       Create Dictionary   ID   ${index}    Price   ${index * 10}
        Append Rows to Worksheet  ${row}  header=${TRUE}
    END
    Save Workbook
    Close Workbook

WriteNewSheet
     Open Workbook    ${NEW_EXCEL}\\new.xlsx
     # Create a new blank worksheet named "Student"
     Create Worksheet    Employee
     # Create a new worksheet with headers and contents using list of dictionaries
    &{Student_Row1}=    Create Dictionary      name=Martin   age=${20}
    &{Student_Row2}=    Create Dictionary      name=Ron   age=${22}
    @{Worksheet_Data}=    Create List
    ...    ${Student_Row1}
    ...    ${Student_Row2}

    Create Worksheet
    ...    name=Employee
    ...    content=${Worksheet_Data}
    ...    exist_ok=True
    ...    header=True
    Save Workbook


