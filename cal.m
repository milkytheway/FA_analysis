%运行该脚本
data=readtable("RAW DATA.xls");
data = table2array(data);
[FWHM_cherry,FWHM_gfp,value_cherry,value_gfp,ratio]=calculate(data);