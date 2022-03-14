function ave=avegray(frame)
%frameΪ��ɫͼ��aveΪ����ĻҶȾ�ֵ�����������Ѿ��жԸ���Ȥ����ķָ�
%ʹ��һ�κ���ֻ�����һ��ֵ
    I=rgb2gray(frame);      %rgbת�Ҷ�ͼ
    BW=im2bw(I);             %������ֵֵ�任�����Ҷ�ͼ��ת���ɶ�����ͼ��
    [n1,n2]=size(BW);
    r=floor(n1/10);
    c=floor(n2/10);
    x1=1;x2=r;
    s=r*c;
    
    for i=1:10
        y1=1;y2=c;
        for j=1:10
            if(y2<=c || y2>=9*c) || (x1==1 || x2==r*10)
                loc=find(BW(x1:x2,y1:y2)==0);
                [o,~]=size(loc);
                pr=o*100/s;
                if pr<=100
                    BW(x1:x2,y1:y2)=0;
                    r1=x1;r2=x2;s1=y1;s2=y2;
                    pr1=0;
                end
            end
            y1=y1+c;
            y2=y2+c;
        end
        x1=x1+r;
        x2=x2+c;
    end
  
    L=bwlabel(BW,8);
    BB=regionprops(L,'BoundingBox');
    BB1=struct2cell(BB);
    BB2=cell2mat(BB1);

    [~,s2]=size(BB2);
    mx=0;
    for n=3:4:s2-1
        p=BB2(1,n)*BB2(1,n+1);
        if p>mx && (BB2(1,n)/BB2(1,n+1))<1.8
            mx=p;
            j=n;
        end
    end
   
      M= imcrop(frame,[BB2(1,j-2)+BB2(1,j+1)/5,BB2(1,j-1)*1.2,BB2(1,j)/2.5,BB2(1,j+1)/8]);
      g=M(:,:,2);
    ave=mean(mean(g));
end