function [FWHM_cherry,FWHM_gfp,value_cherry,value_gfp,ratio]=calculate(data)
num = length(data(1,:));
num = num/3;

FWHM_cherry = zeros(num,1);
value_cherry = zeros(num,1);
FWHM_gfp = zeros(num,1);
value_gfp = zeros(num,1);
for i=1:num
    [row,~] = find(~isnan(data(:,3*i-2:i*3)));
    d=data(1:max(row),3*i-2:i*3);
    d(:,1) = d(:,1)/max(d(:,1));
    intp = interp1(d(:,1),[d(:,2),d(:,3)],0:0.002:1,'spline');
    
    x = 0:0.002:1;
    y = intp(:,1);
    z = intp(:,2);


    [row1,~] = find(z>(max(z)-min(z))/2);
    FWHM_cherry(i) = x(max(row1))-x(min(row1));
    value_cherry(i) = mean(y(min(row1):max(row1)));

    [row2,~] = find(y>(max(y)-min(y))/2);
%     if x(min(row2))<x(min(row1)) || x(max(row2))>x(max(row1))
        FWHM_gfp(i) = x(max(row2))-x(min(row2));
%     end
    value_gfp(i) = mean([y(max(row1):max(row2));y(min(row2):min(row1))]);
 
%     while 1
%        figure()
%        plot(x(min(row1):max(row1)),y(min(row1):max(row1)),'r');
% 
%        hold on
%        plot(x(max(row1):max(row2)),y(max(row1):max(row2)),'b')
%        plot(x(min(row2):min(row1)),y(min(row2):min(row1)),'k') 
%        plot(x,z); 
%        break 
%     end 
end
ratio = value_cherry./value_gfp;
end