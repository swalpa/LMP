function [ dilation erosion opened closed ] = LMP( im )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%MATLAB code for dilation,erosion,opening and closing of image
    f1=double(im);
    f=f1(:,:,1);
    % subplot(2,3,1);
    % imshow(uint8(f));
    % title('Original image');
    [x,y]=size(f);
    p=zeros(x,y);
    p2=zeros(x,y);
    p12=zeros(x,y);
    p13=zeros(x,y);

    %Dilation
    w=[1 1 1; 1 1 1; 1 1 1];
    for s=2:x-2
        for t=2:y-2
            w1=[f(s-1,t-1)*w(1) f(s-1,t)*w(2) f(s-1,t+1)*w(3) f(s,t-1)*w(4) f(s,t)*w(5) f(s,t+1)*w(6) f(s+1,t-1)*w(7) f(s+1,t)*w(8) f(s+1,t+1)*w(9)];
            p(s,t)=max(w1);
        end
    end
    dilation = p;
    % subplot(2,3,2);
    % imshow(uint8(p));
    % title('Dilated image');

    %erosion
    w=[1 1 1; 1 1 1; 1 1 1];
    for s=2:x-1
        for t=2:y-1
            w12=[f(s-1,t-1)*w(1) f(s-1,t)*w(2) f(s-1,t+1)*w(3) f(s,t-1)*w(4) f(s,t)*w(5) f(s,t+1)*w(6) f(s+1,t-1)*w(7) f(s+1,t)*w(8) f(s+1,t+1)*w(9)];
            p1(s,t)=min(w12);
        end
    end
    erosion = p1;
    % subplot(2,3,3);
    % imshow(uint8(p1));
    % title('Eroded image');

    %Opening of image
    [m,n]=size(p);
    w=[1 1 1; 1 1 1; 1 1 1];
    for s=2:m-1
        for t=2:n-1
            w13=[p(s-1,t-1)*w(1) p(s-1,t)*w(2) p(s-1,t+1)*w(3) p(s,t-1)*w(4) p(s,t)*w(5) p(s,t+1)*w(6) p(s+1,t-1)*w(7) p(s+1,t)*w(8) p(s+1,t+1)*w(9)];
            p12(s,t)=min(w13);
        end
    end
    opened = p12;
    % subplot(2,3,4);
    % imshow(uint8(p12));
    % title('opening of image');

    %Closing of image

    [r,c]=size(p1);
    w=[1 1 1; 1 1 1; 1 1 1];
    for s=2:r-1
        for t=2:c-1
            w14=[p1(s-1,t-1)*w(1) p1(s-1,t)*w(2) p1(s-1,t+1)*w(3) p1(s,t-1)*w(4) p1(s,t)*w(5) p1(s,t+1)*w(6) p1(s+1,t-1)*w(7) p1(s+1,t)*w(8) p1(s+1,t+1)*w(9)];
            p13(s,t)=min(w14);
        end
    end
    closed = p13;
    % subplot(2,3,5);
    % imshow(uint8(p13));
    % title('Closing of image');

end

