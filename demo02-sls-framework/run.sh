# instalar
npm i -g serverless

# sls inicializar um novo projeto
sls

# abrir dashboard 
sls dashboard

# se necessário, efetuar login no serverless. (as vezes dá erro. antes de realizar o login, excluir a pasta .servless)
sls login

# sempre fazer deploy antes de tudo, para verificar se está com o ambiente ok.
sls deploy

# invocar na AWS
sls invoke -f hello

# invocar local (--l log)
sls invoke local -f hello --l

# logs
sls logs -f hello --tail

# remover
sls remove

