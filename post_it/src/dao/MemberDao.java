package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import vo.MemberVO;
import vo.PostVO;

public class MemberDao extends ConnectDB{
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
/*	ȸ������
	1.�ߺ�üũ (isDuplicate) -> return boolean
	2. ȸ������
		-getMemberByEmail() ->return MemberVO
		-getAllMember()->return ArrayList<MemberVO>
	3.ȸ�����
		-insertUser(MemberVO vo)
		-deleteUser(String Email) ->post�� ���� �����
		-UpdateUser
		
		*/

	/////////////////// CHECK////////////////////
	public boolean isDuplicate(String email) throws SQLException {
		String sql = "select count(*) from member where email = ? ";
		getConn();
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, email);
		rs = pstmt.executeQuery();
		rs.next();
		int check = rs.getInt(1);
		if (check == 0) {
			return false;
		} else
			return true;
	}

	/////////// MEMBER CHECK/////////////////////
	public MemberVO getMemberByEmail(String email) {
		String sql = "SELECT * FROM MEMBER WHERE EMAIL =? ";
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			rs.next();
			return new MemberVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;

	}

	public ArrayList<MemberVO> getAllMember() {

		String sql = "select * from member";

		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			ArrayList<MemberVO> memberList = new ArrayList<>();

			while (rs.next()) {
				memberList.add(
						new MemberVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
			}
			return memberList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public HashMap<MemberVO, PostVO> getAllInfo() {

		String sql = "SELECT * FROM MEMBER M, POST P WHERE M.POST_ID=P.POST_ID";

		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			HashMap<MemberVO, PostVO> res = new HashMap<>();
			while (rs.next()) { 
				res.put(new MemberVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)),
						new PostVO(rs.getInt(6), rs.getString(7), rs.getInt(8),rs.getString(9)));
			}
			return res; // ?
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	////////////////// MEMBER JOIN,DELETE, UPDATE////////////////////
	public void insertUser(MemberVO vo) {
		String sql = "INSERT" + " INTO MEMBER (EMAIL,PASSWORD,NAME,POINT,POST_ID) " + " VALUES(?,?,?,?,?)";
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getName());
			pstmt.setInt(4, vo.getPoint());
			pstmt.setInt(5, vo.getPost_id());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// -deleteUser(String Email) ->post�� ���� �����
	public boolean deleteUser(String email) {
		String sql = "DELETE FROM MEMBER WHERE EMAIL =?";
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			int res = pstmt.executeUpdate();

			if (res > 0) {
				return true;
			} else
				return false;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean updatePassword(String email, String password) {
		String sql = "UPDATE MEMBER SET PASSWORD =? " + " where EMAIL=? ";
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, password);
			pstmt.setString(2, email);

			int res = pstmt.executeUpdate();

			if (res > 0) {
				return true;
			} else
				return false;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean addPoint(String email, int point) {
		String sql = "UPDATE MEMBER SET point =? " + " where EMAIL=? ";
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, point);
			pstmt.setString(2, email);

			int res = pstmt.executeUpdate();

			if (res > 0) {
				return true;
			} else
				return false;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}