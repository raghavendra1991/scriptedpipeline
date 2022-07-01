def image = "duvvaraghavendra/pythonapp"
def containerName = "app"
node ("slave") {
    stage('Git Checkout') {
        node {
          checkout scm
        }
    }
}
