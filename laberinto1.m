function M = laberinto1 (n)

M=2*ones(n,n);

i=randi([2 n-1]);
j=randi([2 n-1]);

mur={};


M(i,j)=1;
[M,mur]=paredes(M,mur,i,j);

while(~isempty(mur))
    [~,len]=size(mur);
    b=randi(len);
    k=mur{1,b};
    l=mur{2,b};
    if k-1>0 && k+1<=n && ((M(k-1,l)==1 && mod(M(k+1,l),2)==0) || (mod(M(k-1,l),2)==0 && M(k+1,l)==1))
        if ~((l-1>0 && M(k,l-1)==1) && (l+1<=n && M(k,l+1)==1))
            M(k,l)=1;
        end
    elseif l-1>0 && l+1<=n && ((M(k,l-1)==1 && mod(M(k,l+1),2)==0) || (mod(M(k,l-1),2)==0 && M(k,l+1)==1))
        if ~((k-1>0 && M(k-1,l)==1) && (k+1<=n && M(k+1,l)==1))
            M(k,l)=1;
        end
    end
    [M,mur]=paredes(M,mur,k,l);
    mur(:,b)=[];
end
for o=2:n-1
    if M(2,o)==1
        M(1,o)=1;
        break;
    elseif M(o,2)==1
        M(o,1)=1;
        break
    end
end
for o=n-1:-1:2
    if M(n-1,o)==1
        M(n,o)=1;
        break;
    elseif M(o,n-1)==1
        M(o,n)=1;
        break
    end
end
end
