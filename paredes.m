function M = tarea (n)
%n=30
M=2*ones(n,n);

i=randi([2 n-1]);
j=randi([2 n-1]);
% i=1;
% j=fix(n/3);

mur={};

%inicio

M(i,j)=1;
[M,mur]=paredes(M,mur,i,j);
f=0;
%M

while(~isempty(mur))
    f=f+1;
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
%     M
%     mur

    %if (f==25)
     %  break;
    %end
  
end
