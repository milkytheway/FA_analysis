function cal_data = norm_size(data,points)
%输出为归一化的长度、灰度值平均、方差，输入为储存数据的结构体、需要插值的点的数量

%结构体转化为cell方便处理
data_cell = struct2cell(data);
%储存40个FA归一化后的数据
norm_data = zeros(points,2,length(data_cell));
%计算平均值，标准差
cal_data = zeros(points,3);

for i=1:length(data_cell)
    FA_data = data_cell{i,1};
%     FA_data(:,1) = normalize(FA_data(:,1),'range');
    FA_data = normalize(FA_data,'range');

    xq=0:(1/points):1-(1/points);
    %线性插值
    interp_data = interp1(FA_data(:,1),FA_data(:,2),xq,'linear');
    norm_data(:,1,i)=xq;
    norm_data(:,2,i)=interp_data;
end

%第一行为归一化的距离，从0-1；第二行为灰度值归一化后的平均值，从0-1；第三行
%为归一化数据的方差，归一化算法见：help normalize
cal_data(:,1) = xq;
for j=1:points
    cal_data(j,2) = mean(norm_data(j,2,:));
    cal_data(j,3) = std(norm_data(j,2,:));
end
end

