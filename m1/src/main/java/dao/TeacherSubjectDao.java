package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBUtil;

public class TeacherSubjectDao {
	// teacher 별로 subject 출력
	public String selectTeacherSubject(int teacherNo) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT nvl(GROUP_CONCAT(s.subject_name), '없음') subjectName\r\n"
				+ "FROM teacher_subject ts inner join subject s\r\n"
				+ "						ON ts.subject_no = s.subject_no\r\n"
				+ "WHERE ts.teacher_no = ?\r\n"
				+ "GROUP BY ts.teacher_no";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, teacherNo);
		ResultSet rs = stmt.executeQuery();
		String subjectName = "없음";
		if (rs.next()) {
			subjectName = rs.getString("subjectName");
		}
		return subjectName;
	}
}
