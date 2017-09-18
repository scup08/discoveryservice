FROM scup08/jre:8u111

# 将本地文件夹挂载到当前容器
VOLUME /root/docker/data

# 拷贝文件到容器，也可以直接写成ADD eureka-server-0.0.1-SNAPSHOT.jar /app.jar
# 这个地方jar包名称改成自己的jar名称
ADD discoveryservice.jar app.jar
RUN bash -c 'touch /app.jar'


# 开放1111端口
EXPOSE 8761

# 配置容器启动后执行的命令
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
