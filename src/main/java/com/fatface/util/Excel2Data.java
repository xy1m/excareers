package com.fatface.util;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.apache.commons.lang.NumberUtils;

import com.amazonaws.util.StringUtils;
import com.google.common.base.Joiner;

public class Excel2Data {
	private static Workbook workbook;
	private static Connection conn = null;
	private static PreparedStatement ps = null;
	private static Map<String, String> map = new HashMap<String, String>();
	private static int giftColumn = -1;
	static {
		map.put("品类", "type");
		map.put("商品名称", "name");
		map.put("市场价", "pricem");
		map.put("双11价", "price11");
		map.put("双11T4会员价", "price11");
		map.put("折扣力度", "discount");
		map.put("商品详情链接", "link");
		map.put("商品详情页链接", "link");
		map.put("推荐理由", "suggestion");
		map.put("商家名称", "shopname");
		map.put("是否有赠品", "gift");
		map.put("赠品价值", "giftprice");
		map.put("专柜价", "pricem");
	}

	public static void main(String args[]) throws SQLException,
			ClassNotFoundException, IOException {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://192.168.1.100:3306/mole?useUnicode=true&characterEncoding=UTF-8";
		String user = "root";
		String password = "root";
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, password);
		readXLS("D://1.xls");
	}

	public static void readXLS(String filePatch) throws SQLException {
		if (!filePatch.endsWith(".xls")) {
			System.out.println("文件格式非法");
			return;
		}// end if
		File file = new File(filePatch);
		// 文件只读
		file.setReadOnly();
		int xxx = 0;
		try {
			// 得到Excel文件
			workbook = Workbook.getWorkbook(file);
			Set<Integer> set = new HashSet<Integer>();

			for (Sheet sheet : workbook.getSheets()) {
				int row = sheet.getRows(); // 工作表共有的行
				Cell[] column = sheet.getRow(0);
				ps = conn
						.prepareStatement(getSql(column, sheet.getName(), set));

				for (int i = 1; i < row; i++) {
					xxx = i;
					Cell[] cells = sheet.getRow(i); // 拿一行的内容
					ps.setString(1, sheet.getName());
					for (int j = 0; j < column.length; j++) {
						String ctt = cells[j].getContents();
						int x = j + 2;
						if (set.contains(j)) {
							if (NumberUtils.isNumber(ctt)) {
								ps.setObject(x, Float.parseFloat(ctt));
							} else {
								ps.setObject(x, -1.0);
							}
						} else {
							if (j == giftColumn) {
								ps.setObject(x, ctt.equals("是") ? 1 : 0);
							} else {
								ps.setObject(x, ctt);
							}
						}
					}
					ps.addBatch();
				}
				ps.executeBatch();
				ps.clearBatch();
				set.clear();
				giftColumn = -1;
			}
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (workbook != null) {
				workbook.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		// 还原文件状态
		file.canWrite();
	}

	private static String getSql(Cell[] column, String sheetName,
			Set<Integer> metion) {
		List<String> r = new ArrayList<String>();
		r.add("?");
		for (int i = 0; i < column.length; i++) {
			r.add("?");
		}
		List<String> p = new ArrayList<String>();
		p.add("category");

		StringBuilder sb = new StringBuilder();
		sb.append("insert into product (");
		for (int i = 0; i < column.length; i++) {
			Cell c = column[i];
			String colName = StringUtils.trim(c.getContents());
			String tName = map.get(colName);
			p.add(tName);
			if (tName.equals("pricem") || tName.equals("price11")
					|| tName.equals("giftprice")) {
				metion.add(i);
			}
			if (tName.equals("gift")) {
				giftColumn = i;
			}
		}
		sb.append(Joiner.on(",").join(p));
		sb.append(") values (");
		sb.append(Joiner.on(",").join(r));

		sb.append(")");
		String result = sb.toString();
		return result;
	}
}
