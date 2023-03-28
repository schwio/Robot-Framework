** Settings **
Resource    ../main.robot
#Resource    ../data/user.robot

** Variables **
&{login_page}
...     InputUserLogin=//input[@id="username"]
...     InputUserPassword=//input[@id="password"]
...     SubmitButton=//button[@id="loginbtn"]

** Keywords **
Dado que eu acesso a página do AVA
    #Abre uma nova guia anônima no navegador
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --incognito
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Execute JavaScript  location.reload(true);  # recarrega a página e limpa o cache
    Maximize Browser Window
    Go To    ${geral.URL}
    Sleep       1s

E faço o login
    Input Text      ${login_page.InputUserLogin}        ${user_login.username}
    Input Text      ${login_page.InputUserPassword}     ${user_login.password}
    Click Element   ${login_page.SubmitButton}      
    Sleep           5s
