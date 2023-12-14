*** Settings ***
Documentation       robot de certificacion lvl2: Orders robots from RobotSpareBin Industries Inc.
...               Saves the order HTML receipt as a PDF file.
...               Saves the screenshot of the ordered robot.
...               Embeds the screenshot of the robot to the PDF receipt.
...               Creates ZIP archive of the receipts and the images.
Library    RPA.Browser.Selenium    auto_close=${FALSE}
Library    RPA.HTTP
Library    RPA.Tables

*** Tasks ***
Order robots from RobotSpareBin Industries Inc
    Open the robot order website
    @{orders}=    Download file with path
    FOR    ${order}    IN    @{orders}
        Close the annoying modal
        Fill the form    ${order}  
    END
    


*** Keywords ***
Open the robot order website
    Open Available Browser    https://robotsparebinindustries.com/#/robot-order

Download file with path   
    Download    
    ...    https://robotsparebinindustries.com/orders.csv    
    ...    overwrite=True
    @{orders}=    Read table from CSV    
    ...    orders.csv
    RETURN    @{orders}

Close the annoying modal
    Click Button
    ...    //*[@id="root"]/div/div[2]/div/div/div/div/div/button[1]

Fill the form
    [Arguments]    ${order}
    Select From List By Value    
    ...    //*[@id="head"]
    ...    ${order}[Head]
    Click Element
    ...    //*[@id="id-body-${order}[Body]"]
    Input Text    
    ...    //*[@name="1702496419677"]
    ...    ${order}[Legs]
    Input Text    
    ...    //*[@id="address"]    
    ...    ${order}[Address]
    Click Button
        ...    //*[@id="order"]
    Click Button
    ...    //*[@id="order-another"]
 