*** Settings ***
Documentation       robot de certificacion lvl2: Orders robots from RobotSpareBin Industries Inc.
...               Saves the order HTML receipt as a PDF file.
...               Saves the screenshot of the ordered robot.
...               Embeds the screenshot of the robot to the PDF receipt.
...               Creates ZIP archive of the receipts and the images.
Library    RPA.Browser.Selenium    auto_close=${FALSE}
Library    RPA.HTTP

*** Tasks ***
Order robots from RobotSpareBin Industries Inc
    Open the robot order website
    Download file with path

*** Keywords ***
Open the robot order website
    Open Available Browser    https://robotsparebinindustries.com/#/robot-order

Download file with path
    Download    https://robotsparebinindustries.com/orders.csv    overwrite=True