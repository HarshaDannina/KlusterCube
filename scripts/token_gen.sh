APISERVER=$(kubectl config view --minify | grep server | cut -f 2- -d ":" | tr -d " ")
TOKEN=$(kubectl describe secret default-token | grep -E '^token' | cut -f2 -d':' | tr -d " ")
echo $APISERVER
echo $TOKEN
curl $APISERVER/api --header "Authorization: Bearer $TOKEN" --insecure
