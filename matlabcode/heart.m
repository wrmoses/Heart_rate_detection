function mal=heart(y)
%yΪ���飬��Ҫ�ɼ�ʮ��300������֮��ŵ������������malΪ����ֵ�������Ҫ*60
    [ca1,~,~] =wden(y,'sqtwolog','s','one',1,'db5');
    cd1=y-ca1;
    [ca2,~,~] =wden(y,'sqtwolog','s','one',2,'db5');
    cd2=ca1-ca2;
    [ca3,~,~] =wden(y,'sqtwolog','s','one',3,'db5');
    cd3=ca2-ca3;

    N=300;        %�������
    fs=10;             %����Ƶ��
    df=fs/(N-1);        %�ֱ���
    f=(0:N-1)*df;       %����ÿ���Ƶ��

    cdf=cd2;
    G=fft(cdf(1:N))/N*2;  
    [~,mal]=findpeaks(abs(G(1:N/2)),f(1:N/2),'minpeakdistance',4.8);
end