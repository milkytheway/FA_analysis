function extract(A)
%用结构体储存excel数据，根据"color_axis"分类
for i=1:length(A(1,:))/2
    dataindex = find(~isnan(A(:,2*i-1)));
    
    data = [A(1:length(dataindex),2*i-1),A(1:length(dataindex),2*i)];
    
    str=['red_long.FA',num2str(i),'=[]',';'];
    evalin("base",str);
    
    for j=1:length(dataindex)
        d_str = num2str(data(j,:));
        str1=['red_long.FA',num2str(i),'(',num2str(j),',:)=[',d_str,'];'];
        evalin("base",str1);
    end
end

end