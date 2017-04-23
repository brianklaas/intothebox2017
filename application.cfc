component {
	
	this.name = 'intothebox2017_AWS_Demos';
	this.applicationTimeout = CreateTimeSpan(0, 0, 15, 0);
	this.sessionManagement = false;

    function onApplicationStart(){
        application.awsServiceFactory = createObject("component", "model.awsServiceFactory").init();
        return true;
    }

}