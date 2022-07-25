#1º criar arquivo de políticas de segurança.
#2º criar role de segurança na AWS.
aws iam create-role \
    --role-name lambda-exemplo \
    --assume-role-policy-document file://politicas.json \
    | tee logs/role.log

#3º criar o arqvuivo com conteúdo e zipa-lo
zip function.zip index.js

aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs12.x \
    --role arn:aws:iam::336811455630:role/lambda-exemplo \
    | tee logs/lambda-create.log

#4º invoke lambda-create
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log    

# -- atualizar, zipar
zip function.zip index.js    

# atualizar lambda
aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log

#remover
aws lambda delete-function \
    --function-name hello-cli 

aws iam delete-role \
    --role-name lambda-exemplo    
