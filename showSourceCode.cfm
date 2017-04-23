<cfif structKeyExists(URL, "fileToGrab")>
	<cfswitch expression="#Trim(URL.fileToGrab)#">
		<cfcase value="pySubscribe">
			<cfset fileTitle = "Python: Subscribe to a SNS Topic via Email" />
			<cfset pathToFile = "/intothebox2017/python/sns/subscribeViaEmail.py" />
		</cfcase>
		<cfcase value="pySendSNS">
			<cfset fileTitle = "Python: Send a Test SNS Notification" />
			<cfset pathToFile = "/intothebox2017/python/sns/publishToSNS.py" />
		</cfcase>
		<cfcase value="pyCheckServers">
			<cfset fileTitle = "Python: Check Servers" />
			<cfset pathToFile = "/intothebox2017/python/lambda/checkServers.py" />
		</cfcase>
		<cfcase value="jsLargeFile">
			<cfset fileTitle = "Node: Check for Large File Uploads" />
			<cfset pathToFile = "/intothebox2017/nodejs/lambda/checkForLargeFileUploads.js" />
		</cfcase>
		<cfcase value="jsReturnData">
			<cfset fileTitle = "Node: Return Data to Caller" />
			<cfset pathToFile = "/intothebox2017/nodejs/lambda/returnDataToCaller.js" />
		</cfcase>
		<cfdefaultcase>
			<cfthrow message="Unsupported action requested" detail="You have requested a file (#URL.fileToGrab#) which is not supported at this time." />
		</cfdefaultcase>
	</cfswitch>
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
				<h1>Lambda</h1>
				<h3>Code Example: <cfoutput>#fileTitle#</cfoutput></h3>

				<cffile action="read" file="#expandPath(pathToFile)#" variable="sourceCode">

				<cfoutput>
					<pre>#sourceCode#</pre>
				</cfoutput>
				
				<p align="right" ><a href="index.cfm" class="homeButton">Home</a></p>
			</div>
		</div>

	</body>
</html>