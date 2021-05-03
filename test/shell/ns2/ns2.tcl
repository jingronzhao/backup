#create a simulator object     /创建模拟器对象

set ns [new Simulator];      #模拟器对象赋值给变量ns

 

#Define different colors for data flows (for NAM)   

$ns color 1 Yellow                                   

$ns color 2 Purple      

#给NAM定义不同的数据流

 

#Open the NAM trace file

set nf [open out.nam w];    #打开out.nam文件，一般都是在执行程序的时候自动生成的

$ns namtrace-all $nf

 

#Open the Trace file

set tf [open out.tr w];  #打开out.tr文件

$ns trace-all $tf

#两个文件主要都是用来记录封包传输过程的

 

#Define a  'finish' procedure   /定义finish程序，在后面执行的时候会用到

proc finish {} {

    global ns nf tf

    $ns flush-trace

    close $nf;       #关闭nam文件

    close $tf;      #关闭trace 文件 (在后面调用的时候，是在程序结束的时候，所以前面生成的两个文件必须要关闭)

    exec nam out.nam &  

#以后台方式执行nam

   exit 0

}

 

#Create six nodes      /创建六个节点 ,从n0到n5

set n0 [$ns node]

set n1 [$ns node]

set n2 [$ns node]

set n3 [$ns node]

set n4 [$ns node]

set n5 [$ns node]

 

#Create links between the nodes    /创建结点之间的链路，而链路的创建都是基于题目要求的基础之上

$ns duplex-link $n0 $n2 1.5Mb 10ms DropTail  /设置0、1结点之间的带宽为1.5MB，发送时延为10ms，采用DropTail(队尾丢弃算法)管理机制

$ns duplex-link $n0 $n4 1.5Mb 10ms DropTail

$ns duplex-link $n1 $n3 1.5Mb 10ms DropTail

$ns duplex-link $n1 $n5 1.5Mb 10ms DropTail

$ns duplex-link $n1 $n0 2Mb 20ms DropTail

 

#Give node position (for NAM)       /根据题目图示要求，给NAM创建的节点位置如下

$ns duplex-link-op $n2 $n0 orient right-down

$ns duplex-link-op $n4 $n0 orient right-up

$ns duplex-link-op $n0 $n1 orient right

$ns duplex-link-op $n0 $n1 orient right

$ns duplex-link-op $n1 $n3 orient right-up

$ns duplex-link-op $n1 $n5 orient right-down

 

#Set Queue Size of link (n0-n1) to 10  /设置n0到n1之间的队列大小为10个分组大小

$ns queue-limit $n1 $n0 10

 

#Setup a TCP connection   /建立TCP连接（FTP应用程序建构在TCP上）

set tcp [new Agent/TCP]

$tcp set class_ 2

$ns attach-agent $n2 $tcp  /在节点2使用TCP agent产生“tcp”发送TCP的封包

set sink [new Agent/TCPSink]

$ns attach-agent $n3 $sink   /在节点3使用TCP sink接收TCP的数据，并产生ACK返回发送端，最后释放接收的TCP封包

$ns connect $tcp $sink     /连接2个agent，建立联机

$tcp set fid_ 1;     #NAM中，TCP的连接用×××的数据流表示

 

#Setup a UDP connection     /建立UDP连接，CBR应用程序建构在UDP上

set udp [new Agent/UDP]

$ns attach-agent $n4 $udp  /节点4使用UDP agent产生“udp”发送UDP的封包

set null [new Agent/Null]

$ns attach-agent $n3 $null

set null [new Agent/Null]

$ns attach-agent $n5 $null

$ns connect $udp $null

$udp set fid_ 2;     #NAM中，UDP的连接用紫色的数据流表示

#TCP与UDP的建立中，agent是一个代理，用来作为网络层的传输与接收

 

#Setup a FTP over TCP connection       /在TCP连接上建立FTP

set ftp [new Application/FTP]

$ftp attach-agent $tcp

$ftp set type_ FTP

 

#Setup a CBR over UDP connection   /在UDP连接上建立CBR

set cbr [new Application/Traffic/CBR]

$cbr attach-agent $udp

$cbr set type_ CBR

$cbr set packet_size_ 1000   /设置一个封包有为1000个字节

$cbr set rate_ 1mb

$cbr set random_ false   

#设置了cbr流量的包类型，字节大小，以及传输速率

 

#Schedule events for the CBR and FTP agents /设置FTP和CBR起止时间

$ns at 0.1 "$cbr start";  #0.1秒产生cbr流量   

$ns at 1.0 "$ftp start";  #1.0秒发送ftp流量

$ns at 8.0 "$ftp stop" ;  #8.0秒ftp流量结束

$ns at 12.0 "$cbr stop";  #12.0秒cbr流量结束

 

#Call the finish procedure after 13 seconds of simulation time   /13秒后调用前面写出的finish程序

 

$ns at 13.0 "finish"

 

#Run the simulation /执行模拟器程序

$ns run
