Environment:

1. Maven

2. JDK 1.8

3. STS


Import project:
FILE ->  Import  -> Maven  -> Existing Maven Projects

Major Dependencies of Project:

1. Spring 4.0.7.RELEASE

2. Spring Security 3.2.5.RELEASE

3. Spring Security Oauth2 1.0.5.RELEASE

===============================================
Cannot Access Resource without Access Token   
===============================================
http://localhost:8080/spring4mvc-oauth2.0-server/api/users/ 



===============================================
Get Access Token                              
===============================================

(1).lucasko get access_token by grant_type=password: 

http://localhost:8080/spring4mvc-oauth2.0-server/oauth/token?grant_type=password&username=lucasko&password=luc@s1234&client_id=abcd-clientid-lucasko-12345&client_secret=1234-secret-test 

{"access_token":"12f62d08-4133-4b32-a3fc-eeb8eb5d3c5f","token_type":"bearer","refresh_token":"9088cd86-f228-4d8a-acd1-3e4860df521d","expires_in":117} 


========================================================================
Access Resource with Access Token (Replace acces_token with new one)                               
========================================================================

ROLE_USER - lucasko   (grant by password):
http://localhost:8080/spring4mvc-oauth2.0-server/api/users?access_token=12f62d08-4133-4b32-a3fc-eeb8eb5d3c5f

[{"id":1,"name":"user001","email":"user001@example.com","phone":"0123456789"},{"id":2,"name":"user002","email":"user002@example.com","phone":"9876543210"}]



