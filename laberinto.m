function M = laberinto1 (m)
n=2*m+3;
%0: muralla
%1: pasillo
%3: visitado
%2: no visitado
M=2*ones(n,n);
M([1 2:2:end end],:)=0;
M(:,[1 2 :2 :end end])=0;

b=[-1 0 1 0; 0 1 0 -1];

i=3;
j=3;

viendo=[i;j];

M(i,j)=3;
V=viendo;

while(~isempty(V))
    x=su(b,viendo);
    vec_no=hay(x,M)
    
    if(~isempty(vec_no))
        vecino=vec_no(randi(size(vec_no),1));
        M(viendo(1)+b(1,vecino),viendo(2)+b(2,vecino))=1;
        
        v1=x(:,vecino);
        if(~isempty(hay(su(b,v1),M)))
            V=[V v1];
        end
        viendo=v1;
        M(viendo(1),viendo(2))=3;
    else
        if size(V)>1
            viendo=V(:,1);
        else
            viendo=[];
        end
        V=V(:,2:end);
    end
end
    for i=1:size(M)
        for j= 1:size(M)
            if M(i,j)~=0
                M(i,j)=1;
            end
        end
    end
    M(3,2)=1;
    M(3,1)=1;

end
