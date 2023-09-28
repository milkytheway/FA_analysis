1.将代码添加到Matlab路径: 主页->设置路径->添加文件夹->选择本代码所在的文件夹->保存

2.将包含数据的Excel文件命名为’RAW DATA‘,并放置到该文件夹

3.在Matlab命令行输入‘cal’指令开始进行数据处理

4.在输出的结果中,FWHM_cherry、FWHM_gfp、value_cherry、value_gfp、ratio代表:m_cherry, gfp的半高宽、m_cherry,gfp半高宽范围内的灰度值平均(有多组数据时,结果有多个值,每个值代表一组数据里的平均值),ratio代表每组数据里m_cherry和gpf平均值的比例(也是有多个值).