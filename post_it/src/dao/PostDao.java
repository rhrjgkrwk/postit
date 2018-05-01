package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import vo.PostVO;

public class PostDao extends ConnectDB {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public void addNewPost() { // ȸ�� ���Խ� �����Ǵ� POST
		// ȸ�����Խ� �����Ǵ� �⺻ ����Ʈ�̴�.
		// �ʱ� ������ 1
		// ������ �������� ���õȴ�.
		String sql = "INSERT" + " INTO POST (POST_ID, POST_CONTENT, POST_LEVEL, POST_COLOR) "
				+ " VALUES(POST_SEQ.NEXTVAL,?,?,?)";
		try {
			getConn();

			Random rd = new Random();
			String randomColor = "rgb(" + rd.nextInt(255) + "," + rd.nextInt(255) + "," + rd.nextInt(255) + ")";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ""); // title
			pstmt.setInt(2, 1); // content
			pstmt.setString(3, randomColor); // author = id
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void deletePost(int post_id) { // ȸ�� Ż��� ����Ʈ�� ���� �����.

		String sql = "DELETE FROM POST WHERE POST_ID = ?";
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	}

	public int getTotalCount() {
		String sql = "SELECT COUNT(*) FROM POST";
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int total = Integer.parseInt(rs.getString(1));
			System.out.println(total);
			return total;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return 0;
	}

	public ArrayList<PostVO> getAllPosts() { // ��� ����Ʈ�� �����´�.
		String sql = "SELECT * FROM POST";
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<PostVO> postList = new ArrayList<>();
			while (rs.next()) {
				postList.add(new PostVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4)));
			}

			return postList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public PostVO getPost(int post_id) {
		String sql = "SELECT * FROM POST WHERE POST_ID = ?";
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return new PostVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

	public void updatePost(PostVO post) { // post content�� color�� �����Ѵ�.

		String sql = "UPDATE POST SET POST_CONTENT=?, POST_COLOR=? WHERE POST_ID = ?";
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, post.getPost_content());
			pstmt.setString(2, post.getPost_color());
			pstmt.setInt(3, post.getPost_id());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	}

	public void updatePostLevel(int post_id, int post_level) { // post level��
																// ���׷��̵��Ѵ�.
		String sql = "UPDATE POST SET POST_LEVEL=? WHERE POST_ID = ?";
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_level);
			pstmt.setInt(2, post_id);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	}
}
