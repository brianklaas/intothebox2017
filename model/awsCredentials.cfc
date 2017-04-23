/*
AWS Credentials Config

This component contains your AWS accessKey and secretKey credentials.
You must enter your own accessKey and secretKey here for any of these examples to work.
Additionally, the IAM account with which these credentials are assoicated must have permissions to work with SNS, Lambda, and DynamoDB.
For more information on IAM accounts and permissions, see http://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html

Author: Brian Klaas (bklaas@jhu.edu)
(c) 2017, The Johns Hopkins Bloomberg School of Public Health Center for Teaching and Learning

*/

component accessors="true" output="false" hint="Simpler holder for AWS credentials." {

	property name="accessKey" type="string";
	property name="secretKey" type="string";

	this.accessKey = 'YOUR ACCESS KEY';
	this.secretKey = 'YOUR SECRET KEY';

	/**
	*	@description Component initialization
	*/
	public any function init() {
		return this;
	}
}
