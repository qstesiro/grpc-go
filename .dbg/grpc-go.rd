# examples
{
    # grpc框架使用文档
    https://grpc.io/docs/guides/

    # 编译proto参数
    {
        # 不同语言编译选项与参数文档
        https://protobuf.dev/reference/

        # 相对路径
        # 以proto文件的路径计算相对路径
        protoc --go_out=./ --go_opt=paths=source_relative \
               --go-grpc_out=./ --go-grpc_opt=paths=source_relative \
               helloworld/helloworld.proto

        # 创建包路径
        # 以创建的包路径为启始计算相对路径
        protoc --go_out=./ --go_opt=paths=import \
               --go-grpc_out=./ --go-grpc_opt=paths=import \
               helloworld/helloworld.proto

        # 创建包路径但是可移除前缀(方便创建模块)
        # 以创建的包路径为启始计算相对路径
        protoc --go_out=./ --go_opt=module=google.golang.org \
               --go-grpc_out=./ --go-grpc_opt=module=google.golang.org \
               helloworld/helloworld.proto
    }

    # 分离编译
    {
        # 编译message
        protoc --go_out=./ --go_opt=paths=source_relative \
               helloworld/helloworld.proto

        # 编译service
        protoc --go-grpc_out=./ --go-grpc_opt=paths=source_relative \
               helloworld/helloworld.proto
    }

    # 服务发现
    {
        https://etcd.io/docs/v3.5/dev-guide/grpc_naming/
        https://zhuanlan.zhihu.com/p/623998314
    }

    # helloworld
    {
        docker run \
               --name nginx \
               --net host \
               -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf \
               -v $(pwd)/conf.d:/etc/nginx/conf.d \
               -v $(pwd)/../data/x509/server_cert.pem:/cert.pem \
               -v $(pwd)/../data/x509/server_key.pem:/key.pem \
               --rm \
               nginx:1.21
    }

    # grpc-authentication
    {
        docker run \
               --name nginx \
               --net host \
               -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf \
               -v $(pwd)/conf.d:/etc/nginx/conf.d \
               -v $(pwd)/../../data/x509/server_cert.pem:/cert.pem \
               -v $(pwd)/../../data/x509/server_key.pem:/key.pem \
               --rm \
               nginx:1.21
    }
}
