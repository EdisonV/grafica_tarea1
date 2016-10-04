function vec_no = hay (x,M)
[~,l]=size(x);
y=[];
    for a=1:l
        y=[y M(x(1,a),x(2,a))]
    end
    vec_no=find(y==2);
end
