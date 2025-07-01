pipeline {
  agent any
  stages {
    stage('git scm update') {
      steps {
        git url: 'https://github.com/kshelp/nginx.git', branch: 'main'
      }
    }
    stage('docker build and push') {
      steps {
        sh '''
        docker build -t 192.168.127.131:32000/nginx .
        docker push 192.168.127.131:32000/nginx
        '''
      }
    }
    stage('deploy kubernetes') {
      steps {
        sh '''
        kubectl create deployment nginx-deploy --image=192.168.127.131:32000/nginx
        kubectl expose deployment nginx-deploy --type=LoadBalancer --port=80 \
                                               --target-port=80 --name=nginx-svc
        '''
      }
    }
  }
}
