@Library('shlib')_
pipeline {
    agent any
 /*tools{
    maven 'maven'
   
    } */
  stages {
 
    stage('clean')
            {
                steps
                 { 
	          sh 'mvn clean package'
                 }
		 }
  stage('Build docker image')
		{
			steps
			{
			sh 'docker build -t vijayshegde/mybootapp:2.0.0 .'
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
        }
        }
	  /*
	   stage('Approval'){
                steps{
                approval1 'APPROVAL1'
                }
                }

          */
 
	  stage('Run Container on Dev Server'){
       steps
       {
     sh 'docker run -p 8095:8080 -d --name Tomcat-server5 vijayshegde/mybootapp:2.0.0'
     /* sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no ec2-user@13.232.40.185 ${dockerRun}"
     } */
	       
   }
}
	   

}
}
