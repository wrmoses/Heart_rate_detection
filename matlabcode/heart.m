function mal=heart(y)
%y为数组，需要采集十秒300个数据之后才调用这个函数，mal为心率值，结果需要*60
    [ca1,~,~] =wden(y,'sqtwolog','s','one',1,'db5');
    cd1=y-ca1;
    [ca2,~,~] =wden(y,'sqtwolog','s','one',2,'db5');
    cd2=ca1-ca2;
    [ca3,~,~] =wden(y,'sqtwolog','s','one',3,'db5');
    cd3=ca2-ca3;

    N=300;        %样点个数
    fs=10;             %采样频率
    df=fs/(N-1);        %分辨率
    f=(0:N-1)*df;       %其中每点的频率

    cdf=cd2;
    G=fft(cdf(1:N))/N*2;  
    [~,mal]=findpeaks(abs(G(1:N/2)),f(1:N/2),'minpeakdistance',4.8);
end