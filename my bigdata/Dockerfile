FROM centos-hadoop
MAINTAINER DJX  djx@ss.pku.edu.cn

# install scala & config PATH
ADD  ./scala-2.11.6.tgz /usr/local/
ENV SCALA_HOME /usr/local/scala-2.11.6
ENV PATH $PATH:$SCALA_HOME/bin

# install pyspark & config PATH
ADD ./spark-2.2.2-bin-hadoop2.7.tgz /usr/local/
ENV SPARK_HOME /usr/local/spark-2.2.2-bin-hadoop2.7
ENV PATH $PATH:$SPARK_HOME/bin
# related configuration
COPY ./spark-env.sh /usr/local/spark-2.2.2-bin-hadoop2.7/conf
# ENV HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_HOME/lib/native
# ENV HADOOP_OPTS "-Djava.library.path=$HADOOP_HOME/lib"
COPY ./yarn-site.xml /usr/local/hadoop-2.8.5/etc/hadoop/yarn-site.xml 
