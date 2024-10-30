package frmQLCafe;

import java.awt.EventQueue;
import java.io.Serializable;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import java.awt.Color;
import java.awt.Font;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.JScrollPane;
import javax.swing.table.DefaultTableModel;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class frmQuanLyKhoHang extends JFrame implements Serializable {

    private static final long serialVersionUID = 1L;
    private JTable tableKhoHang;
    private JTextField txtTimKiem;
    private JLabel lblSoLuongSanPham;
    private JTextField txtSoLuongMoi;

    private static final String URL = "jdbc:mariadb://localhost:3306/cafe";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    frmQuanLyKhoHang window = new frmQuanLyKhoHang();
                    window.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    public frmQuanLyKhoHang() {
        getContentPane().setBackground(new Color(255, 255, 255));
        initialize();
        loadKhoHangData("");
    }

    private void initialize() {
        setTitle("Form Quản Lý Kho Hàng");
        setSize(707, 593);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        getContentPane().setLayout(null);

        JPanel panel = new JPanel();
        panel.setBounds(0, 0, 693, 51);
        panel.setLayout(null);
        panel.setBackground(Color.BLACK);
        getContentPane().add(panel);

        JLabel lblNhnVin = new JLabel("KHO HÀNG");
        lblNhnVin.setForeground(Color.WHITE);
        lblNhnVin.setFont(new Font("Tahoma", Font.BOLD, 20));
        lblNhnVin.setBounds(281, 10, 121, 31);
        panel.add(lblNhnVin);

        JScrollPane scrollPane = new JScrollPane();
        scrollPane.setBounds(10, 115, 676, 395);
        getContentPane().add(scrollPane);

        tableKhoHang = new JTable();
        tableKhoHang.setBackground(new Color(242, 242, 242));
        scrollPane.setViewportView(tableKhoHang);

        txtTimKiem = new JTextField();
        txtTimKiem.setColumns(10);
        txtTimKiem.setBounds(252, 75, 314, 19);
        getContentPane().add(txtTimKiem);

        JLabel lblNewLabel_1_1_1_1_1_1 = new JLabel("Tìm kiếm theo tên:");
        lblNewLabel_1_1_1_1_1_1.setForeground(Color.BLACK);
        lblNewLabel_1_1_1_1_1_1.setFont(new Font("Tahoma", Font.BOLD, 12));
        lblNewLabel_1_1_1_1_1_1.setBounds(115, 72, 127, 22);
        getContentPane().add(lblNewLabel_1_1_1_1_1_1);

        lblSoLuongSanPham = new JLabel("Tổng số lượng sản phẩm: 0");
        lblSoLuongSanPham.setForeground(Color.BLACK);
        lblSoLuongSanPham.setFont(new Font("Tahoma", Font.BOLD, 12));
        lblSoLuongSanPham.setBounds(20, 523, 200, 20);
        getContentPane().add(lblSoLuongSanPham);

        JLabel lblSoLuongMoi = new JLabel("Số lượng mới:");
        lblSoLuongMoi.setBounds(230, 523, 100, 20);
        getContentPane().add(lblSoLuongMoi);

        txtSoLuongMoi = new JTextField();
        txtSoLuongMoi.setBounds(330, 520, 100, 27);
        getContentPane().add(txtSoLuongMoi);

        JButton btnCapNhat = new JButton("Cập nhật");
        btnCapNhat.setBackground(new Color(0, 0, 0));
        btnCapNhat.setForeground(new Color(255, 255, 255));
        btnCapNhat.setBounds(466, 520, 100, 27);
        btnCapNhat.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                int selectedRow = tableKhoHang.getSelectedRow();
                if (selectedRow != -1) {
                    int maKhoHang = (int) tableKhoHang.getValueAt(selectedRow, 0);
                    try {
                        int soLuongMoi = Integer.parseInt(txtSoLuongMoi.getText());
                        capNhatSoLuongSanPham(maKhoHang, soLuongMoi);
                    } catch (NumberFormatException ex) {
                        JOptionPane.showMessageDialog(frmQuanLyKhoHang.this, "Số lượng mới không hợp lệ.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                    }
                } else {
                    JOptionPane.showMessageDialog(frmQuanLyKhoHang.this, "Vui lòng chọn một sản phẩm.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                }
            }
        });
        getContentPane().add(btnCapNhat);

        JButton btnThoat = new JButton("Thoát");
        btnThoat.setForeground(Color.WHITE);
        btnThoat.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnThoat.setBackground(Color.BLACK);
        btnThoat.setBounds(588, 520, 84, 27);
        getContentPane().add(btnThoat);
        btnThoat.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                int confirm = JOptionPane.showConfirmDialog(null, "Bạn có chắc chắn muốn thoát không?", "Xác nhận thoát", JOptionPane.YES_NO_OPTION);
                if (confirm == JOptionPane.YES_OPTION) {
                    dispose();
                }
            }
        });

        txtTimKiem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String searchText = txtTimKiem.getText();
                loadKhoHangData(searchText);
            }
        });
    }

    private void loadKhoHangData(String searchText) {
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("Mã Kho Hàng");
        model.addColumn("Mã Sản Phẩm");
        model.addColumn("Tên Sản Phẩm");
        model.addColumn("Số Lượng");
        model.addColumn("Ngày Nhập Hàng");

        int totalProducts = 0;

        try {
            Connection conn = getConnection();
            if (conn != null) {
                String query = "SELECT k.MaKhoHang, k.MaSanPham, s.Ten AS TenSanPham, k.SoLuong, k.NgayNhapHang " +
                        "FROM khohang k " +
                        "JOIN sanpham s ON k.MaSanPham = s.MaSanPham";
                if (searchText != null && !searchText.trim().isEmpty()) {
                    query += " WHERE s.Ten LIKE '%" + searchText + "%'";
                }
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                boolean found = false; // Biến kiểm tra xem có sản phẩm được tìm thấy không
                while (rs.next()) {
                    found = true;
                    int maKhoHang = rs.getInt("MaKhoHang");
                    int maSanPham = rs.getInt("MaSanPham");
                    String tenSanPham = rs.getString("TenSanPham");
                    int soLuong = rs.getInt("SoLuong");
                    String ngayNhapHang = rs.getString("NgayNhapHang");
                    model.addRow(new Object[]{maKhoHang, maSanPham, tenSanPham, soLuong, ngayNhapHang});
                    totalProducts += soLuong;
                }
                rs.close();
                stmt.close();
                conn.close();

                if (!found) {
                    JOptionPane.showMessageDialog(frmQuanLyKhoHang.this, "Không tìm thấy sản phẩm.", "Thông báo", JOptionPane.INFORMATION_MESSAGE);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        tableKhoHang.setModel(model);
        lblSoLuongSanPham.setText("Tổng số lượng sản phẩm: " + totalProducts);
    }

    private void capNhatSoLuongSanPham(int maKhoHang, int soLuongMoi) {
        try {
            Connection conn = getConnection();
            if (conn != null) {
                String query = "UPDATE khohang SET SoLuong = ? WHERE MaKhoHang = ?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, soLuongMoi);
                pstmt.setInt(2, maKhoHang);
                pstmt.executeUpdate();
                pstmt.close();
                conn.close();
                JOptionPane.showMessageDialog(this, "Cập nhật số lượng thành công.", "Thông báo", JOptionPane.INFORMATION_MESSAGE);
                loadKhoHangData(txtTimKiem.getText());
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Cập nhật số lượng thất bại.", "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
    }

    private Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Phương thức để thêm sản phẩm mới vào kho hàng
    public void themSanPhamVaoKho(int maSanPham, int soLuong) {
        try {
            Connection conn = getConnection();
            if (conn != null) {
                String query = "INSERT INTO khohang (MaSanPham, SoLuong, NgayNhapHang) VALUES (?, ?, NOW())";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, maSanPham);
                pstmt.setInt(2, soLuong);
                pstmt.executeUpdate();
                pstmt.close();
                conn.close();
                loadKhoHangData("");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Thêm sản phẩm mới vào kho hàng thất bại.", "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
    }

    // Phương thức để trừ số lượng sản phẩm trong kho hàng
    public void truSanPhamKho(int maSanPham, int soLuongBan) {
        try {
            Connection conn = getConnection();
            if (conn != null) {
                String query = "UPDATE khohang SET SoLuong = SoLuong - ? WHERE MaSanPham = ?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, soLuongBan);
                pstmt.setInt(2, maSanPham);
                pstmt.executeUpdate();
                pstmt.close();
                conn.close();
                loadKhoHangData("");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Trừ số lượng sản phẩm trong kho hàng thất bại.", "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
    }
}
