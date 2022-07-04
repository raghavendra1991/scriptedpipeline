def image = "duvvaraghavendra/pythonapp"
def containerName = "app"
node ("slave") {
    stage('Git Checkout') {
         checkout scm
    }
    stage('Cleaning') {
        sh 'docker stop $(docker ps -a -q) || true && docker rm $(docker ps -a -q) || true && docker rmi -f $(docker images  -a -q) || true'
    }
    withEnv(['http_proxy=http://127.0.0.1:3128/', 'https_proxy=http://127.0.0.1:3128/', 'ftp_proxy=http://127.0.0.1:3128/', 'socks_proxy=socks://127.0.0.1:3128/']) {
        stage('Build Docker Image') {
            docker.build("${image}:${env.BUILD_ID}")
        }
    }
    stage('creating Container using image') {
        docker.image("${image}:${env.BUILD_ID}").run("--name ${containerName} --publish 5000:5000")
    }
    stage('Testing Container') {
        sh './script.sh'
    }
    stage('Push Docker Image to DockerHub') {
        docker.withRegistry('', 'docker-hub') {
            def image = "("${image}:${env.BUILD_ID}")"
            image.push()
        }
    }
}
