# Demos for "Level Up Your Web Apps With Amazon Web Services"

There are three requirements for getting these demos working. I know that sounds like a lot, but we're dealing with a series of external services in multiple lanaguages in these demos, and each must be set up correctly.

1. Add the AWS SDK .jar and related files to your CF install.
2. Set up your own AWS credentials and add them to awsCredentials.cfc.
3. Set up your own copies of the required resources in SNS, Lambda, and DynamoDB.

### Requirement One: The AWS SDK .jar and Related Files

The demos in this repo require that you have the following .jar files in your /coldfusion/lib/ directory:

- aws-java-sdk-1.10.30 or later
- jackson-annotations
- jackson-core
- jackson-databind
- joda-time

All of these files can be downloaded from [https://aws.amazon.com/sdk-for-java/](https://aws.amazon.com/sdk-for-java/) Files other than the actual SDK .jar itself can be found in the /third-party directory within the SDK download.

### Requirement Two: Your Own AWS Credentials

You have to create your own AWS account and provide both the AccessKey and SecretKey in model/awsCredentials.cfc.

The account for which you are providing credentials must also have permissions for the following services:

- SNS
- Lambda
- CloudWatch (for Lambda logging)
- DynamoDB

For more infomration about IAM accounts, roles, and permissions, please review the [IAM guide](http://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html).

### Requirement Three: Your Own AWS Resources

You need to set up the following resources within AWS for these demos to work:

1. SNS - create a topic to which messsages can be sent. The ARN of this topic must be added to the top of sns.cfm.
2. Lambda - create a Lambda function using the code in nodejs/lambda/lambda-returnDataToCaller.js. The Lambda runtime should be NodeJS 4.3, and you do not need to configure a trigger for the function, as it will be invoked from this application. The ARN (Amazon Resource Name, like a URL) of the function must be added to the top of lambda.cfm. Other Lambda functions from the presentation are not called from this application. You can, however, add them to Lambda using the source code in this repo.
3. DynamoDB - create a DynamoDB table with a partition (primary) key of "userID" (String) and a sort key (range key) of "epochTime" (Number). The table name must be added to the top of dynamodb.cfm.

Remember, the AWS docs are pretty great. Use the [Java API Reference](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/index.html) often, as it'll tell you almost everything you need to know for working with a particular AWS service.

Enjoy!
