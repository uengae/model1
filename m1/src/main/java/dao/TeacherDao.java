package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import util.DBUtil;
import vo.Teacher;
public class TeacherDao {
	// 강사 1명 상세보기, 수정 폼
	public Teacher selectTeacherOne(int teacherNo) throws Exception {
		Teacher teacher = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT teacher_no teacherNo, teacher_id teacherId, teacher_name teacherName, teacher_history teacherHistory, updatedate, createdate"
				+ " FROM teacher"
				+ " WHERE teacher_no= ?"; 
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, teacherNo);
		ResultSet rs = stmt.executeQuery();
		
		if (rs.next()) {
			teacher = new Teacher();
			teacher.setTeacherNo(rs.getInt("teacherNo"));
			teacher.setTeacherId(rs.getString("teacherId"));
			teacher.setTeacherName(rs.getString("teacherName"));
			teacher.setTeacherHistory(rs.getString("teacherHistory"));
			teacher.setUpdatedate(rs.getString("updatedate"));
			teacher.setCreatedate(rs.getString("createdate"));
		}
		return teacher;
	}
	// 수정 액션
	public int updateTeacher(Teacher teacher) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "UPDATE teacher SET teacher_id = ?, teacher_name = ?, teacher_history = ?, updatedate = NOW() WHERE teacher_no = ?"; 
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, teacher.getTeacherId());
		stmt.setString(2, teacher.getTeacherName());
		stmt.setString(3, teacher.getTeacherHistory());
		stmt.setInt(4, teacher.getTeacherNo());
		row = stmt.executeUpdate();
		return row;
	}
	// 입력 액션
	public int insertTeacher(Teacher teacher) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "INSERT INTO teacher(teacher_id, teacher_name, teacher_history, updatedate, createdate) VALUES(?, ?, ?, NOW(), NOW());"; 
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, teacher.getTeacherId());
		stmt.setString(2, teacher.getTeacherName());
		stmt.setString(3, teacher.getTeacherHistory());
		row = stmt.executeUpdate();
		return row;
	}
	// 삭제
	public int deleteTeacher(int teacherNo) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "DELETE FROM teacher WHERE teacher_no= ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, teacherNo);
		row = stmt.executeUpdate();
		return row;
	}
	// teacher 출력 메소드
	public ArrayList<HashMap<String, Object>> selectTeacherListByPage(int beginRow, int rowPerPage) throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT t.teacher_no teacherNo, t.teacher_id teacherId, t.teacher_name teacherName, nvl(GROUP_CONCAT(s.subject_name), '없음') subjectName\r\n"
				+ "FROM teacher t left outer JOIN teacher_subject ts\r\n"
				+ "					ON t.teacher_no = ts.teacher_no\r\n"
				+ "						left outer join subject s\r\n"
				+ "						ON ts.subject_no = s.subject_no\r\n"
				+ "GROUP BY t.teacher_no, t.teacher_id, t.teacher_name\r\n"
				+ "LIMIT ?, ?"; 
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("teacherNo", rs.getInt("teacherNo"));
			m.put("teacherId", rs.getString("teacherId"));
			m.put("teacherName", rs.getString("teacherName"));
			m.put("subjectName", rs.getString("subjectName"));
			list.add(m);
		}
		return list;
	}
	// teacher cnt 출력 메소드
	public int selectTeacherCnt () throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT COUNT(*) FROM teacher";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			row = rs.getInt("COUNT(*)");
		}
		return row;
	}
}
