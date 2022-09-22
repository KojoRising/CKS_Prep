


3  ls
4  curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
5  kubens world
6  k expose deploy/asia --port=80 --type=ClusterIP $d  |  tee asia-svc.yaml | ka -
7  k expose deploy/europe --port=80 --type=ClusterIP $d  |  tee europe-svc.yaml | ka -
