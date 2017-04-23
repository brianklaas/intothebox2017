<cfset lambdaFunctionResult = "" />
<cfset lambdaFunctionToInvoke = "ARN OF YOUR LAMBDA FUNCTION GOES HERE" />

<cfif structKeyExists(URL, "invokeFunction")>
	<cfscript>
		// ColdFusion 10 and lower upper cases serialization of keys in a structure unless you use array notation to define the keys in the struct.
		payload = {};
		payload["firstName"] = "Brian";
		payload["lastName"] = "Klaas";
		payload["email"] = "bklaas@jhu.edu";
		payload["classes"] = arrayNew(1);
		payload["classes"][1] = structNew();
		payload["classes"][1]["courseNumber"] = "550.990.81";
		payload["classes"][1]["role"] = "Faculty";
		payload["classes"][2] = structNew();
		payload["classes"][2]["courseNumber"] = "120.641.01";
		payload["classes"][2]["role"] = "Student";

		jsonPayload = serializeJSON(payload);
		jsonPayload = replace(jsonPayload,"//","");

		lambda = CreateObject('component', 'intothebox2017.model.awsServiceFactory').init().createServiceObject('lambda');
		invokeRequest = CreateObject('java', 'com.amazonaws.services.lambda.model.InvokeRequest').init();
		invokeRequest.setFunctionName(lambdaFunctionToInvoke);
		invokeRequest.setPayload(jsonPayload);

		result = variables.lambda.invoke(invokeRequest);

		sourcePayload = result.getPayload();
		// The payload returned from a Lambda function invocation in the Java SDK is always a Java binary stream. As such, it needs to be decoded into a string of characters.
		charset = CreateObject('java', 'java.nio.charset.Charset').forName("UTF-8");
		charsetDecoder = charset.newDecoder();
		lambdaFunctionResult = charsetDecoder.decode(sourcePayload).toString();
	</cfscript>
</cfif>

<cfcontent reset="true" />

<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Into The Box 2017: AWS Service Demos</title>
		<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="assets/styles.css?v=1.0">
	</head>

	<body>
		<div align="center">
			<div id="mainBox">
				<h3>AWS Service Demos:</h3>
				<h1>Lambda Function Invocation</h1>

				<cfif Len(lambdaFunctionResult)>
					<p>Result of funciton invocation:</p>
					<p><cfoutput>#lambdaFunctionResult#</cfoutput></p>
				</cfif>

				<p><a href="lambda.cfm?invokeFunction=1">Invoke Demo Function</a></p>
				<p align="right" ><a href="index.cfm" class="homeButton">Home</a></p>
			</div>
		</div>

	</body>
</html>