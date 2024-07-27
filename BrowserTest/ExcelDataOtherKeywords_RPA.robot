*** Settings ***
Library     Browser
Library     RPA.Excel.Files
Resource    ../Resource.robot

*** Variables ***
${EXCEL_FILE}     ${CURDIR}${/}\\Data\\LoginData.xlsx

*** Test Cases ***
RenameTest
    Open Workbook    ${EXCEL FILE}
    Rename Worksheet       Data3       Test
    Save Workbook
    Close Workbook

RemoveTest
    Open Workbook    ${EXCEL FILE}
    # Remove last worksheet
    ${sheets}=       List worksheets
    Remove worksheet    ${sheets}[-1]
    Remove Worksheet    Data2
    Save Workbook
    Close Workbook

DeleteTest
    Open Workbook    ${EXCEL FILE}
    Read Worksheet   Data1
    Delete Columns   E      # delete column E
    Delete Columns   C  D    # delete columns C to D
    Delete Rows   8       # delete row 8
    Delete Rows   4   6   # delete rows 4 to 6
    Save Workbook
    Close Workbook

InsertTest
   Open Workbook    ${EXCEL FILE}
   Read Worksheet   Data1
   Insert Columns After    A   2     # insert 2 columns after column  A
   Insert Columns Before   A   3     # insert 3 columns before column A
   Insert Rows After       1   3     # insert 3 rows after row 1
   Insert Rows Before      5   1     # insert 1 row before row 5
   Save Workbook
   Close Workbook

