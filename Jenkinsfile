pipeline {
  agent {
    node {
      label 'alpha-v1'
    }
    
  }
  stages {
    stage('test1') {
      parallel {
        stage('test1') {
          steps {
            error 'test'
            node(label: 'alpha-v1') {
              sh 'ls -altr'
            }
            
          }
        }
        stage('test2') {
          steps {
            sleep 5
            echo 'foo'
          }
        }
      }
    }
    stage('finish') {
      steps {
        retry(count: 2) {
          sh 'echo \'foo\''
        }
        
      }
    }
  }
  environment {
    FOO = 'test'
  }
}