package com.fatface.util;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableFont.FontName;
import jxl.write.WritableSheet;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import org.apache.log4j.Logger;

public class ExcelUtils {
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
    /**
     * 日志
     */
    private static Logger logger = Logger.getLogger(ExcelUtils.class);

    /**
     * @author zhenpengzhang
     * @param titleList 标题List
     * @param dataList 数据List，List有序，并且元素Map也要有序
     * @param res
     */
    public static void showExcel(String title, String[] titleList,
                                 List<Map<String, String>> dataList, HttpServletResponse res) {
        if (dataList == null || titleList == null) {
            return;
        }
        int datalistsize = 0;//数据list长度
        int collistsize = 0;//标题list长度
        collistsize = titleList.length;
        datalistsize = dataList.size();
        if (datalistsize == 0 || collistsize == 0) {
            return;
        }
        OutputStream out = null;
        try {
            String filedisplay = title+ sdf.format(new Date());
            res.reset();
            res.setContentType("application/octet-stream");
            res.setCharacterEncoding("UTF-8");
            res.setHeader("Content-Disposition", "attachment; filename=" + new String(filedisplay.getBytes(),
                    "ISO-8859-1") + ".xls");
            out = res.getOutputStream();
            jxl.write.WritableWorkbook wwb = Workbook.createWorkbook(out);
            toExcel(title , wwb, dataList, titleList);
            out.close();
        } catch (Exception e) {
            logger.debug("生成excel出错", e);
        }
    }

    /**
     * @author zhenpengzhang
     * @param wwb
     * @param dataList
     * @param titleList
     * @throws WriteException
     * 导出excel
     * @throws InvocationTargetException 
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
     */
    private static void toExcel(String thistitle , jxl.write.WritableWorkbook wwb, List<Map<String, String>> dataList,
                                String[] titleList) throws WriteException {
        /***********设置列宽*****************/
        /**************设置单元格字体***************/
        FontName 微软雅黑 =  WritableFont.createFont("微软雅黑") ;
        WritableFont NormalFont = new WritableFont(微软雅黑, 8);
        WritableFont BoldFont = new WritableFont(微软雅黑, 10, WritableFont.BOLD);
        WritableFont wf_title = new WritableFont(微软雅黑, 12,WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE); // 定义格式 字体 下划线 斜体 粗体 颜色

        /**************以下设置几种格式的单元格*************/
        //标题 - 
        WritableCellFormat wcf_title_t = new WritableCellFormat(wf_title); // 单元格定义  
        wcf_title_t.setBorder(Border.ALL, BorderLineStyle.THIN); //线条     
        wcf_title_t.setVerticalAlignment(VerticalAlignment.CENTRE); //垂直对齐     
        wcf_title_t.setAlignment(Alignment.CENTRE);
        wcf_title_t.setWrap(false); //是否换行     
        
        //用于标题列    
        WritableCellFormat wcf_title = new WritableCellFormat(BoldFont);
        wcf_title.setBorder(Border.ALL, BorderLineStyle.THIN); //线条     
        wcf_title.setVerticalAlignment(VerticalAlignment.CENTRE); //垂直对齐     
        wcf_title.setAlignment(Alignment.CENTRE); //水平对齐     
        wcf_title.setWrap(false); //是否换行     

        //用于正文左     
        WritableCellFormat wcf_left = new WritableCellFormat(NormalFont);
        wcf_left.setBorder(Border.ALL, BorderLineStyle.THIN); //线条     
        wcf_left.setVerticalAlignment(VerticalAlignment.CENTRE); //垂直对齐     
        wcf_left.setAlignment(Alignment.CENTRE);
        wcf_left.setWrap(false); //是否换行     

        //用于正文右     
        WritableCellFormat wcf_right = new WritableCellFormat(NormalFont);
        wcf_right.setBorder(Border.ALL, BorderLineStyle.THIN); //线条     
        wcf_right.setVerticalAlignment(VerticalAlignment.CENTRE); //垂直对齐     
        wcf_right.setAlignment(Alignment.CENTRE);
        wcf_right.setWrap(false); //是否换行     

        //用于跨行     
        WritableCellFormat wcf_merge = new WritableCellFormat(NormalFont);
        wcf_merge.setBorder(Border.ALL, BorderLineStyle.THIN); //线条     
        wcf_merge.setVerticalAlignment(VerticalAlignment.TOP); //垂直对齐     
        wcf_merge.setAlignment(Alignment.LEFT);
        wcf_merge.setWrap(true); //是否换行

        /**************单元格格式设置完成*******************/
        // 生成名为“第一页”的工作表，参数0表示这是第一页
        WritableSheet sheet = wwb.createSheet(thistitle, 0);
        sheet.addCell(new Label(0, 0, thistitle, wcf_title_t));
        //合： 第1列第1行  到 第13列第1行  
        int mergerTitles = 0 ;
        if(titleList!=null&&titleList.length>0){
            mergerTitles = titleList.length-1;
        }
        sheet.mergeCells(0, 0, mergerTitles, 0);   
        
        int titleIndex = 0;
        try {
            for (String title : titleList) {
                sheet.addCell(new Label(titleIndex, 1, title, wcf_title));
                sheet.setColumnView(titleIndex, 30);
                titleIndex++;
            }
            //正文
            int dataIndex = 2;
            for (Map<String, String> map : dataList) {
                int col = 0;
                for (Map.Entry<String, String> entry : map.entrySet()) {
                    sheet.addCell(new Label(col++, dataIndex, entry.getValue(), wcf_merge));
                }
                dataIndex++;
            }
            wwb.write();
            wwb.close();
        } catch (RowsExceededException e) {
            logger.error("列解析异常", e);
        } catch (IOException e) {
            logger.error("IO异常", e);
        }

    }

}
