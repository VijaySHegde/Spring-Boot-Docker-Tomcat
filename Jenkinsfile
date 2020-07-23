@Library('shlib')_
pipeline {
    agent any
 /*tools{
    maven 'maven'
   
    } */
  stages {
 
    stage('clean and build')
            {
                steps
                 { 
	          sh 'mvn clean package'
		  log_function("Build stage","war created")	 
                 }
		 }
	  
  stage('Build docker image')
		{
			steps
			{
			sh 'docker build -t vijayshegde/mybootapp:2.0.0 .'
		        log_function("Built docker image","using docker file")
			
		}
		}
	  
	 stage('Push Docker Image'){
       steps
       {
     withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
        sh "docker login -u vijayshegde -p ${dockerHubPwd}"
	     /* 
	     --password-stdin*/
     }
     sh 'docker push vijayshegde/mybootapp:2.0.0'
       }
   } 
	  
        stage("blazemeter Performance test")
        {
            steps{
                
            
            performanceTest()
	    log_function("Blazemeter"," Test results are ready")
	    
        }
        }
	 
	   stage('Approval'){
                steps{
                approval1 'APPROVAL1'
                }
                }

          
 
	  stage('Run Container on Dev Server'){
       steps
       {
     sh 'docker run -p 8094:8080 -d --name Tomcat-serverr4 vijayshegde/mybootapp:2.0.0'
     /* sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no ec2-user@13.232.40.185 ${dockerRun}"
     } */
	       
   }
		  post {
  failure
  {
  log_function("pipeline","failed")
  }
  }
}
	   

}
}
