<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
function init(){
		get_lucasko_token();
		get_admin_token();
}

function get_lucasko_token(){
	    $.ajax({
	        url: 'http://localhost:8080/spring4mvc-oauth2.0-server/oauth/token',
	        data: "grant_type=password&username=lucasko&password=luc@s1234&client_id=abcd-clientid-lucasko-12345&client_secret=1234-secret-test",
	        processData: false,
	        type: 'POST',
	        success: function ( data ) {
	        	document.getElementById("lucasko_token").innerHTML =   JSON.stringify(data) ; 
	       
	        	var url = "http://localhost:8080/spring4mvc-oauth2.0-server/api/users?access_token="+data['access_token'];
	        	document.getElementById("lucasko_a").innerHTML = url ; 
	        	document.getElementById("lucasko_a").href = url  ;  	
	        	document.getElementById("lucasko_div").innerHTML = getusers(data['access_token']);
	        }
	    });
}


function get_admin_token(){
	
    $.ajax({
        url: 'http://localhost:8080/spring4mvc-oauth2.0-server/oauth/token',
        data: "grant_type=client_credentials&client_id=clientid-is-admin&client_secret=5678-secret-test",
        processData: false,
        type: 'POST',
        success: function ( data ) {
        	document.getElementById("admin_token").innerHTML =   JSON.stringify(data) ; 
        	
        	var url = "http://localhost:8080/spring4mvc-oauth2.0-server/api/users?access_token="+data['access_token'];
        	document.getElementById("admin_a").innerHTML = url ; 
        	document.getElementById("admin_a").href = url  ;  	
        	document.getElementById("admin_div").innerHTML = getusers(data['access_token']);
        },error :function (data) {  }
    });
}


function getusers(access_token){
	var payload = "access_token="+access_token ;
	var result = "";
    $.ajax({
        url: 'http://localhost:8080/spring4mvc-oauth2.0-server/api/users',
        data: payload ,
        processData: false,
        type: 'POST',
        async: false,  
        success: function ( data ) {
        	result =   JSON.stringify(data)  ;
        },error :function (data) { alert(data.responseText)}
    });
    return result ;
}
</script>
</head>
<body onload="init();">
	<h2>Cannot Access Resource without Access Token</h2>
	<a href="http://localhost:8080/spring4mvc-oauth2.0-server/api/users">http://localhost:8080/spring4mvc-oauth2.0-server/api/users/</a>
	<br />

	<h2>Get Access Token</h2>
	lucasko get access_token by grant_type=password:
	<br />
	<a
		href="http://localhost:8080/spring4mvc-oauth2.0-server/oauth/token?grant_type=password&username=lucasko&password=luc@s1234&client_id=abcd-clientid-lucasko-12345&client_secret=1234-secret-test">http://localhost:8080/spring4mvc-oauth2.0-server/oauth/token?grant_type=password&username=lucasko&password=luc@s1234&client_id=abcd-clientid-lucasko-12345&client_secret=1234-secret-test</a>
	<br />


	<div id="lucasko_token"></div>
	<br />
	<br /> ROLE_ADMIN  get access_token by grant_type=client_credentials
	<br />
	<a href="http://localhost:8080/spring4mvc-oauth2.0-server/oauth/token?grant_type=client_credentials&client_id=clientid-is-admin&client_secret=5678-secret-test">http://localhost:8080/spring4mvc-oauth2.0-server/oauth/token?grant_type=client_credentials&client_id=clientid-is-admin&client_secret=5678-secret-test</a>
	<br />
	<div id="admin_token"></div>


	<h2>Access Resource with Access Token (Replace acces_token with
		new one):</h2>

ROLE_USER - lucasko<br/>
<a id="lucasko_a" href=""></a>	
<div id="lucasko_div">  </div>

<br/>
ROLE_ADMIN<br/>
<a id="admin_a" href=""></a>	
<div id="admin_div">  </div>

</body>
</html>
