function [m, l] = paredes (M,v,i,j)
[~,n]=size(M);
if i-1>1 && M(i-1,j)==2
    M(i-1,j)=0;
    v(:,end+1)={i-1,j};
end;
if i+1<n && M(i+1,j)==2
    M(i+1,j)=0;
    v(:,end+1)={i+1,j};
end;
if j-1>1 && M(i,j-1)==2
    M(i,j-1)=0;
    v(:,end+1)={i,j-1};
end;
if j+1<n && M(i, j+1)==2
    M(i,j+1)=0;
    v(:,end+1)={i,j+1};
end;
l=v;
m=M;
end
