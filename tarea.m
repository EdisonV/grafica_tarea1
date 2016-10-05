function m = solucion (g,dxy,in,out)
g=((in+out)/2)*g;
iter=2000;
[n, ~]=size(g);

p=1/dxy;
gxy=n*p; %numero de puntos en x e y
%parametro de sobrerrelajacion sucesiva
if dxy<=1
    gxy=5*gxy;
    dxy=5*dxy;
    iter=500;
    p=5*p;
%     in=10*in;
%     out=10*out;
end
w=4.0/(2.0+sqrt(4.0-(cos(pi/(gxy-1))+cos(pi/(gxy-1)))^2))
error=0.0001;
err=1;
count=0;
inxy=[];
outxy=[];
for i=1:n
    if g(1,i)~=0
        inxy=[1 i 1];
    end
    if g(i,1)~=0
        inxy=[i 1 2];
    end
    if g(n,i)~=0
        outxy=[n i 3];
    end
    if g(i,n)~=0
        outxy=[i n 4];
    end
end
inxy
outxy
m=zeros(gxy);
for i=0:n-1
    for j=0:n-1
        for k=1:p
            for l=1:p
                m(p*i+k,p*j+l)=g(i+1,j+1);
            end
        end
    end
end
m1=m;
while count<iter
    count=count+1
    for i=1:gxy
        for j=1:gxy
            if m1(i,j)~=0 && i>1 && j>1 && i<gxy && j<gxy
                r=(((m(i+1,j)+m(i-1,j)-2*m(i,j))/(dxy^2))+((m(i,j+1)+m(i,j-1)-2*m(i,j))/(dxy^2)))/4;
            elseif i<=p*inxy(1) && i>p*inxy(1)-p && j<=p*inxy(2) && j>p*inxy(2)-p && inxy(3)==1
                r=(((2*m(i-1,j)+2*in*dxy-2*m(i,j))/(dxy^2))+((m(i,j+1)+m(i,j-1)-2*m(i,j))/(dxy^2)))/4;
            elseif i<=p*inxy(1) && i>p*inxy(1)-p && j<=p*inxy(2) && j>p*inxy(2)-p && inxy(3)==2
                r=(((m(i+1,j)+m(i-1,j)-2*m(i,j))/(dxy^2))+((2*m(i,j+1)+in*2*dxy-2*m(i,j))/(dxy^2)))/4;
            elseif i<=outxy(1)*p && i>p*outxy(1)-p && j<=p*outxy(2) && j>p*outxy(2)-p && outxy(3)==3
                r=(((2*m(i+1,j)+2*out*dxy-2*m(i,j))/(dxy^2))+((m(i,j+1)+m(i,j-1)-2*m(i,j))/(dxy^2)))/4;
            elseif i<=p*outxy(1) && i>p*outxy(1)-p && j<=p*outxy(2) && j>p*outxy(2)-p && outxy(3)==4
                r=(((m(i+1,j)+m(i-1,j)-2*m(i,j))/(dxy^2))+((2*m(i,j-1)+out*2*dxy-2*m(i,j))/(dxy^2)))/4;
            end
            if m1(i,j)~=0
                m(i,j)=m(i,j)+w*r;
                err=abs(r);
            end
        end
    end
end
figure
imagesc(m);
end
