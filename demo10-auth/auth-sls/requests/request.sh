HOST=http://0.0.0.0:3000
HOST=https://hv9a2v493e.execute-api.us-east-1.amazonaws.com

TOKEN=$(curl -X POST \
    --silent \
    -H 'Content-Type: application/json' \
    --data '{"username": "maxwellduarte", "password": "123"}' \
    $HOST/dev/login \
    | jq '.token' \
    | sed 's/"//g' \
    | tee token.log
)

echo "Token: $TOKEN"
echo 

curl --silent $HOST/dev/public | xargs echo "Public API: $1"

curl \
    --silent \
    -H "Authorization:$TOKEN" \
    $HOST/dev/private \
    | xargs echo "Private API: $1"
echo

