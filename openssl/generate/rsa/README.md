生成RSA步骤
1. 移动到要生成的公钥私钥的文件夹(非必需)
2. 进入`openssl`环境,终端窗口输入`openssl`
3. 生成RSA私钥
    ```shell
    genrsa -out rsa_private_key.pem 1024
    ```
4. 查看RSA私钥(非必需)
    ```shell
    pkcs8 -topk8 -inform PEM -in rsa_private_key.pem -outform PEM -nocrypt
    ```
5. 生成RSA公钥
    ```shell
    rsa -in rsa_private_key.pem -pubout -out rsa_public_key.pem
    ```
6. 在当前目录下查看生成的`rsa_private_key.pem`和`rsa_public_key.pem`