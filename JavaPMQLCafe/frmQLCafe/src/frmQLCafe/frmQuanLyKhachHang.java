
package frmQLCafe;

import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import java.awt.Color;
import java.awt.Font;
import javax.swing.JPanel;
import java.awt.FlowLayout;

public class frmQuanLyKhachHang extends JFrame {
	private static final long serialVersionUID = 1L;
    private JTable table;
    private JTextField txtTenKhachHang;
    private JTextField txtSoDienThoai;
    private DefaultTableModel tableModel;
    private Object parent;

    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    frmQuanLyKhachHang window = new frmQuanLyKhachHang();
                    window.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    public frmQuanLyKhachHang() {
    	getContentPane().setBackground(new Color(255, 255, 255));
        initialize();
        loadData();
    }

    public frmQuanLyKhachHang(frmQuanLyDatBan parent, String soDienThoai) {
        this.parent = parent;
        initialize();
        txtSoDienThoai.setText(soDienThoai);
        loadData();
    }

    // Thêm constructor mới để nhận đối tượng frmQuanLyThanhToan
    public frmQuanLyKhachHang(frmQuanLyThanhToan parent) {
        this.parent = parent;
        initialize();
        loadData();
    }

    private void initialize() {
        setTitle("Quản Lý Khách Hàng");
        setBounds(100, 100, 600, 481);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        getContentPane().setLayout(null);
        setResizable(false); // Không cho phép thay đổi kích thước
        setLocationRelativeTo(null); // Căn giữa màn hình

        JLabel lblTenKhachHang = new JLabel("Tên Khách Hàng");
        lblTenKhachHang.setBounds(10, 56, 100, 14);
        getContentPane().add(lblTenKhachHang);

        txtTenKhachHang = new JTextField();
        txtTenKhachHang.setBounds(120, 54, 150, 20);
        getContentPane().add(txtTenKhachHang);
        txtTenKhachHang.setColumns(10);

        JLabel lblSoDienThoai = new JLabel("Số Điện Thoại");
        lblSoDienThoai.setBounds(10, 95, 100, 14);
        getContentPane().add(lblSoDienThoai);

        txtSoDienThoai = new JTextField();
        txtSoDienThoai.setBounds(120, 93, 150, 20);
        getContentPane().add(txtSoDienThoai);
        txtSoDienThoai.setColumns(10);

        JButton btnThem = new JButton("Thêm");
        btnThem.setBackground(new Color(0, 0, 0));
        btnThem.setForeground(new Color(255, 255, 255));
        btnThem.setBounds(10, 134, 89, 23);
        getContentPane().add(btnThem);

        JButton btnSua = new JButton("Sửa");
        btnSua.setForeground(new Color(255, 255, 255));
        btnSua.setBackground(new Color(0, 0, 0));
        btnSua.setBounds(109, 134, 89, 23);
        getContentPane().add(btnSua);

        JButton btnXoa = new JButton("Xóa");
        btnXoa.setForeground(new Color(255, 255, 255));
        btnXoa.setBackground(new Color(0, 0, 0));
        btnXoa.setBounds(208, 134, 89, 23);
        getContentPane().add(btnXoa);

        JScrollPane scrollPane = new JScrollPane();
        scrollPane.setBounds(10, 177, 564, 216);
        getContentPane().add(scrollPane);

        table = new JTable();
        tableModel = new DefaultTableModel(
                new Object[][] {},
                new String[] {
                        "Mã Khách Hàng", "Tên Khách Hàng", "Số Điện Thoại"
                }
        );
        table.setModel(tableModel);
        scrollPane.setViewportView(table);
        
        JButton btnThoat = new JButton("Thoát ");
        btnThoat.setForeground(Color.WHITE);
        btnThoat.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnThoat.setBackground(Color.BLACK);
        btnThoat.setBounds(490, 403, 84, 29);
        getContentPane().add(btnThoat);
        btnThoat.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                int confirm = JOptionPane.showConfirmDialog(null, "Bạn có chắc chắn muốn thoát không?", "Xác nhận thoát", JOptionPane.YES_NO_OPTION);
                if (confirm == JOptionPane.YES_OPTION) {
                    dispose();
                }
            }
        });
        
        JPanel panel = new JPanel();
        panel.setBackground(Color.BLACK);
        panel.setBounds(0, 0, 586, 35);
        getContentPane().add(panel);
        panel.setLayout(new FlowLayout(FlowLayout.CENTER));
        
        JLabel lblKhchHng = new JLabel("KHÁCH HÀNG");
        lblKhchHng.setForeground(Color.WHITE);
        lblKhchHng.setFont(new Font("Tahoma", Font.BOLD, 20));
        panel.add(lblKhchHng);

        btnThem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String tenKH = txtTenKhachHang.getText();
                String sdt = txtSoDienThoai.getText();
                if (tenKH.isEmpty() || sdt.isEmpty()) {
                    JOptionPane.showMessageDialog(null, "Vui lòng nhập đầy đủ thông tin khách hàng.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                } else {
                    try {
                        Connection conn = DatabaseConnection.getConnection();
                        String query = "INSERT INTO khachhang (Ten, DienThoai) VALUES (?, ?)";
                        PreparedStatement pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, tenKH);
                        pstmt.setString(2, sdt);
                        pstmt.executeUpdate();
                        loadData();
                        if (parent instanceof frmQuanLyDatBan) {
                            ((frmQuanLyDatBan) parent).setNewCustomerInfo(tenKH, sdt);
                        } else if (parent instanceof frmQuanLyThanhToan) {
                            ((frmQuanLyThanhToan) parent).setNewCustomerInfo(tenKH, sdt);
                        }
                        dispose();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
            }
        });

        btnSua.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                int selectedRow = table.getSelectedRow();
                if (selectedRow != -1) {
                    String maKH = tableModel.getValueAt(selectedRow, 0).toString();
                    String tenKH = txtTenKhachHang.getText();
                    String sdt = txtSoDienThoai.getText();
                    if (tenKH.isEmpty() || sdt.isEmpty()) {
                        JOptionPane.showMessageDialog(null, "Vui lòng nhập đầy đủ thông tin khách hàng.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                    } else {
                        try {
                            Connection conn = DatabaseConnection.getConnection();
                            String query = "UPDATE khachhang SET Ten = ?, DienThoai = ? WHERE MaKhachHang = ?";
                            PreparedStatement pstmt = conn.prepareStatement(query);
                            pstmt.setString(1, tenKH);
                            pstmt.setString(2, sdt);
                            pstmt.setString(3, maKH);
                            pstmt.executeUpdate();
                            loadData();
                            if (parent instanceof frmQuanLyDatBan) {
                                ((frmQuanLyDatBan) parent).setNewCustomerInfo(tenKH, sdt);
                            } else if (parent instanceof frmQuanLyThanhToan) {
                                ((frmQuanLyThanhToan) parent).setNewCustomerInfo(tenKH, sdt);
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                } else {
                    JOptionPane.showMessageDialog(null, "Vui lòng chọn khách hàng cần sửa.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        btnXoa.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                int selectedRow = table.getSelectedRow();
                if (selectedRow != -1) {
                    String maKH = tableModel.getValueAt(selectedRow, 0).toString();
                    try {
                        Connection conn = DatabaseConnection.getConnection();
                        String query = "DELETE FROM khachhang WHERE MaKhachHang = ?";
                        PreparedStatement pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, maKH);
                        pstmt.executeUpdate();
                        loadData();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                } else {
                    JOptionPane.showMessageDialog(null, "Vui lòng chọn khách hàng cần xóa.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                }
            }
        });
    } // Add this closing brace for the initialize() method

    private void loadData() {
        try {
            Connection conn = DatabaseConnection.getConnection();
            String query = "SELECT * FROM khachhang";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            tableModel.setRowCount(0);
            while (rs.next()) {
                String maKH = rs.getString("MaKhachHang");
                String tenKH = rs.getString("Ten");
                String sdt = rs.getString("DienThoai");
                tableModel.addRow(new Object[]{maKH, tenKH, sdt});
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Lỗi kết nối cơ sở dữ liệu: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
            ex.printStackTrace();
        }
    }
}
