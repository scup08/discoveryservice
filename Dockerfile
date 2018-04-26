FROM centos

# 将本地文件夹挂载到当前容器
#VOLUME /root/docker/data

# 拷贝文件到容器，也可以直接写成ADD eureka-server-0.0.1-SNAPSHOT.jar /app.jar
# 这个地方jar包名称改成自己的jar名称
ADD discoveryservice.jar /app.jar

#ADD ../jre1.8.0_171/ /usr/java/jre1.8.0_171/
#RUN bash -c 'touch /app.jar'

#配置java环境变量
ENV JRE_HOME=/usr/java/jre1.8.0_171
ENV PATH $JRE_HOME/bin:$PATH
ENV CLASSPATH=$JRE_HOME/lib/rt.jar:$JRE_HOME/lib/ext

# 开放1111端口
EXPOSE 8761

# 配置容器启动后执行的命令
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","-Xms128m","-Xmx128m","/app.jar"]