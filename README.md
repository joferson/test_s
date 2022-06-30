# test_s
Um desenvolvedor está criando uma API na porta 8080. Essa API acessa o S3 e o SQS.
O nome do S3 é acessado pela variável de ambiente BUCKET e o SQS pela variável de ambiente QUEUE_NAME.
Você deverá criar todos os manifests do Kubernetes para fazer o deploy da aplicação com as melhores práticas.
Além disso, é necessário implementar os scripts Terraform para subir toda a infra necessária (S3 e SQS) com as melhores práticas. Não é necessário subir o EKS pelo Terraform, mas fique à vontade para fazê-lo.